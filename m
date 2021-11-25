Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC57C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 03:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A571140018;
	Thu, 25 Nov 2021 03:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idpFnjFdotOz; Thu, 25 Nov 2021 03:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9124D4015E;
	Thu, 25 Nov 2021 03:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3E71BF32D
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 03:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AE0D81D70
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 03:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XttTUFT2tqkF for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 03:00:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F36881D5A
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 03:00:18 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id j21so4473145ila.5
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 19:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=128ma48tFtQPWUXRHxm/tZ0BR4B3GNCtVytmrTulOdI=;
 b=fIVqUOJQF6O6+EqSbjLnQKYr8NknQ58wjZg7gfngz/T8oq9j0hZ8oSRkEkhNOtyew9
 R2fjpEY3Grg2YQvOCo4aDeQA98Ejek55qbA9zZ9W3dCUGg6OyDlDBRF1dHlJoyuVAYJ6
 U3ELHa0F6jBeE5XrWZDIuSzdo5jeMQnjJYBmCh3pumBdrRetdy5S+OH0fA+esj9It6Vo
 RWfI2M8JWqj/xYfYXi0o1KLDNIuj3bLB8aRtf5i33a9jtECUvg6/QFntD0WfkKP48Rwu
 /s4bpMCKvuLsRSjUiDoxRWrGKmOKGBQMuJ0XCzEVbOkzRD2nZJ+N4Mk8kPrbzCDK2AKy
 dhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=128ma48tFtQPWUXRHxm/tZ0BR4B3GNCtVytmrTulOdI=;
 b=jF8a/1J5kfimAfUrUri3hoT0HI0nNMjKb8GpNKWFE8RSa24UGtgSSNuhi5lWb4v4S3
 GFmn3mh3WJQ3RO5U9kZ/8bLGUN/sKdrReaHhTX56PUd8p1Gaf5xkL1AEpC2jGAVy7aC8
 Y2EZI2TwAcE7siJxjcaKggRSWzH+DNpY3IhOMdiOOQrKeIfxwXATaqeoVU2SC8sE+W9a
 yfPrNrTkj/LK+ff9KY5kLhNNrdk0KAvRTguyYU8iC0dxiL4wcUeVfjaTJlNVZovI9FOW
 tezXceTTyw2DDAtFZAJjzlO3AW0KclKUFLzarN0KQUpSZi+pVEYidXc4bINtnyRed6fr
 VHOA==
X-Gm-Message-State: AOAM530Kjn0Pi33CoKkj7CwZrErkzKxxZtFhMlp1EauumNwVwSKsMjOQ
 fx2xI+ggpF5q3WTEg7kwPFvHNB8bjVs=
X-Google-Smtp-Source: ABdhPJxixKcBIb0jJHhNkR1wUKiE8bMfBtTgwWp9dafGrZlWEN/6BF97bLtHVbY6VgR/hfrsKvL0VA==
X-Received: by 2002:a05:6e02:1d8a:: with SMTP id
 h10mr18433023ila.51.1637809217039; 
 Wed, 24 Nov 2021 19:00:17 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id d2sm956441ilv.73.2021.11.24.19.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 19:00:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 19:59:52 -0700
Message-Id: <20211125025952.1694072-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cups-pk-helper: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                          |  1 +
 package/cups-pk-helper/Config.in           | 17 +++++++++++++++++
 package/cups-pk-helper/cups-pk-helper.hash |  3 +++
 package/cups-pk-helper/cups-pk-helper.mk   | 14 ++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/cups-pk-helper/Config.in
 create mode 100644 package/cups-pk-helper/cups-pk-helper.hash
 create mode 100644 package/cups-pk-helper/cups-pk-helper.mk

diff --git a/package/Config.in b/package/Config.in
index cb94e30be3..bdadbd2799 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2140,6 +2140,7 @@ menu "Networking applications"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
 	source "package/cups-filters/Config.in"
+	source "package/cups-pk-helper/Config.in"
 	source "package/dante/Config.in"
 	source "package/darkhttpd/Config.in"
 	source "package/dehydrated/Config.in"
diff --git a/package/cups-pk-helper/Config.in b/package/cups-pk-helper/Config.in
new file mode 100644
index 0000000000..63a0d3acd8
--- /dev/null
+++ b/package/cups-pk-helper/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CUPS_PK_HELPER
+	bool "cups-pk-helper"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, polkit
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_POLKIT
+	help
+	  cups-pk-helper is a PolicyKit helper to configure cups with
+	  fine-grained privileges.
+
+	  https://wiki.freedesktop.org/www/Software/cups-pk-helper/
+
+comment "cups-pk-helper support needs a toolchain with threads, wchar, gcc >= 7"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cups-pk-helper/cups-pk-helper.hash b/package/cups-pk-helper/cups-pk-helper.hash
new file mode 100644
index 0000000000..18fe789389
--- /dev/null
+++ b/package/cups-pk-helper/cups-pk-helper.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  959af8f2f5a2761e7e498b61c9caf25ae963335031eae9972d999e9a0d97a228  cups-pk-helper-0.2.6.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
new file mode 100644
index 0000000000..c90b94da14
--- /dev/null
+++ b/package/cups-pk-helper/cups-pk-helper.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cups-pk-helper
+#
+################################################################################
+
+CUPS_PK_HELPER_VERSION = 0.2.6
+CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releases
+CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
+CUPS_PK_HELPER_LICENSE = GPL-2.0+
+CUPS_PK_HELPER_LICENSE_FILES = COPYING
+CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
