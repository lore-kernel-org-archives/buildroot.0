Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572FFC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13FA641B4C;
	Thu, 29 Feb 2024 15:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHuDYvNo05yf; Thu, 29 Feb 2024 15:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ED6741B7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED6741B7E;
	Thu, 29 Feb 2024 15:58:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 641311BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51D618293D
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Tk-tKhDUsaz for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1D4D82925
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1D4D82925
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D63387DAE; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:42:49 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0a908e31303703e9fb782b7f3cd241cf02728501
X-Git-Newrev: e35929fd1e19692010c8fa80824c065a86cc6ac5
X-Patchwork-Hint: ignore
Message-Id: <20240229154802.9D63387DAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libcurl: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=e35929fd1e19692010c8fa80824c065a86cc6ac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
index 3ecc587a52..83845b8e87 100644
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
