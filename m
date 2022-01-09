Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EEFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B30281D98;
	Sun,  9 Jan 2022 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zk_7vvKXq3E; Sun,  9 Jan 2022 20:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A74BC813B7;
	Sun,  9 Jan 2022 20:03:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 269551BF20D
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1509D81D98
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdCqSm4mIcU7 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:02:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1332F8143B
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:02:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r10so15245087wrc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 12:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yV1QqPzQUrGcy4kN0OxKPrVLKoW0R601DWyOsDNxEhc=;
 b=U7o7gmCum6HKap5OEWVcnEywgg9v2hdIUF+ehkwI3Oou76V1yvU0fdY8Xin9/sinCz
 pAsZ3t5FNvAXdbJIuROhFtdaJvhhOhVRuOl2UoFjYzySziZKtkM6Nh8Icerqr2XDOKcI
 prOQKhM6P7tbdww8DVMkvqVG73dF5+mhDBM0nGgtb3NBkFTRNUx9tB+zTFmCybJggQgG
 isoI0P4guRtjN0E9QN6UTdk8huue8cK1aa9rpNSuSB6nq9qWB0QN0wuEuImZ76fR4ALu
 8NoROMXN7sxcfgYgy/rGBxQaBj4dpM3Nh524HkzTVs+T/E0wNxXHKZp8h5u9E4HBFRsV
 qkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yV1QqPzQUrGcy4kN0OxKPrVLKoW0R601DWyOsDNxEhc=;
 b=ya4WbgLldNiTUIoOW1H/H7UxG3vKlT++YA+NJt7KWHWNQY2Usas67BQyNyNYhP6iyZ
 36Wx84Sw0CwCGdRyk61aLDWj96Pib7UGoQzpadD1lz8ZSFNZM4wdSEDlyLNJeor/ZyYR
 n6vgtgM5NJOC3CeQg1gLofznILEv0hcaJVVTk3jbAqpxJyJ3Z0gsMFK5z3QC01aFuFue
 Fe7q3WZBVO6y9UXRDbovOODRKL4yOb91GfKHfnKDU5kzQkBD53L/5nCX/6k814UnBI6h
 1mTlVsr+KMyUcI3u3J2NBIxy7+zTlIsP6h59exqGnZAABxwC50R+qyibQnV2TBiHu2+i
 nN1A==
X-Gm-Message-State: AOAM533ml5QoQI2akxb66rprymE/IfRH2jONu4S3CzoafsNJrdzppPFB
 hHiAog7VxqEiqu6F/FS4Qkti5FtBcvU=
X-Google-Smtp-Source: ABdhPJwxktJ9HpU+hA9zU/ySa+NMqa9FyOwV/60j/EH9RcjJbkDjE6YKZEG2rJVwr8h44iJW0gGR6A==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr63220327wrc.642.1641758575154; 
 Sun, 09 Jan 2022 12:02:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z17sm2044678wrr.4.2022.01.09.12.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:02:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 21:00:39 +0100
Message-Id: <20220109200039.3188788-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109200039.3188788-1-fontaine.fabrice@gmail.com>
References: <20220109200039.3188788-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/libvirt: bump to version 7.10.0
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
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/libvirt/libvirt/-/blob/v7.10.0/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.hash | 2 +-
 package/libvirt/libvirt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
index e8cbb34e2a..de9ebff564 100644
--- a/package/libvirt/libvirt.hash
+++ b/package/libvirt/libvirt.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  1b616099c18d14b9424a622f2a0bd3e0cfa286414f3416bd1a8173621b2252b2  libvirt-7.7.0.tar.xz
+sha256  cb318014af097327928c6e3d72922e3be02a3e6401247b2aa52d9ab8e0b480f9  libvirt-7.10.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 816bb0760d..7b0ed5e52e 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVIRT_VERSION = 7.7.0
+LIBVIRT_VERSION = 7.10.0
 LIBVIRT_SITE = https://libvirt.org/sources
 LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
