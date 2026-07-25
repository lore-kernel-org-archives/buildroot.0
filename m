Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82FAC531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 21:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC63D6066F;
	Sat, 25 Jul 2026 21:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bz61iVxfNbtD; Sat, 25 Jul 2026 21:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2214D60650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785015146;
	bh=6B7aosFVgXNWM5LmQVUKQUSnNDeTIzVVv0OshBykecw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J2nqvCutbVfg7JYH8OS1vwWYo4MFrem9ADfnc9npB+JiwSvjt4E1ujIcKUAr7ih2t
	 R1FRf+5lfGPS4Ssy955tafccyY/ZX1TKUfCg24nrqif473znRYfgDIFl//3MoweGLY
	 VCGhEF926/UeDu7oTuImNuPy01aAYdzTGykg2qGf5FFl46nhltkrUd/MjI93ZxrCpO
	 GPQKhTF1FRukA8r1zN6uUXDP6r9rIsG7359sM/52y48wRjhixXdhEZgk4YQiE+4Mkd
	 UY5gWe3HhZ7fm/ZtjTele6Dmvr/5tff+KlY+Ucr0mdP4dkTVfszIi4ARrnBxyy9diC
	 bhgIKvp6UkOBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2214D60650;
	Sat, 25 Jul 2026 21:32:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD10357
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85AD980E1C
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3peFBXPs5EG7 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 21:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98F7380DDF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98F7380DDF
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:32:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41A1A8A5A7; Sat, 25 Jul 2026 21:31:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 23:31:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44a4d39ac493811e03898b6103478d73eb0ff7a6
X-Git-Newrev: 882c35f7388a71f976cbc4a3396866533743368a
X-Patchwork-Hint: ignore
Message-Id: <20260725213143.41A1A8A5A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-acr-env: needs
 NPTL
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/882c35f7388a71f976cbc4a3396866533743368a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

docker-credential-gcr calls pthread_getattr_np() which is only available
with NPTL; i.e. always available with glibc (where it originates from,
since 2.2.3), always available with musl (which has had it since 0.9.10
in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/525273d178d89ae8eef306d6ec662af368f20f73/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-credential-acr-env/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/docker-credential-acr-env/Config.in b/package/docker-credential-acr-env/Config.in
index ddb101d52f..a4f7766fdd 100644
--- a/package/docker-credential-acr-env/Config.in
+++ b/package/docker-credential-acr-env/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOCKER_CREDENTIAL_ACR_ENV
 	bool "docker-credential-acr-env"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	help
 	  The ACR docker credential helper is an alternative to the
 	  existing file store based ACR helper [...] which relies
@@ -10,3 +11,7 @@ config BR2_PACKAGE_DOCKER_CREDENTIAL_ACR_ENV
 	  to push to Azure Container Registry.
 
 	  https://github.com/chrismellard/docker-credential-acr-env/
+
+comment "docker-credential-acr-env needs a toolcahin w/ NPTL"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
