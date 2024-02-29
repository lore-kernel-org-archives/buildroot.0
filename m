Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DCEC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3562241BC0;
	Thu, 29 Feb 2024 15:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIRJ8Nn-sC0y; Thu, 29 Feb 2024 15:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDBAD41BD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBAD41BD4;
	Thu, 29 Feb 2024 15:58:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 487B11BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26E8781FCA
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5bWbIGv2G4o for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5397E81E1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5397E81E1B
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EE8187DD0; Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:42:41 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 98b4832b4417dd3eb3e2d20625c19fba0b34ccf9
X-Git-Newrev: 326b77d6dfb2f8dd771796a18ded886e22b40d6e
X-Patchwork-Hint: ignore
Message-Id: <20240229155011.3EE8187DD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcurl: drop
 LIBCURL_CPE_ID_PRODUCT
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

commit: https://git.buildroot.net/buildroot/commit/?id=326b77d6dfb2f8dd771796a18ded886e22b40d6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit 4b6202f721f2f5ab36153ba44de65286f7811ef9 set
LIBCURL_CPE_ID_PRODUCT to libcurl but this is not needed as
LIBCURL_CPE_ID_PRODUCT will be set to the package name
(i.e. libcurl) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr>
(cherry picked from commit 61295f5ced0749db34095bfbe8b34ed86a692828)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 9ef8586bb2..0bac8656b8 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -13,7 +13,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
-LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
