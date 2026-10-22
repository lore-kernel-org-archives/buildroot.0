Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDF606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gKpzMBmo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A1D4051F;
	Thu, 22 Oct 2026 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msWfcwoxn7Zr; Thu, 22 Oct 2026 21:29:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 523FB409C6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704571;
	b=UMn/zTK81IuIV6IfPPZMwy4jg6qbv0M0a7jtfywD8O8O/KwJ1rdztzkjPICPwza+gZ/Q
	 v6P6ihl3DW8wNTEHKVEL9ArMgzbRNUj8JVX+oPtQdWmAk02br0hky5j0MYIuqFcYgvaRN
	 GeP8HBh1U/9tkXMG7VJnOuf0H5kjJixHOfHBcctwSuxBnxqE1L9qPKOaF9IfdbBlPiJiw
	 ANd862/kgbMSXmZ7rjZnUv/R7uk821veheiYaffgwO+WlD1XsP23YsZgweIr3N7ef92DN
	 OtuaiQ+I6CfnvcWUbw/MECbR8upuk7XApoNeNFxFdQisfsa7i86+T37uHYWUyzMiMLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704571;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WH7PPihkaVMkUbYCokO82os0nPmh0OxRcizm6dXOgfY=;
	b=heBAXAen9nYZnJpPKgAdq/aRPzZceIqmCFW3z7RCWCeU48aS60HPvoYzmrhOXFbubx0a
	 5tek33C6dWN9VEWir1TG0bYIdw+UAuwzI/DSCTKi38b4J+U9nM5IYspQFAL795DLiVmdl
	 Ln8nZy2lCUrvQ/PHzsFMVZkoovI1xP7rBgkxe+K1JByG363mzUT5M0tNREUyta+LbVXUh
	 2kwdqeB32R09R7sskXThFjk31+oJgq8P4/yVLtuHoRIwimD1OwvanKZvlexj1tmYyjpdk
	 935HPn5+uOSEfhlzS89AyRz2x+PP4k2QDJbe2JCKd4OZkaf2Oz+OVGglwo2dG8UrovQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704571;
	bh=WH7PPihkaVMkUbYCokO82os0nPmh0OxRcizm6dXOgfY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gKpzMBmovPQf79jDhKNQMBYi19T+cJNNetlRJzDgFcRFL43lBcqzc4jNbpDnd7wkd
	 /ydTWbjJWh3h3I6ruGgQio6JoHm4GQ3wTU6AFDggdqtirTmkaLh3FZ2dG8s1lBBXQv
	 ACbwhqNKqupYfAd475LZqIqQOlCuqYoqmu72ORWQ9q9eUTm1OQ2MkdW1qnUmyoZaaN
	 FM2ifmH91XSM3fq9BchUlz+TKDuqHfiY9tAql5GtZovoawy+ihH7RQpG4i8Ht5YbVi
	 EBVnZA13ys13cxDdoS3yOW+W3StI7DRPF1VHvCCtJnMqB020M+0Qw48JZl/gcLRU+Q
	 pEEihj/qAt0Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 523FB409C6;
	Thu, 22 Oct 2026 21:29:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00DC13AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E680581352
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kF4NQS-dY4lq for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:29:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C06580AD3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704569;
 b=HrKVjrTKEk8eugF/kA+j4GLMpMTq9zkZcsmtk/PmdQVOEr8/OjVNao01BZAtFYPMAqfQ
 IVZDphmoh5hBEIc4Oz9ndG+N1CdvbvHEhIM/ltV0m01N8HRlALaLksyxDYlJMSg3OeRrp
 qOstdjh4q8lEFSfxWM4WFC4U6LRwBb1dC/vsmdyIBX24/9xCOxt1d4HRLEE4S7InU/0/k
 F7pb8AS49OluC1TmW2WRa2T8a63DWl1zsCAkqci2ao2a8ELp23Qh6V8sV4CTlPzLVMY5G
 j+B/E9Cwbgy8TSFdIegwptgTmXSMyMZJ4l15ANeJ/q4uYxC/YalAicEnJko2yulMQ6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704569;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KLhh6vrUuV+lUk7DzEk6VBIaT3saXmHBv4iARTwjbzo=;
 b=Eoc1V6R5y2nK8AsMZA6SgjYYVqO45psxFQ+V81J15Ack/SGPUxLDN7LhI3zj+0gyPcfu
 qqgZSRVX5Gu7WO45ZDr2D+Pkcp0/hqgP6W3Uin3J+jEfMDQT6wQVPunvLGlrqdaB2Q5b1
 Ua2Cf5gTcV/CDAQgPJli/f2jra/SS51ocx90EW8tBAjKwHi5FusCwIOL140D49e4Fbaaw
 yzfVEXEOwvxwF8Twgao7uJIvcNeufKtyIxa8rhNpL4vajUp27n/yhVryv2RMSiiL+8gD4
 inodQhL6tEDd0VnfrMUM04cMSEPiPnbYKOZsa8Vr5H+p59xBz/J9dCXUOpP/kd2sqmQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C06580AD3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 190929C5B3; Thu, 22 Oct 2026 21:28:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:27:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c41f4f1221f1812b4110dbaed0cbf7bf7b0622b
X-Git-Newrev: 69e98fc39aa8e1610a5cfd7e74e193641d57857d
X-Patchwork-Hint: ignore
Message-Id: <20261022212805.190929C5B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{opencv4,
 opencv4-contrib}: bump version to 4.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69e98fc39aa8e1610a5cfd7e74e193641d57857d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/opencv/opencv/releases/tag/4.14.0
https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4140

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4-contrib/opencv4-contrib.hash | 2 +-
 package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
 package/opencv4/opencv4.hash                 | 2 +-
 package/opencv4/opencv4.mk                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
index 84e249cd30..810834abfa 100644
--- a/package/opencv4-contrib/opencv4-contrib.hash
+++ b/package/opencv4-contrib/opencv4-contrib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e0077a4fd2960a7d2f4c9e49d6ba7bb891cac2d1be36d7e8e47aa97a9d1039b  opencv4-contrib-4.13.0.tar.gz
+sha256  4f17abd1bc7f88e19c3380c8de7cbf2d863aced5b5ee8d8934cc7902b67d42c9  opencv4-contrib-4.14.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index c21be2f948..412846fd95 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4
-OPENCV4_CONTRIB_VERSION = 4.13.0
+OPENCV4_CONTRIB_VERSION = 4.14.0
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
 OPENCV4_CONTRIB_INSTALL_TARGET = NO
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 283f7606b1..cc74feb8a0 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d40ca017ea51c533cf9fd5cbde5b5fe7ae248291ddf2af99d4c17cf8e13017d  opencv4-4.13.0.tar.gz
+sha256  ee8fb9b30eb60850431b4656447080e3737b56e45719c92b67f245950609f86e  opencv4-4.14.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 0e2567eb6f..2a85290aaa 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4-contrib
-OPENCV4_VERSION = 4.13.0
+OPENCV4_VERSION = 4.14.0
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
