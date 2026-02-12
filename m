Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C62EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A0B41E29;
	Fri, 13 Feb 2026 19:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDHSo0A74_Xv; Fri, 13 Feb 2026 19:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB4141E38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011355;
	bh=RnOFXatyEPwFhl750mD3JtKlGqxUFt9cLkahYE9wZyU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QkMJmt/OTxnw6/NO0F9Kxu/FsJbCZKOF6ssKI8sAarS4/FKGlhUCzrOE2C/dg6UgK
	 HIqyqMK/fNWd86HR2zNkisvfbuoklUAm2Lxmse7vFJwbcTLGmBsqDA0dY4K++xzJnd
	 3yNN0fs1u7F57lvTIMhOEXJn/+NmLBb5WQIC2e0aTWJAY3yCn0ZNK1fYpQpayxYf1Q
	 h6DUaskxbYR67sbGT9OLXHwzg8UwXP71vWfIwD7rugKD4riNwpLSVkSgrO7to5cZkp
	 EJ3AcMBJW6FeEVeTtFJblEy052s3AQOHQ6fcHu5fLwI7FLRRlG1kYxcdvFhvvOkOj6
	 Uwb1sLkR0oPGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BB4141E38;
	Fri, 13 Feb 2026 19:35:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14039283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB3C18452C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6BjOzgyMQHk for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D780844E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D780844E5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81DD286D69; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:11:33 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a95cba3ece344bb78a67974eab63ec0cec0142bd
X-Git-Newrev: 51c4b7884178909346c3aa39ce39fce4a47173c7
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.81DD286D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uftp: needs
 libopenssl, not libressl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51c4b7884178909346c3aa39ce39fce4a47173c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 07917a05db913348cc4b990e6937310f14456d34)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
