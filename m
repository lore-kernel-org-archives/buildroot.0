Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855AC7EE29
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 17:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5DB542A02;
	Thu,  4 May 2023 17:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5DB542A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfTfJ6-C2_yL; Thu,  4 May 2023 17:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6EBF42A01;
	Thu,  4 May 2023 17:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6EBF42A01
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 042E41BF3BC
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABE6A40C6F
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABE6A40C6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELT2yAH1nid9 for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 17:36:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 953BE429EE
 for <buildroot@buildroot.org>; Thu,  4 May 2023 17:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 953BE429EE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E7B085D31; Thu,  4 May 2023 17:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 19:33:47 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cfaf4ec64f4c2d239418659ef072a571f38d88c3
X-Git-Newrev: 93b506f33793209c9bf0757e5a7ca6e3fa06a28c
X-Patchwork-Hint: ignore
Message-Id: <20230504173637.8E7B085D31@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/zeek: disable
 with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=93b506f33793209c9bf0757e5a7ca6e3fa06a28c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Disable building with libressl to avoid the following build failure
raised since the addition of the package in commit
ea36681572255ec906167308c07adc42ed2ac9f9:

In file included from /home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/analyzer/protocol/mime/MIME.cc:7:
/home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/zeek/digest.h: In function 'void* EVP_MD_CTX_md_data(const EVP_MD_CTX*)':
/home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/zeek/digest.h:22:12: error: invalid use of incomplete type 'const EVP_MD_CTX' {aka 'const struct env_md_ctx_st'}
   22 |  return ctx->md_data;
      |            ^~

Fixes:
 - http://autobuild.buildroot.org/results/2db2988d495f9d06d058fb532a2dcfa9ef6e207c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5b63325e86a034b63075f01a2ddbb7c5b1f67dc1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zeek/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zeek/Config.in b/package/zeek/Config.in
index 114ec4235d..730388ded7 100644
--- a/package/zeek/Config.in
+++ b/package/zeek/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_ZEEK
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  The Zeek Network Security Monitor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
