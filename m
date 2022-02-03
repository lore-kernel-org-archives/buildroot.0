Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60167C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 22:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D236340A5F;
	Thu,  3 Feb 2022 22:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpKs2bSxXZHV; Thu,  3 Feb 2022 22:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C58514048D;
	Thu,  3 Feb 2022 22:31:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDBD01BF33B
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBA6E60AFD
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BslzlxUATweO for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 22:31:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75D0B60AEA
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 22:31:27 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FkdRnNzSZ0FuyFkdRnQHOV; Thu, 03 Feb 2022 23:31:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643927486; bh=LTrEL0NyC1ZpVkTDKVdLG85bpnddmXWiGYb7Mf5FHn4=;
 h=From:To:Subject:Date:MIME-Version;
 b=G482Kzu+WRbltUxdkV/9qRXWyVVDNpQgVNEqxdwbrFTDJ3GieHgiCcgqRJWK7InhV
 gH9cUP9DmGAP6BYMdoKjeNq8UX7H1eEezC7ORlBJ9d1Bhc7gpR3cc52VwSQ/QckDrw
 kS6aXhE3E9A53BrrCvF23MaW7aY4l/xgE0wtia61ECzs2TrOaZuA7eiJJ5qLkNdTq1
 z10eN2oT6apeoZ8Da3UUk1K9tBNSbbuLV7nFs7oPqj+alqyYcJyQZzOeuiGNTnd/PD
 da//dwgKjzJXCn/+fpTMcYOr8sU3quZb1k+tykzOyAveRCZP2PkL0JaAjODS5uIcCq
 Ss9vsgh6sdzGA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:31:24 +0100
Message-Id: <20220203223124.3017611-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203212328.264bc948@gmx.net>
References: <20220203212328.264bc948@gmx.net>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEG19NkhhZjjalUdBDj0KLiuPVZCPHzX5Wur1SQV2D5l955ysDPq0wvI2oNwoEdLIBvQKfxupx52ViOkVhpY4vjQZSy4LFa6nkIymzMk6vY85+pHwlXB
 8rNlUi85uy0UyxEi8mG6IM+An8lO84u6vuLu3smjLoRYLwC+sa5401wDWevG5eobbs+CaqCcbGoia/cYABfSvGhaBwAYjUfpf0s5n1z9qtgvYxzelsJJGQiP
 hIbBCDYeHbQ33vZ+UZ5Axz7uqGXk/XsMRv0dXBZ/YZggmH0FZykJNJ35kEOw47FrBW6Nyl3be/C6iKknJFDpls+aBI9Dx+TvrK2zLDsPHHObdq2U+IzXrzrN
 rfofHBRcEOVHRo/nTRWKmkAr/CS6Gw==
Subject: [Buildroot] [PATCH v2] package/util-linux: improve host build
 failure fix
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As suggested by Peter Seiderer package util-linux doesn't need raw support
when built for host, so let's remove:
HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
in favor of:
HOST_UTIL_LINUX_CONF_OPTS += --disable-raw
This is a better approach than my commit:
https://git.buildroot.net/buildroot/commit/?id=d895bd973b35fde10d3dd7db530d9e4782926497

Suggested-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* move --disable-raw to a dedicated HOST_UTIL_LINUX_CONF_OPTS as suggested
by Peter Seiderer. This avoid ambiguity since previously it was under the
comment "# We also don't want the host-python dependency".
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5a4ff64d01..40fd518a58 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -41,7 +41,6 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 	touch $(@D)/disk-utils/raw.8
 endef
 UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
-HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
@@ -202,6 +201,11 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--without-ncursesw \
 	--without-tinfo
 
+# Disable raw command since starting from version 2.37 needs a
+# work-around to build but in the end we don't need at all.
+HOST_UTIL_LINUX_CONF_OPTS += \
+	--disable-raw
+
 ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
 HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
 # disable commands that have ncurses dependency, as well as
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
