Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569A7EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91E781EE4;
	Fri, 14 Jul 2023 21:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E91E781EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VttijPuh4Vp; Fri, 14 Jul 2023 21:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34EF781E26;
	Fri, 14 Jul 2023 21:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34EF781E26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7935C1BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F492400E7
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F492400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMrTqufeKC5f for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:49:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E82400D1
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86E82400D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7375D870EB; Fri, 14 Jul 2023 21:49:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 23:48:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b31b643825e5ffa0e5849b622de4925b5b73cb9
X-Git-Newrev: d3db2e61ce9d84247e9d72d72fad624ae471efee
X-Patchwork-Hint: ignore
Message-Id: <20230714214913.7375D870EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: remove entry to tovid
 patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d3db2e61ce9d84247e9d72d72fad624ae471efee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tovid package was removed in commit
7be241b49cc1f537963b708ea5f26694385626e8, but .checkpackageignore was
forgotten.

Fixes:

https://gitlab.com/buildroot.org/buildroot/-/jobs/4658045130

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dc7770eff9..a762d8e98b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1489,7 +1489,6 @@ package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch Upstrea
 package/tor/0001-patch-src_lib_crypt_ops_crypto_dh_openssl_c.patch Upstream
 package/tor/0002-patch-src_lib_crypt_ops_crypto_rsa_openssl_c.patch Upstream
 package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch Upstream
-package/tovid/0001-manpage.patch Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch Upstream
 package/transmission/S92transmission ConsecutiveEmptyLines Indent Shellcheck Variables
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
