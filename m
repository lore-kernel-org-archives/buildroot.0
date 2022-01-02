Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA976C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 17:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11DB060601;
	Sun,  2 Jan 2022 17:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHGXUF7e5iAf; Sun,  2 Jan 2022 17:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D1960AEA;
	Sun,  2 Jan 2022 17:44:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB181BF3FF
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B99F40175
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvsRRVRkg7ec for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 17:44:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A40754016D
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 17:44:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r17so65815433wrc.3
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 09:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mmik4TpBNqeXVeCZ7/g+2D+ca2BgkACl9PbSequLl7A=;
 b=HtM6xHx/hJbx7Y2TjEe4GX4ZYyQWsaATqCKI9d1252JhU5LwBlAUQcRJWsGo3yl+RG
 a535U8mk0TFZIYEuazw/TBRauvNZjPqK3gdkC+6+K/kalZgdKvPnjUG8XFSCSd02a7gR
 eJ5sjgOa1MYauKtDyPdyin55EGfHCbNBow6Tg26Eg3jEypfq+sR3InYO5Fo47kHs+cNd
 Rv7Db1JvCxKIrlX3srFA8SjlZmEqDAiOgV13E//O9YkMIQE+B2MyI4y4v9StsAkDHbqw
 fsa1SnYmTtHktvoVORt7Z/BHZcsJzGurnV7hSU0lgJjkWnYhNt2uEF0kN9qrqnPfaqCv
 Gzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mmik4TpBNqeXVeCZ7/g+2D+ca2BgkACl9PbSequLl7A=;
 b=GbW6az6n7judHwse//QTekfSMc7qmpHIv4VePC1oKqMnV8qxCIiwrrNnrQSTVsogR3
 CwQ1vA1I3cexA4Qw+isnZYCIZWyMaLBPNnSZOitxCFOO869T1l/sjrQF8/XnXNvGw/z+
 ipoYPj2KGljEIBil79bTt1H9wooV+oItgLC+f/QhTG0dQH+/VknKp9rtoEjvGqItkstL
 ieATxHKVmkkIu37px9caWXL++8gxagjOuxGiJ4s6FhvSwTeSw6oZJca6Cn3VHWk8Qc3U
 NdPxYweCcc9gjWHL+PBQprMCkEfhhhl9t9T3uqkKjTk2QcC5CTCeXSDPEGrXBB6XWUOo
 Dumw==
X-Gm-Message-State: AOAM5316GhTS9smQyu+RgOMSumM7w/F5ymV1rO5BCXDgCaRRpxR6PCHT
 L/9Ui3rmXB5BWvYKmDYAhGdR2WzHHD8=
X-Google-Smtp-Source: ABdhPJwk8G8Zi04+tbnAI5gHHIn8pmd26Q4Zh7NtYM2coPnw5dgDawiWIv+8GltgUTKOyK3PGdFr+A==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr36229825wrw.218.1641145465833; 
 Sun, 02 Jan 2022 09:44:25 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id n4sm33129564wrc.1.2022.01.02.09.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:44:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 18:43:29 +0100
Message-Id: <20220102174329.2823931-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libiio: set PYTHON_EXECUTABLE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set PYTHON_EXECUTABLE to avoid the following build failure when
BR2_PACKAGE_PYTHON is enabled but libiio finds python3 without
setuptools on host:

-- Found Python: /usr/bin/python3.5 (found version "3.5.3") found components: Interpreter
-- new
-- Python_EXECUTABLE /usr/bin/python3.5

[...]

Traceback (most recent call last):
  File "/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.23/bindings/python/setup.py", line 15, in <module>
    from setuptools import setup
ImportError: No module named 'setuptools'

Fixes:
 - http://autobuild.buildroot.org/results/d80e56e4ad84c8e7f244cf6d1cb96c116e8eb734

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiio/libiio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index f706298c22..38b2f83e6e 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -76,8 +76,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LIBIIO_DEPENDENCIES += host-python-setuptools python
+LIBIIO_CONF_OPTS += -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBIIO_DEPENDENCIES += host-python3-setuptools python3
+LIBIIO_CONF_OPTS += -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 endif
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
