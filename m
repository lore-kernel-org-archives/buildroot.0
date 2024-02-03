Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43378C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0521400A4;
	Sat,  3 Feb 2024 18:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0521400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvXimkq5Nnoe; Sat,  3 Feb 2024 18:45:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DEB0408C3;
	Sat,  3 Feb 2024 18:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DEB0408C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D84E1BF99A
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3638460BE0
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VXj9ox00AV-4 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0D9860BC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0D9860BC0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0D9860BC0
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:08:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDBB58673B; Sat,  3 Feb 2024 10:08:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 11:06:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27fafa94a729b2c59d5eb0aec0bedbaf9dce5abb
X-Git-Newrev: 186883f497cf1c3985c9b802435ddd3b6c431167
X-Patchwork-Hint: ignore
Message-Id: <20240203100847.CDBB58673B@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit] package/mpfr: fix CPE variables
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=186883f497cf1c3985c9b802435ddd3b6c431167
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:mpfr added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE
identifier for this package

cpe:2.3:a:mpfr:gnu_mpfr is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/7B981E0A-5BAC-4A80-A734-5FD4B51B04EF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpfr/mpfr.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 8d12c7502b..c0c8c04646 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -9,7 +9,8 @@ MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
 MPFR_LICENSE_FILES = COPYING.LESSER
-MPFR_CPE_ID_VENDOR = gnu
+MPFR_CPE_ID_VENDOR = mpfr
+MPFR_CPE_ID_PRODUCT = gnu_mpfr
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 HOST_MPFR_DEPENDENCIES = host-gmp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
