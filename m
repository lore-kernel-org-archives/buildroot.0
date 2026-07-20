Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84148C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B0980D09;
	Mon, 20 Jul 2026 19:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRrsSRHVIEsb; Mon, 20 Jul 2026 19:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 645BC80D21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784576589;
	bh=7Vu9UQ98UAFkf1TOazb9bN0ixuTA3lpipR8gSSFQHpo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q/TuVVuEngI5JY/7qnIzFU1s4RjuKpbKbQAxaM3W3CV1l157EgYIBWCpmoz7erQMt
	 SGHPw9LUbglmlWhk5n/JstpzaV2MJtOULfh41+MjAGk6qPaMBF2B5KXDEzeTp6VnCj
	 rJz6TIewGTvzSR9tSLQMlxD4J92TdlWqedfJhAYjy94GXSMfISUDufDIlDj7FJaGkI
	 Fw0iP1VAS+1IQGPg7qx4Cx86Wo71Ipv8h2A1x1c5e4NAqjdWQdyg+6pHT84B/aia0u
	 5wB5gpGrpaY/e4c4+APbmJ92TssbvJ7ZFuvQ/h1Ii02BdVe6+EWfN17sdmvxLJvLRM
	 EYZCS7WLSuZmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 645BC80D21;
	Mon, 20 Jul 2026 19:43:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B68DD786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8B054017B
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPU-KSMod5qx for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E0B4016F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3E0B4016F
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D3AC8907B; Mon, 20 Jul 2026 19:42:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 21:39:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a7b0522b34c4ff39f1386b972ded7360191bc01
X-Git-Newrev: 12002ceeefa496e62f09e3fa324eb01f04ff7d73
X-Patchwork-Hint: ignore
Message-Id: <20260720194229.2D3AC8907B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-gcr: needs NPTL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12002ceeefa496e62f09e3fa324eb01f04ff7d73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

docker-credential-gcr calls pthread_getattr_np() which is only available
with NPTL; i.e. always available with glibc (where it originates from,
since 2.2.3), always available with musl (which has had it since 0.9.10
in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/3ed18da254082b7823b49be4578274792bb7380e/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-credential-gcr/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/docker-credential-gcr/Config.in b/package/docker-credential-gcr/Config.in
index 1b24ff0e59..6845d5e198 100644
--- a/package/docker-credential-gcr/Config.in
+++ b/package/docker-credential-gcr/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOCKER_CREDENTIAL_GCR
 	bool "docker-credential-gcr"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	help
 	  docker-credential-gcr is Google Container Registry's
 	  standalone, gcloud SDK-independent Docker credential
@@ -9,3 +10,7 @@ config BR2_PACKAGE_DOCKER_CREDENTIAL_GCR
 	  eu.gcr.io, etc.).
 
 	  https://github.com/GoogleCloudPlatform/docker-credential-gcr/
+
+comment "docker-credential-gcr needs a toolchain w/ NPTL"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
