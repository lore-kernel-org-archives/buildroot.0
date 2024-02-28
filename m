Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BF5C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7A77405B6;
	Wed, 28 Feb 2024 21:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6XTGk2D5L8oq; Wed, 28 Feb 2024 21:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30EE2417DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30EE2417DB;
	Wed, 28 Feb 2024 21:27:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22B2C1BF97A
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA9CA403B8
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3ejqeZmZ7Cf for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77AA541696
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77AA541696
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70AB187CA0; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:13:11 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 29095831f2f4f350349d901d14685d05e069c768
X-Git-Newrev: a5f721dca6e9682f665a5fb94801b73f37daaf7d
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.70AB187CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/mpfr: fix CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5f721dca6e9682f665a5fb94801b73f37daaf7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:gnu:mpfr added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE
identifier for this package

cpe:2.3:a:mpfr:gnu_mpfr is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/7B981E0A-5BAC-4A80-A734-5FD4B51B04EF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 186883f497cf1c3985c9b802435ddd3b6c431167)
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
