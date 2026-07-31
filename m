Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D4AC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD93C41099;
	Fri, 31 Jul 2026 12:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0WVtV0-SZN8; Fri, 31 Jul 2026 12:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D98D3410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500457;
	bh=+Ef40EeFx9D+72LWHE+++IaafCy6ZlvtQ3cHmYcZjOo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lCH6OD4swoEpLyOsb3j+v7xlqR7fyTbfoO8pnC94dN4qRS3UQ+jtEqLjUmuxBs+Sk
	 x+R6Oy0+vzuqLRUxgHIuRv3ZIR/5aMB0/QfkduOcD2Qc/P0P0ByQT6X2huoqziLl9B
	 AVcOKyGlo14p7zvfpkKQEMOqYwRRVQB4AeU7Uo0WqAbVS9cTHW7/yLtGhd1nFRn7m8
	 01EBUJ//VfXMNiRSZn7DNHIb0mlJUU2YKaxWqfVXINVyv+d9FtJArdKOcDl9rsiVn0
	 a2jZoeAcrlNqwjWRYa9enNZvXkHXl3K3XxO9v3xfo1baRSjtZrTov5wVpL+ncnO65Q
	 KhB95en18VjCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98D3410B5;
	Fri, 31 Jul 2026 12:20:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A7A2E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84F924105D
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nb2ZcAIDFd7t for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C621741051
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C621741051
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B32158B745; Fri, 31 Jul 2026 12:20:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:12:41 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4ab4ded4c8a8b07687725df36c89da7daa391693
X-Git-Newrev: 738e71b98b2e5dcb332b0230e9c5dcf99f622a4e
X-Patchwork-Hint: ignore
Message-Id: <20260731122002.B32158B745@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 package/docker-credential-gcr: needs NPTL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/738e71b98b2e5dcb332b0230e9c5dcf99f622a4e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

docker-credential-gcr calls pthread_getattr_np() which is only available
with NPTL; i.e. always available with glibc (where it originates from,
since 2.2.3), always available with musl (which has had it since 0.9.10
in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/3ed18da254082b7823b49be4578274792bb7380e/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 12002ceeefa496e62f09e3fa324eb01f04ff7d73)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
