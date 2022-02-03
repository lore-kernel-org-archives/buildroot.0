Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822F1C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351DA60E41;
	Thu,  3 Feb 2022 23:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LEkr89m2tH4I; Thu,  3 Feb 2022 23:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A62760B47;
	Thu,  3 Feb 2022 23:16:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC3E51BF2F3
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA28E40128
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNNRV8DlNVu2 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:16:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50B0A400F6
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:16:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s10so5408529wra.5
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 15:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iAaDMkH5KpOA6aSYzUqSO1W4KXka88uSdNIDkKul4IY=;
 b=OxIXr9Ovwk8oYMe27Z4JvSiLfWEORkbZbwW1az7LFuQFhFzB6sLL4IbrYeCZsy+xc4
 4/taH2m3qYjY7e6o4jvvxZ5TmOokD3MkYpnnvoyLi4c2fHcDn4mxFo2j4fg3L54No0zK
 J4VEAWgBM39ZUd8uf4MyhM1xpxXrTRC3gGOunGa/VDMQUBc0rPyeAiSNteqv2E7GY4Vz
 SsHrVpDv+xEHNcQH6OZx+C+D/qp6QiAntGX4ivtQ8GElrLYyk5cQqVMvIFESQm3thmkl
 LgY5HiRyX8Ewn+szi7vJuwJIQN+Ck+rH7kHN6JooKRGSCNICpPZ/psood+efU9xbAQv4
 QQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iAaDMkH5KpOA6aSYzUqSO1W4KXka88uSdNIDkKul4IY=;
 b=NVbPBp4i0N1ko9KI0gS2XtQ8gdmm7CZ/NAjhs+mXkOYgPn1HQ7/h8HmsXjxIUhJt5I
 P5L+NvAPfgpCWcL25v7C5oCxwEkWGJTE9VHCaqziGBrXoH9aAloMzbnENVs3bRk3zwUv
 d/9gHUvfN4JT59DnkNtKzFzHfTjlZ26nyO+m+i1DZkfdG93lh2TrPX9l7HrYBYsCtJGy
 H/HTZ47RtAIPWqHkwO7pTlIZn59tZtkXxDHngKmgGg7m85yIAmtrghHtDCyy9c2MLPtx
 IVwjgrRI1wGdqgmUNFZKfKfynFkQoMeKfzu0ksRsCfLCibkRvlMP1f+119INgoY72/24
 MnAA==
X-Gm-Message-State: AOAM533smEsrMDjB0B141HUsBjSxsIiCxKfMRGiss4BbO5UtmRkwdBMN
 pG/Wy7QFsnm/VjTngcUGfH4JjCmpl0s=
X-Google-Smtp-Source: ABdhPJxt+0/usljuxKoure+ZDtYfsMa5l+2RYelMYMTOjcSVa9lsBrRCS51lqSMX/clP6Uy8yEE++w==
X-Received: by 2002:adf:ce0c:: with SMTP id p12mr143464wrn.491.1643930199184; 
 Thu, 03 Feb 2022 15:16:39 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id x5sm108411wmh.27.2022.02.03.15.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 15:16:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 00:14:32 +0100
Message-Id: <20220203231432.748145-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netcat-openbsd: bump to version
 1.218
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball so NETCAT_OPENBSD_VERSION will match what is
  returned by https://release-monitoring.org
- Use netcat.c as the license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netcat-openbsd/netcat-openbsd.hash | 9 ++++++---
 package/netcat-openbsd/netcat-openbsd.mk   | 9 +++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index b70cae8860..e55dea53e7 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,3 +1,6 @@
-# Locally calculated
-sha256  55e578f652cbf6ffc95f75ea3e2645ab335fab63649568bd7cdb0a6331ca87de  netcat-openbsd-debian_1.195-2-br1.tar.gz
-sha256  e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c  debian/copyright
+# From http://snapshot.debian.org/archive/debian/20211206T030211Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.218-3.dsc
+sha256  a28a5d39abaf481747b1e78b4b50e96d0cdab0ffef289cba156dc11941c64857  netcat-openbsd_1.218.orig.tar.gz
+sha256  19229ebc825d12cd805843228c498cc881dcef127a9d680fcfbd8cb2da966161  netcat-openbsd_1.218-3.debian.tar.xz
+
+# Hash for license file
+sha256  acfd1d822ee2e8e0b196c7a369383d0cb9bc131b56c3c95976a32498728fe1e3  netcat.c
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index a2333531c0..311f8aa819 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = debian/1.195-2
-NETCAT_OPENBSD_SITE = https://salsa.debian.org/debian/netcat-openbsd.git
-NETCAT_OPENBSD_SITE_METHOD = git
+NETCAT_OPENBSD_VERSION = 1.218
+NETCAT_OPENBSD_SOURCE = netcat-openbsd_$(NETCAT_OPENBSD_VERSION).orig.tar.gz
+NETCAT_OPENBSD_PATCH = netcat-openbsd_$(NETCAT_OPENBSD_VERSION)-3.debian.tar.xz
+NETCAT_OPENBSD_SITE = http://snapshot.debian.org/archive/debian/20211206T030211Z/pool/main/n/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
-NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
+NETCAT_OPENBSD_LICENSE_FILES = netcat.c
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
 
 define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
