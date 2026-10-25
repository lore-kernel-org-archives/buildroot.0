Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA0D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JTYGsL4h
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9C2D80CDE;
	Sun, 25 Oct 2026 20:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVHqPMVODICS; Sun, 25 Oct 2026 20:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9F88E80D6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792959722;
	b=RHe6uNXi9PhVRUcfK4PT0px2YThj5Knps5BKLA7OaG1q+NnBAhj4GIlaPn8GkxbKXdK7
	 dq1vqpfLdN0CkqjCSWreBaI5yzlBFj1FInmNXdkiWB2QQ/Y0ZX2Jg+cdd4T9QUnq85C8Q
	 BIxs0yDYNOkuJpKrJWbGznnzCv8ymxo1zgqTVCwlWyDm+iK2piRbNgHezadK0sAtxdxmB
	 TDlWS8k9VXKoZ5xIG33sxliAbhvhTOom3rmjI1xeGd7xHkkLuh7Yz8JNe5qUpAF9DfXQY
	 2sATbgVoRlrejiWbsZhmiGBVWyU8oImw6OR1/DklDt+aQoz+hw5dUrdz4xEURnDNT+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792959722;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rvLzxDnMOed40emgWtUFYft9Tb9a+hNreX8TUha+keY=;
	b=PMduRv0wl+MB8XS1teyU49yB4D4eTzdD6J5fcBeFFdecC4nMQJsgEZP6LxbXB0M9uCJF
	 521o0ogrNl/FGstd9wApw+BX7ThWo+u/sXGNLp6FttAck8etsY6vzQybVvts/MhL8JabO
	 37yK9zR+WcCVdsncJ26ei3R6jONkH39EM4O5aJDZHb4eh07zYr9wyI0WY6zjsECioY4e2
	 UO6miUNqVqlOF06Ed8rG7tiAEvmGjzo6J2VKXVj1ryKuKKgZCwy9Z9YIE71ryieRLwEvn
	 8hcd4bCIqf1M0W26iRJ3WkZNH4YtGfJ7ZdrnaABF5EPj9rVR1Mee+qb47jn0T8wOBEw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792959722;
	bh=rvLzxDnMOed40emgWtUFYft9Tb9a+hNreX8TUha+keY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JTYGsL4hvsNy2RorhxNokvdW2+E789FCUoGuvQchkX3IHQiWzjVFGhKv4ytgmTSbg
	 yp3EbLRsBenL9EIDkR0rEhb/hmFpranLtdDWorE4psjjOsU1P5kIihJ3hyEjpjMePR
	 TlRADlgS7h7bPZWm+3v20rmvRaU9GgLYmtmazhaWZHxidbSkKgNmy+S/x8mgrkUI1Z
	 Bb3STkVD09aiFELAIfIEAnsJJ/y/MdqXd2V4Vqj9wR8rbPmKjJFaS3u6toUgIVGWzY
	 mvgRhoLikL4QjXqsOp/VHzF465nHT5AOaHEputVXn4ZOC+XJoYVH4qQwJ3Lt9+v0p4
	 Sg0iYbD9yzvUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F88E80D6E;
	Sun, 25 Oct 2026 20:22:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A223380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C58280D6E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfzSEbCpv6cF for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:22:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4B07380CDE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792959720;
 b=Mbx6JRwkMHzqdPq4nbo0lPGF8EybStruiEE9olxQybWfGOSVf6ZyBx9hro/JpZCfx9hJ
 3tfi3wwDKVYONSexztYgg6oxsLT8hj4oQ/qAC3asus9juHgYjyzhK+9+zOM45vgZaqjpO
 /JVkPG1qJ8MovTSqo2/zfHypmHToqj1rsi/0Wgj534hZZV54nxp7olCdUFDwuGuqgOmhu
 cPPj6jP+ZbYyPP5Wa7lxzOEnJ0qobtD1OqCTEnFlT7irKoMI1b3mEzhMMTo+RYvAIHO1T
 Fae6L6QS1q6lGCULomvUtPBf8V0edGTMtUaTiW1ZHvKv9Z1wUKWu227niz4XCossDYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792959720;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Q86o8/O8rh9ginkpsnea+EMVh8Wtfx0z+rU9udxYql0=;
 b=jflco5WTjmFthDqRCA6F+f0FHYJwZtVBiCCUAK6X4biqAke0ho5smnr7RsuJRWwta6qh
 A3H2y/3o2R3TUpEt5U8nlbXxVgiyFrzTFY8D2U/CyFXTnP/nzlF1GeuNZ7jLNGtiq1Ro2
 +OacDNx5p/lOf8kw1nMYcurRchVGxuqJMOtHs/sCCFShFcLhABfghaDCytS09Is8Nc6Cb
 3sdsnazFMmG1B8qVIt5MnSgk4qt8a4ZAj8C5Z0LYgadXM2fdIY4G+7p9X+Co2sOxB+Oyh
 eqs5LMUhLZv9Q00MduGO029ylPKeJrDjvQ+mkLko8BsXHSUntuUy7mhBY2o7i/l7nlQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B07380CDE
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:22:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B05339C61E; Sun, 25 Oct 2026 20:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:21:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6c8b409ed4c6bf7abb2b3b99dcbb9397bf037b6
X-Git-Newrev: fb0438aaf67da07027b1d9e734450ae5a333da23
X-Patchwork-Hint: ignore
Message-Id: <20261025202034.B05339C61E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli: needs NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb0438aaf67da07027b1d9e734450ae5a333da23
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

