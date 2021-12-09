Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FFAC433FE
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 21:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2004885B81;
	Thu,  9 Dec 2021 21:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYHv1XNiN7pq; Thu,  9 Dec 2021 21:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C33E85B83;
	Thu,  9 Dec 2021 21:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80DC51BF868
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 21:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DF1C4ECFE
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 21:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEoYsveZauM1 for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 21:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A42784ECFB
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 21:40:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t5so23565130edd.0
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 13:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sbrKSK/MqUQREYRN5YhR/bd5dWuQSYB3YxbcZdihYWY=;
 b=E6aBXNd/wAw63RtraLlihYMTfAUm2lCXkELODiGDlmu1BjtinwQoBT4o55B2EiwMPi
 i8AA6lIzcRC0wJbP0ZxI/caf79IwrGgSDe8sFSZP3+xne1cPJsUBxTsl5NOISJK/ikLA
 SgIn6owDznVZotbuYBlrRBlizUbgO1ShqlEZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sbrKSK/MqUQREYRN5YhR/bd5dWuQSYB3YxbcZdihYWY=;
 b=EYDilyrZOWEVuCubh9kGBCE5u5SahqhjtJF1vTSq+4uFVb5fL0fGXrJkN1N0uVd326
 ePrjJpoKwpJfMPWIjHXBeBws61L6uw7FOAHXTbGlyxCOGZyatqVqlsgw02wvX7h5lCm9
 am6HZ0KiMTRZYjEmC66W8hetEF1x4g34UfU1cn5Lswvl9uWyjD2tuAU5PJh79sYpIhFu
 Jlj6+tI+trRi7WaUofmwsPbThLPsFdzWuXD0DiXGrydJSWuoI8JsQWQxvkULeKTJR+Es
 wXOv2WLZYkzM8uNIn066nU6fpDBSa8h9TsZJIWtNd/Qx7HaXvi4fznSOHPHKLpL+4Tca
 s1QA==
X-Gm-Message-State: AOAM530WS3oslM9jX4G1VOO+4gdAYEH57qHD6rL2lE39XJ9O5i39mEtu
 efwz79+z3tvz+mEAFvM+jdSs2M4mSy0ULg==
X-Google-Smtp-Source: ABdhPJym70iJ6LKuFCKh2MQB3z9awnlOErvgrtcMG6pAD2bfGm7mHgVchrHrkotC/K7XQni9cdXuqA==
X-Received: by 2002:a17:907:7b98:: with SMTP id
 ne24mr20070245ejc.14.1639086049865; 
 Thu, 09 Dec 2021 13:40:49 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id p26sm418374edt.94.2021.12.09.13.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 13:40:49 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 22:40:46 +0100
Message-Id: <20211209214046.428061-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cups: bump to version 2.4.0
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updating attached patch and configure parameters to the latest
cups version.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 ...move-man-from-BUILDDIRS-in-configure.patch | 21 +++++++++++--------
 package/cups/cups.hash                        |  2 +-
 package/cups/cups.mk                          |  6 +++---
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
index 7fcf7133c8..6b81a93de2 100644
--- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -8,23 +8,26 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Michael: updated for 2.3.3]
 Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
+[Angelo: updated for 2.4.0]
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 ---
  config-scripts/cups-common.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
-index a460a73..d427acb 100644
+index 3a162b6d5..fb629fdfd 100644
 --- a/config-scripts/cups-common.m4
 +++ b/config-scripts/cups-common.m4
-@@ -434,7 +434,7 @@ LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
+@@ -462,7 +462,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
+ LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
  
- case "$COMPONENTS" in
- 	all)
--		BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
-+		BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
- 		;;
- 
- 	core)
+ AS_CASE(["$COMPONENTS"], [all], [
+-    BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
++    BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
+ ], [core], [
+     BUILDDIRS="tools examples locale"
+ ], [corelite], [
+
 -- 
 2.17.1
 
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 22e081255c..01939f804e 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  deb3575bbe79c0ae963402787f265bfcf8d804a71fc2c94318a74efec86f96df  cups-2.3.3op2-source.tar.gz
+sha256  9abecec128ca6847c5bb2d3e3d30c87b782c0697b9acf284d16fa38f80a3a6de  cups-2.4.0-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  1f8e5879fb8b15e3ee5111809fd3ca22c606d0897d6b5e74329e480c348e034d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 80aecdba5e..e406d3bc64 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.3.3op2
+CUPS_VERSION = 2.4.0
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
@@ -50,10 +50,10 @@ CUPS_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-CUPS_CONF_OPTS += --enable-gnutls
+CUPS_CONF_OPTS += --with-tls=yes
 CUPS_DEPENDENCIES += gnutls
 else
-CUPS_CONF_OPTS += --disable-gnutls
+CUPS_CONF_OPTS += --with-tls=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
