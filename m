Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F76606A325
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MdysgLUI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4425660D94;
	Fri, 30 Oct 2026 14:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSpiZ6ptzl0T; Fri, 30 Oct 2026 14:20:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 450D260DB7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370050;
	b=eINjshLUJ0qukeH7VA/WphMtcFbkVzRriNgGzgkJnmCV6/cS6o0v+XpuLvCeJJiuFOPw
	 9DqlOTgS4VAQu2inRIAQHGrs7dFWFElFV2Pz9zrAYCZUQ66qHlfPF60ua7EsL98YVN1xG
	 VZy4tmgwe1BTWWcxVNa2Vun9AGO/XAeaM40w66en6NaYJowbOjF4qmhIhKFVpavnPHrso
	 eBOHSpHwwnw6Oxzkx7K5U80ZvblP3XnLb3ku0w3JJ6Ge+e/0fN+ZzStpX6XlxRieEECmP
	 w+uTZzbEoLm8hwXlT2ny19NnWT0ey5DX+pC60AdhuZB7tewwBbRmmfdqL6oehFMp8FQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+eAbR3SoCl5n31IUWQcoHOv5ORIpIFRBzA6PbjJQi7U=;
	b=PuHoA6cYCO5bLjlvwdYqDIRScYhQOVcS+NF+978P84wmi+124n1mk/T8hAoa9up1D7gW
	 0+LZFNW0RMbU6avV2AU2mCqNsuNm89h/GkGjvbcIW9opk0nOKF84uqLxSAdWV92UfJDYO
	 hpnt5r3KvFuf2ZjZVsSulqYSOuqhzoI4fuLqZKLqBK7T9LOS+OXrctsXQ7vHQ0Q6uLodr
	 be8skRcV8LMXAaCVvEiEG2JPSUGYiU8GFBWTmemxU6QR6jHU1xQ/rpdX+JX1JGy3QQekg
	 crMG/dXg+vN+sH0Wb/XjX4u27C1Z9Bfy3VpKbCSvV8KRnmCfNTVPR9wwZoS+i9PthFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370050;
	bh=+eAbR3SoCl5n31IUWQcoHOv5ORIpIFRBzA6PbjJQi7U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MdysgLUIskAFNuV4+dHfZJitnc1axpEqMxrm/eSIW+9kKI+URXmzk1ylvYjN+PNWd
	 y1tAfDU4sECfh3GGu0GXI47NXK8XFLdhvrYOPGi5eBukQnkmqA9+xHRNngdJyFMTXY
	 XtqbJe69yzFzkIQDYS5l2WosQ0MJ4LH0505T00qqtxYFL7bwPfNsS5bei6m4MYMAAm
	 Ua/S+DfqK5xOHjyTPTuaGrS7duWyoYbX7+2IuBZRNc9hxxBDr5LaAf7dY4hKSxU1Jr
	 4vfpApvUUXXItxYy7mwHg+2OvnnnWJFpaU96n3FY29uUYhtnPBHb1e7ttt9siOrsSB
	 TemQ0lGqAQ3Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450D260DB7;
	Fri, 30 Oct 2026 14:20:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4608D48
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B114F812EE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1OKZEP1oNCI for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4FA9281135
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=Sf15khFHc61HEE07N0NK4hBAPLDmr3SLmofBeVvA9TGqj89fUxptB6HWuJ7zlzpArqLg
 P0rVjMHLAdk0QAKDjO5cmqNWpmY4RcJo9gJoTdODm9C58wdaKYNKr+EMElJ3XRCWnT2xg
 ZiJiba5YyKIjA4J5LV+6VQgm/AruDP2oCgz9PYQHNTC6w1YOoi+E/j1v+0oy3/bIQ81dT
 PpGURxgXpH0K5L+b2t83DEkO6fumTDrdY+L8YI/zkMtCmrdPxOhbAlB02D7bhphc8pGtH
 P4WSj3OkLklN5JM8y0yZ7/sUi+cfq33h8ZjzciehAIGtGBOJop2feNHxYwPaEBxKz8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FVPd0lyLYqy+svkG+WYkr1F+Zhpe+pHIOwwyLaHE0zw=;
 b=mAMXSiiutbb9lP7VRNTeILi//xyWqRwgU52RROOa7I2r+LrB3wTVcZMQaySI/PqWLhps
 76fnBsVEqX22/vB7iET4F/6pNg6hMuF8MTIK2pR+2jp6gN5HbX8xZd06FOQ8k4AcQ7j1N
 kMmIghww8jmP+Ae9PAX70Tv9j1LUfRHVG1Rsv1OSqgYT8BV/feqEmZSI8VkVCWCT4x2iu
 7WuuNKx6jqY9KL4evfACrThQJ31aBsbaI/D/X8e59HMiQTypsZ5XIU9ooIIDFCQBkb/hW
 5CVXUWTrF7nTr537Eo/3MOwSRhSaJFy1653Bm/X48zcz9IwyeVdB5j6xiGFlvJSLFSA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FA9281135
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62BFC9D388; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 018be346fb44a53e6a82f9eb10c7ac4e889e1b26
X-Git-Newrev: c7e737459eaca2084fe79213e4e07826f00ff548
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.62BFC9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/docker-cli: needs
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
Content-Type: multipart/mixed; boundary="===============7350513524802654749=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7350513524802654749==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7e737459eaca2084fe79213e4e07826f00ff548
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============7350513524802654749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7350513524802654749==--
