Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E2606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bu6ZTzgI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BDEE812CB;
	Fri, 30 Oct 2026 14:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HL1EMyfsq8mm; Fri, 30 Oct 2026 14:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D02A812BD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369307;
	b=WSqun+n8Y82NrFJtk4UkZuEL3hKmO2oXuJX8AAidLpRnlVDgi14DGnLBHxrOAvTAVFDp
	 YWIfUWSSccQwCqDbGqV9KatpmHYNOsT9pv0kCApgh1yuKqwsx5L5WYCT63awWs5omFOzS
	 rKerzUyGBJp6WEQNCqJqtP4AmmCDoCVLC9ANOoWKhw8+QH94CawTlo3xyc6krkQGxuHZo
	 ItOCXgAyiovxZ3ltzdhOUPBjBs+C9xvAv+TKT30wkY54Dwka3Af9zryHzQJYwgpKs/w1P
	 O31E6Ef6aJOlU2mRs2KqCR7KR6brec2yH+DcRSCCeF30hvsZZYfH2x/AAIQ9VXZaO6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=A5H4HH3unMip90lg09IRqe0ZAAwlAJucRFvDOSWGU9E=;
	b=QvBH77yXo4HOBZXzW3Hm4mfHzgq+I/kcwmhau4YjzHTURNCbXa3r56TLaWgZFVrXFh27
	 n0tiUhqjDOkoPDUSQ1lgrzAHPzPqOjuZjWU+ZjIeVADHozCRl5MAwWeUxTWW7hwogv3Ql
	 Q7hJorERw6NJMFGMH2tDRw0lPIL4/+MA8b0sWdkRF992A5CHv44s34Dm3zZi69MMRuWMU
	 L9Lf63nDMKj4r6GQps19G2TfG6PGyD+1QqBBxuwoddbIw4FA8PzeyjhcSZwPvxm5Zs9Ni
	 m/OblrzpGvzB+7+1iUaggBoS+B0peE/Bv1n86t2UluiUQ5SoByOkfc7y2D8rgI4P0pA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369307;
	bh=A5H4HH3unMip90lg09IRqe0ZAAwlAJucRFvDOSWGU9E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bu6ZTzgIwBvuS2eIwW762iPkysPOMyrdYzPTxAWr2BJuyRgxy/ZEB7DPMl9WJPmZv
	 boGCnZA7//XR+8izLHv9XMwEXhmAzETHiZz1y9QpR1kSUSFcPYBwW3WL906eF6ego+
	 icKcNvp4yIL0akiiaRcCZ0mmtSTOglMdq3Xv2FHe0uuxaP6gZpvK/E77M4QIC7e29U
	 SuqHlxVHrclfFZuBNH8pJ8eLwZ5t+9Hm+JDqqWk4d92S7CAq/BezRzhvFBUnf5owm4
	 PFFySGAlbkLuXenQ3IailH0ONnSq/sZeUT8nqByubRQ4bL/PfQ1cGhYXY3DNo5dZFz
	 dMjS0Ys7t1XxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D02A812BD;
	Fri, 30 Oct 2026 14:08:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C56DCD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B612A40B34
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_v_W6VSdE0c for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C19FF40B2E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=RaH5nfPowDujX8vGSKAvg4Fl+096rWN63jSDpxS9aM8fc0HckyyPjpsDUlhmMIou/zaG
 tH6gZlpgOzQQ6RWbBEoEwkw8KysaYmhLclKuK7KpZ5PBh0KHHxZSnig/RpyxxbU30ZPYO
 SLtldlXVPJCM0NcMsVQNn8JpyLZ6coC4YNorh5pVvC0i95x3ZlONvZ4Iq4iRPPEkD7FVS
 0ZddVsrQs7A6GgnGs3MDnBQa7EB+NzTWhNqOe/dASBmi7Z6aYEgJyrBUNQnOMkzZYVLC9
 gTjnJ5odWtYmXgowvvbcJc9XhUoWPJtvHTvLa0myKcew6ELUDDz7lgkeSIpMWgejdYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QPsE8ocgYsd2O/l6JSONoM2r/tJc5E1n7PBehErjuLY=;
 b=jMR+gIzISE+2Z2+f1NfJ0/egfS5t8fuUrPIG03R/Mf0GqWSSCEEkUv2M8rVEz4D44ReX
 y+V3LASAjdjQZas+lqMg3/WxewEN+QMg+f6ODtNA3WXKN7Fbt/x5ndZdF4yrKCSMlCg5i
 b+FoGuVXc6arwTo/ogTyReLCFzGhf9sPzPDx2hmeVOFBfRFh/x7dDA52PqJ6ZO6yRXil9
 ScobcXW9M5tuEvqqNrnHeMp8LiTCEPgptHiy09mUlm0smYAv1S5pvenvNv9IEB5oPtkAo
 6vv2KuMLMvumCf91V4Zvl8LIp1q6P0JRHgT2mB3wxtyBAGy46q5OjjpZy/vYCkw3yWg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C19FF40B2E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0FC19D388; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 547c0e9c8c5c4e2b557557ee2da52fe5d986f3a0
X-Git-Newrev: 60f01615f91dcf7b755199f87c439d2cdbac269a
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.E0FC19D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/docker-cli: needs
 NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8138621508768284163=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8138621508768284163==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60f01615f91dcf7b755199f87c439d2cdbac269a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit fb0438aaf67da07027b1d9e734450ae5a333da23)
[Raphaël: drop mender-update-modules]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/docker-cli-buildx/Config.in | 6 +++---
 package/docker-cli/Config.in        | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

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

--===============8138621508768284163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8138621508768284163==--
