Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754DAD1BDF5
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1225080E75;
	Mon,  4 Nov 2024 21:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QDDMUs4Gniv; Mon,  4 Nov 2024 21:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F99F80E36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F99F80E36;
	Mon,  4 Nov 2024 21:20:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22F2FB8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 105BA404E8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iQo1va1FXBN for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44CF5403F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44CF5403F4
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:20:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D94E85C03; Mon,  4 Nov 2024 21:20:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 22:19:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af471fc415bdf3719ff2fc605274080f4926251a
X-Git-Newrev: 84d8c43bd290c3495877cb1724fda98892db052e
X-Patchwork-Hint: ignore
Message-Id: <20241104212015.2D94E85C03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: requires RC4
 support in openssl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=84d8c43bd290c3495877cb1724fda98892db052e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/988/98819c1e202ddd77a390c9063ad31ee0601fefbe/

The build error, afaics, first appeared in
http://autobuild.buildroot.net/results/a08/a087c27dbc92c643f607ca9c66977156778ff1a0//
after the bump to version 43.0.1 with buildroot commit
37c397c8b691495b21623b7d0a4d1e5ee7f0f61e which added chacha support when
building with libopenssl.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cryptography/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index d12f040656..51b408823f 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
