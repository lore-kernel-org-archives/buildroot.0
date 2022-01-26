Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D41C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B8B40338;
	Wed, 26 Jan 2022 20:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xvb8mjkatXxd; Wed, 26 Jan 2022 20:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0D82409D0;
	Wed, 26 Jan 2022 20:05:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35D1C1BF9C2
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24C6383438
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqnGP6dETwDc for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:05:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72D9481AF5
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:05:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2E7C782879; Wed, 26 Jan 2022 19:58:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:02:54 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 47b28bb6ad65ed97bcdf7c245b06931f51662f71
X-Git-Newrev: c1256840581a4a8256929b7a30f7ce8931a87693
X-Patchwork-Hint: ignore
Message-Id: <20220126195820.2E7C782879@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] paclage/tpm2-tss: do not
 select liburiparser
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
Content-Type: multipart/mixed; boundary="===============5082643688769432677=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5082643688769432677==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c1256840581a4a8256929b7a30f7ce8931a87693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Commit 593683b45f72 (package/tpm2-tss: remove unused dependency)
removed the build-time dependency (in the .mk), but forgot to
remove it from the Config.in.

Signed-off-by: Tilman Keskinöz <arved@arved.at>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cbb70493af20445fbd24de4c5a15ba0de7f27c6e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 2fc56dbd76..857987ae36 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_LIBURIPARSER
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help

--===============5082643688769432677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5082643688769432677==--
