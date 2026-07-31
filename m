Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16098C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7D3460B39;
	Fri, 31 Jul 2026 12:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeDb8Nen8XxX; Fri, 31 Jul 2026 12:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE34660B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500449;
	bh=v+VryZAxDeN3ciEU6kiNeyTq54Szt5GgtZ9JN88dqsk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UELaNjhhaK/DFqS+5z3gfsm58hpLb3e7rM6klmFDl0vLYBxCflI4dnU5H5Xq2ZGig
	 4qyGoHZKCKXSobqNoMoQMkcjkKA/7hHbRvtyP7Q0XAp7wvfdkp+9UTNZHTZopbfOmf
	 XN8LvqrLfwnTHt7nOwG1dMvdupyu6ZTSnVgMdGulmuE3BO971ciAVl5uJTF32Zxvdp
	 EgZEM4AkZ28g8/wu4PmtL1iLo/ifm5ltHsRXGPoCOYfZwlT0VT8RKQ02PDBwJq5FqV
	 jmLZL1B4Y7AT2FVS6TKz39FWapAl/4ZTIzkjM58jyMdB7zYLQYUARo+Ceq6rDR1uop
	 VSN1fmNKtEMuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE34660B44;
	Fri, 31 Jul 2026 12:20:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E5B636E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 134E281346
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nmo36AF_ZFuY for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08AD78133B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08AD78133B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E02A88B745; Fri, 31 Jul 2026 12:20:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:15:01 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: cba956e3274d8c65801706c38041363e0dccee81
X-Git-Newrev: badd48864ae0ad335856a4f4a62a72f229302ddf
X-Patchwork-Hint: ignore
Message-Id: <20260731122002.E02A88B745@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 package/docker-credential-acr-env: needs NPTL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/badd48864ae0ad335856a4f4a62a72f229302ddf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

docker-credential-gcr calls pthread_getattr_np() which is only available
with NPTL; i.e. always available with glibc (where it originates from,
since 2.2.3), always available with musl (which has had it since 0.9.10
in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/525273d178d89ae8eef306d6ec662af368f20f73/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 882c35f7388a71f976cbc4a3396866533743368a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
