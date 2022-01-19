Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8D3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 20:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD5D829F2;
	Wed, 19 Jan 2022 20:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZ-bXNRTtTKs; Wed, 19 Jan 2022 20:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE9082AF5;
	Wed, 19 Jan 2022 20:30:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8CC71BF405
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A711C60B73
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTTK7dS73VBa for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 20:30:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 157FD60F2E
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 20:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5A504832B5; Wed, 19 Jan 2022 20:23:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 21:28:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ae840ba193a90f4cb950526646b831294477454
X-Git-Newrev: cbb70493af20445fbd24de4c5a15ba0de7f27c6e
X-Patchwork-Hint: ignore
Message-Id: <20220119202333.5A504832B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] paclage/tpm2-tss: do not select
 liburiparser
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
Content-Type: multipart/mixed; boundary="===============3676442517228262985=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3676442517228262985==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cbb70493af20445fbd24de4c5a15ba0de7f27c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 593683b45f72 (package/tpm2-tss: remove unused dependency)
removed the build-time dependency (in the .mk), but forgot to
remove it from the Config.in.

Signed-off-by: Tilman Keskinöz <arved@arved.at>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

--===============3676442517228262985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3676442517228262985==--
