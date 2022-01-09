Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7224C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62658199D;
	Sun,  9 Jan 2022 13:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rAqw0jsJEeH; Sun,  9 Jan 2022 13:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 764CB8186A;
	Sun,  9 Jan 2022 13:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7661BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2321340354
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpqEw4BGo6GY for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:08:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B6A4402BF
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:08:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q8so21455390wra.12
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 05:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSxljhoYZKdUr8et5+PnPDucHTkJe14WMzVvRAdEG1A=;
 b=EkvhKHVKeZCP54K7vKOqhpbyc0sim8F8e3dfCSh2w7ZNGwnHQrbvdV3E0feEVZkoQ3
 AzZGeIVl/ByLLPkF121zs67msqTUqS3dL6GAhB1CQNWZenDd122aOGlvRWs8W9Gn5V9N
 lPV9zAmLlq4HEobU1O50R1LA26yc9UNBdkpRQTlZ4+xfYcpIuKCOWJJSsnmeVwHCVS+M
 WBUQIhXAiOkWcBAZVHpsCqauoZa7WdQbj6V9rme2nZB9vQf01DGFsT13WO4f2fbrCLyn
 TJ+0pn3kpw+eiFjSoNgAZtLsDI5WXsW/RuGEHjVIaURZaZ8SdajW7B+tEpDhH70hwMUg
 7Iow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSxljhoYZKdUr8et5+PnPDucHTkJe14WMzVvRAdEG1A=;
 b=4JLObE3lEqK8ngjsJgn/96Hh0/3OmI/9h2crvMqwYE12V6/y90jpMwhwjryY/uQDuY
 JNpww0dcmxHvCh5SeImTzIx4qqPQn3uwQf8bu4QXJ74p7giDYYWa5DDF3EoGPwIKZiZ3
 DAMwcpP7zRNeUiZVsXihOAYMX+oJ+bffdO1OIV5spLO3A1gGLJamSBbH0Ovtj5QCE9Fo
 mlOTD63ClTvf7bA8X1nRsMuS876+neXCkyErd3P6DSUxJz5Hw/qMhMldcGNnJkzwJmfe
 6uMs3IYtQXKyCTHwBW9GlMULN8CoweBwo0ygu42CoCzWnuswTM2UMaHnQD2RiWwB+oGG
 a/+w==
X-Gm-Message-State: AOAM531miZuCSZm4Moy7QcgbjR5uw6MNC8it04iw81lk9J6FSUnTVDw3
 0OErz1Z4ZvX2VQPHjeAXVBNv0VLJ7t8=
X-Google-Smtp-Source: ABdhPJwiZwtZluZSzLUaeWu3Cf2lKXSoSTla7tPINyreUOglWw6XJSwxEJk63ORZB5yN/QV4E/8pDQ==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr62234352wrx.62.1641733722133; 
 Sun, 09 Jan 2022 05:08:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b14sm4112555wrg.15.2022.01.09.05.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 05:08:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 14:07:31 +0100
Message-Id: <20220109130732.430160-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/gupnp: bump to version 1.4.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.4.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 1825298f24..cc78be7d5d 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.4/gupnp-1.4.1.sha256sum:
-sha256  899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55345ab3281655dc0c  gupnp-1.4.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.4/gupnp-1.4.2.sha256sum:
+sha256  bcad92f2ee09d02f55e0f6ea480c475ed8a7523529263f7ce28013d3c263bacc  gupnp-1.4.2.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 02d9b289e0..aebf9225a8 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.4
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).2
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