pthread_unix.c: In function 'x_cgo_getstackbound':
pthread_unix.c:96:9: error: implicit declaration of function
 'pthread_getattr_np'; did you mean 'pthread_attr_init'?
 [-Werror=implicit-function-declaration]

Fixes:
https://autobuild.buildroot.net/results/756/756ceb50b78218ac6085e0143d9f358f97d9568d/

The build error occured already in 2023:
https://autobuild.buildroot.net/results/c0b/c0ba9647824dd2dc811c31e7b999167f04d0be49/
A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-cli-buildx/Config.in     | 6 +++---
 package/docker-cli/Config.in            | 6 +++---
 package/mender-update-modules/Config.in | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/docker-cli-buildx/Config.in b/package/docker-cli-buildx/Config.in
index 486f1196c3..d1f9bc2804 100644
--- a/package/docker-cli-buildx/Config.in
+++ b/package/docker-cli-buildx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOCKER_CLI_BUILDX
 	bool "docker-cli-buildx"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # docker-cli
 	select BR2_PACKAGE_DOCKER_CLI
 	help
 	  buildx is a Docker CLI plugin for extended build
@@ -10,7 +10,7 @@ config BR2_PACKAGE_DOCKER_CLI_BUILDX
 
 	  https://github.com/docker/buildx
 
-comment "docker-cli-buildx needs a toolchain w/ threads"
+comment "docker-cli-buildx needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
index 52e7f7c871..2befb87578 100644
--- a/package/docker-cli/Config.in
+++ b/package/docker-cli/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOCKER_CLI
 	bool "docker-cli"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_HOST_GO
 	help
 	  Docker is a platform to build, ship,
@@ -20,7 +20,7 @@ config BR2_PACKAGE_DOCKER_CLI_STATIC
 
 endif
 
-comment "docker-cli needs a toolchain w/ threads"
+comment "docker-cli needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 1fd7384f59..7c5a7e4442 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -76,7 +76,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
 	bool "docker"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS # docker-engine, docker-cli
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS # docker-engine, docker-cli
-	depends on BR2_TOOLCHAIN_HAS_THREADS # docker-engine, docker-cli
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # docker-cli
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
 	depends on !BR2_PACKAGE_CGROUPFS_MOUNT # docker-engine
@@ -98,11 +98,11 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/docker
 
-comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 5.2"
+comment "docker support needs a glibc or musl toolchain w/ NPTL, headers >= 5.2"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
