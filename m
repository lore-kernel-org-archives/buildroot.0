Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5CAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 12:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE6D440888;
	Sun,  6 Mar 2022 12:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1VITa_Ryavx; Sun,  6 Mar 2022 12:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 113B740869;
	Sun,  6 Mar 2022 12:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3FF91BF4D5
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 12:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3E528134A
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 12:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhic-b6Jy0oP for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 12:09:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 822698136A
 for <buildroot@busybox.net>; Sun,  6 Mar 2022 12:09:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j17so19296692wrc.0
 for <buildroot@busybox.net>; Sun, 06 Mar 2022 04:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1fpkfdO+N8bsHicXWkt698cpUvJSr59j8o8/QX+vCw=;
 b=Dl4hvrsEhlnkcy4FtnETXNnPLoxxqxzIJOBgOEDcySoSr5B1PUXCkK3g8RdnAHhpbr
 DPvvfvvpgiPPKx155urGLjpkVF2mQN59uLexz7UAk9lMi6bOPSq4oy4p364XfwX6j9ip
 KP3O2LVZwm+x8J4NTUnwNf0eJrBS9W0AykoyQE7toEDwDZZXNnZE4YX8ntJYeh1lWi2E
 dIeG7y59ez0i6La2yrOtBCbzWKsoWBa+NrrLneDzboCj7QBQ21X/ZqGWF6pIuY1oIP8w
 GbcuPW5ZNdF0BayWaAo2Ywmq4mn4Kb0M2TBbfJufM1bqGvDHsf53tfwpf7vyrAY9jiPR
 PtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1fpkfdO+N8bsHicXWkt698cpUvJSr59j8o8/QX+vCw=;
 b=PhMQDATYzmf2H5EqipVpnr33Ensi4tIvXCMho9XWOa9povnF2Wr77ZuYBWtrs9PbPE
 nT/AQa2VuxiiRRfayMJK0GcMjBROxW9MEcvSsbHfweL3uKpZddTfUXO4Snuh8M4XG08z
 dYorJQPObCx9j5z0tzq2k9msqOEJiNea4X7Kd6wPhuQ7x220x2VTJPqMazah3aUAO4tv
 9mWCOLV30XwhV01HOTHiXSbOmGiSlHeLoLaZ5Sp7bFK6pD2unFm78lUa0fvoUdheaLfw
 dEOgGA51Nt5GVCKq9o0DZ6xkamIJ4qysm8kfmUvVxfCGwY3K5ajqRIBZg/0IJRxM6QrC
 3zDQ==
X-Gm-Message-State: AOAM531tRf7PJ9M0sfQ2qznB7sHs44sKAZpThCrueSIaSv1dqTTZQNZl
 33p60c4ummShuve9W+j0+WCGv1TsKyc=
X-Google-Smtp-Source: ABdhPJxyPPOw+hYwb64Curq/0ti8/68BMeQB2CHY0qI/7x1rTCH+5BYvsUIWs93QnUspXvpSk1BPGQ==
X-Received: by 2002:adf:c04d:0:b0:1ed:c156:6651 with SMTP id
 c13-20020adfc04d000000b001edc1566651mr5283838wrf.558.1646568551416; 
 Sun, 06 Mar 2022 04:09:11 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x5-20020adfec05000000b001e58cc95affsm8781389wrn.38.2022.03.06.04.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 04:09:10 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  6 Mar 2022 13:09:02 +0100
Message-Id: <20220306120902.132254-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libxlst: security bump to version 1.1.35
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- fix CVE-2021-30560
- remove merged patch
- moved from xmlsoft.org to gnome.org

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ml2-config-check-in-configure-script.patch | 31 -------------------
 package/libxslt/libxslt.hash                  |  6 ++--
 package/libxslt/libxslt.mk                    |  5 +--
 3 files changed, 6 insertions(+), 36 deletions(-)
 delete mode 100644 package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch

diff --git a/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch b/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
deleted file mode 100644
index 3848dcb23..000000000
--- a/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Fri, 15 Nov 2019 11:53:11 +0100
-Subject: [PATCH] Fix xml2-config check in configure script
-
-A 'print' option has never been supported. After a recent change to
-libxml2, invalid options cause xml2-config to fail.
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/libxslt/-/commit/90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3da57b18..585b9d7c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -548,7 +548,7 @@ dnl make sure xml2-config is executable,
- dnl test version and init our variables
- dnl
- 
--if test "x$LIBXML_LIBS" = "x" && ${XML_CONFIG} --libs print > /dev/null 2>&1
-+if test "x$LIBXML_LIBS" = "x" && ${XML_CONFIG} --libs > /dev/null 2>&1
- then
-     AC_MSG_CHECKING(for libxml libraries >= $LIBXML_REQUIRED_VERSION)
-     XMLVERS=`$XML_CONFIG --version`
--- 
-GitLab
-
diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 25aa30839..39523a695 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256	98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f	libxslt-1.1.34.tar.gz
+# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.35.sha256sum
+sha256  8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79  libxslt-1.1.35.tar.xz
 
 # Hash for license file:
-sha256	7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819	COPYING
+sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index d0f79d252..9c7be6822 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.34
-LIBXSLT_SITE = http://xmlsoft.org/sources
+LIBXSLT_VERSION = 1.1.35
+LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
+LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
