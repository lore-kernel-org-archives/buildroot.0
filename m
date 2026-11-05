Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E422606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HsbGrYzp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EAA9811BE;
	Thu,  5 Nov 2026 23:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgHZQNT9RdD8; Thu,  5 Nov 2026 23:11:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6EC1F811A2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793920313;
	b=YgcomGiYB0Zwn22hb3zgOKEIaThJhOP6V4rzYQNdLrYwxJmHFcv6k2fv+BAuuOkz5cet
	 C1L9NldBfeoV6myDe35qLU3zmGfhXHt0tQs2yLSz9k2m/E/vq9vu9bYjT8cVUT50BuU2x
	 QqY6vf7hxlao7NME5jRnXyMFiXlw8ronQfghBLzMn0ekI5cTvM1qL20TRwqDpEnSclpDT
	 TWJzEYJ8604wzwN5GmlP2oexVAfUv5DbWuYG77caOGXNBJ5kLRz6n15jMCs/i04eVcNtj
	 n4zEBMjYY6Obn6kvI07w7VeXTNLpr0kMTW3ZCYdsqcKZ9d5jCmRg/TUw069XgP7WwVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793920313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Yf/3egdEVE/gqhq2U+h5mVRO+S+aEaCaUXxBqjBW1yM=;
	b=NB556HV1nWvk9AwJQNzKCSHS2ArLDS2KkrFfYcCeTFksC6r9/Lo8wEI9ws4WwZssLXA8
	 IUzdF6QGaDK3ObJRxM1NTreKwX7iR1AqTRCkZMRn9QlMCWxUwOSSw093Zz27g4UF1gMuS
	 jSWsrcihC0dWn2nh3oiv3CN/ovS8W66ZrLyCBVNUfTp/XYkl4bFEY4iLkLszjX9BxDwSH
	 EUGzoj3/esOaAC7wJJvhY1LQj/qyRe1i6GYW30Tl0xutOaqmIVN3+KMwX6XbirF6qevgs
	 RREg76RH5YNgvfCVrdT8tV73uGLbH2jvrt+wJXlKMxAW28+We5mP4kihhRjKXUK2jlg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793920313;
	bh=Yf/3egdEVE/gqhq2U+h5mVRO+S+aEaCaUXxBqjBW1yM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HsbGrYzpGRZCPnDhRolebcpBNzBuILkD6OZ56X5eGUgXxs6y7MBvSAlTGkMD5Xmvm
	 nnY1bVdoLN1iyrGP6Un1dh5S776Pu5Mt/QB451B9ahVssZF6AI5fRlqvnl8n65P85A
	 is3iB4kY37R+vLndW9A6Bi4JKsWGFuk+JCVlUvDxbx2VOKu3049HygJjxhBrbEsyDt
	 YIl2MgDZnx7SKSONyKuX0OSnEeZt80rvlSxc/I2PDo/RhZd+1/2CPS3jRK039eSU+x
	 EXaXhli9rs3Ymm+/cf/t9vIoUqvjB4rAgi/0ApWaovRKMKfh5pz2MgKKs/eDZFDQYw
	 nx17haUfcAsDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC1F811A2;
	Thu,  5 Nov 2026 23:11:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E717137A
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 248AE408D7
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIiCGcEh5JCH for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F32D408CD
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F32D408CD
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 004059CF1F; Thu,  5 Nov 2026 23:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 00:05:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41f189330401904d48eab86de61767ac49174ca7
X-Git-Newrev: 6c7a9c3110d560fb9b31c1127844d4c08f8026e9
X-Patchwork-Hint: ignore
Message-Id: <20261105231020.004059CF1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: bump version to
 29.9.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c7a9c3110d560fb9b31c1127844d4c08f8026e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/moby/moby/releases/tag/docker-v29.9.3

Fixes CVE-2026-116587, CVE-2026-116591, CVE-2026-115538,
CVE-2026-115539, GHSA-2fqp-xg6f-v7gj & GHSA-w26x-xg27-7qjc.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6a4931a648..bfc184bb75 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d7ce182528eb4c182f3884a7a83b7652ffcbc59b21d3d302050564ff949a9689  docker-engine-29.9.2-go2.tar.gz
+sha256  cd6ce54e46ac19f5dd0b5226a9b292965ba542bc16bdf9edbbca946da8930b15  docker-engine-29.9.3-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c6edbaf6db..a8fa808032 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 29.9.2
+DOCKER_ENGINE_VERSION = 29.9.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,docker-v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
