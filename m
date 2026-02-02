Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47290E73149
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 09:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0719A606BE;
	Mon,  2 Feb 2026 09:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fMnjv9CRXc6; Mon,  2 Feb 2026 09:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BA34608C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770022981;
	bh=OgOPAywH7SotQFTu+q+j36r3JqKp4DfR0W7Axx/O13Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JhdMpYx0/CNf50/aTHJQMhvpv3eO0yR1+RjGGcClqg0McGhkKdKOJ18HgJuZUtQIL
	 BHdfGrk7HggVPgmZEYgCQ7sey2lD/iWUDyKdX8DR9a2ZSvIcO0w2ZYuPcPg6S0iqxC
	 QZwWSG4j4RQs0LmyqSeHB38VqLExOmGp5nLuqH6mamSfP71w9C1REg3xjfjSuSXWwl
	 EHYyWEz9QFzXEww5GAtJeTZzUJm/vm8gmcy6kXFrvPcoq/h2jGbqA6oSwe/TbZQvpa
	 D8l8VQ5FLWma37dPPoJYel9+G9uKJEzp7HRT8J2DFziLJ/Mz6FlWsv/w6FO0n3Csne
	 DewXwcstTT12g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA34608C7;
	Mon,  2 Feb 2026 09:03:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88664149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B42B40855
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNfLHeMXRWFV for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 09:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B336340836
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B336340836
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3B6586269; Mon,  2 Feb 2026 09:02:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 09:34:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67738a6e1d1574cc84888c32f9fb0c5bad03201e
X-Git-Newrev: 07917a05db913348cc4b990e6937310f14456d34
X-Patchwork-Hint: ignore
Message-Id: <20260202090258.A3B6586269@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uftp: needs libopenssl,
 not libressl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=07917a05db913348cc4b990e6937310f14456d34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit bumped libressl from version 3.8.4 to 3.9.2.

Libressl 3.9.0 contains a breaking change:
https://github.com/libressl/portable/releases/tag/v3.9.0
"EVP_add_{cipher,digest}() were removed."

Upstream was notified by Yegor but did not add any fixes:
https://sourceforge.net/p/uftp-multicast/discussion/general/thread/c02c950dff/
so we force the usage of libopenssl to fix a build error:

encrypt_openssl.c: In function 'crypto_init':
encrypt_openssl.c:77:5: error: implicit declaration of function
 'EVP_add_cipher'; did you mean 'EVP_Cipher'?
 [-Wimplicit-function-declaration]
   77 |     EVP_add_cipher(EVP_aes_128_ccm());

first caught by the autobuilders on 2024-08-09:
https://autobuild.buildroot.net/results/7da/7dadc662e0a6642e40831a93b788e959498d8923/

Fixes:
https://autobuild.buildroot.net/results/a74/a74526181dfc90aff7f56457c430c1aa1d006e54/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uftp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uftp/Config.in b/package/uftp/Config.in
index b88fb03ae2..a9296e595c 100644
--- a/package/uftp/Config.in
+++ b/package/uftp/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UFTP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if BR2_PACKAGE_OPENSSL
 	help
 	  Encrypted UDP based FTP with multicast.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
