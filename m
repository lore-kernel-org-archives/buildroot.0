Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AC6606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gRdO8jtb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F9E1810C1;
	Sun,  1 Nov 2026 13:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUFNMHOYleiy; Sun,  1 Nov 2026 13:52:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 877F180F26
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793541174;
	b=OkWWfjCvBpZjKHxlMyeAogaWHi5OM6BfP0bmIdJe6QrtaJvIWemTjEnOMLRaOZvYYeEZ
	 bnL89tz7+zNQIeSYKJL/iii/KsmYwi1YGJbbI7pM9x1VySpdMTOuSg+acuOuW7NiQ0jee
	 EzJGlxYFG87WA+cDX3mrp5mRuDn+GgUK9WWF2mK/him24e7LkbLfu/s7vsMRgzaQDeMxT
	 ISdyr/Cq3OPJWoa+Rot7ExmSMimqayrt8HQyYphYDwDjOuj9Y2e9GMV1I2ywo4y4q1kAX
	 30YtUTIn2VJiTbInB5sSQQiMiQApwxRc78XS8fXjKNzXG4hU168MbmACNhZLvJtnyjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793541174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=DvirAo2ToZqIyp5BRTqN52nPOTsu4aE8FDSRmm96AI0=;
	b=GHWR6Uhg6n38todOmGfP74eeQSu87Iib+8PfKjL/mJUJ4H9FvfQ7CaXSNPOAmhr4Ejjt
	 tGYwg1Homwze6AstFUTOw3WqUSsgp9KOw4P7Lw46aLEXigEKvvSXjbaFe3kArUMmwyPky
	 4AGmKLnjX426ikXMx83yjMkLWN9wYbbSZSKq9tM8U5TgRogWTZ2Wyzdn913NL64yi/QQp
	 ypa4HZGiItop/Q/22CrfOR33vwzitxAg+L5qF1KUl79xTz8vli4wktQa8q1g4J+bClV7C
	 uKNOFJT1i/BQM03kfh+gPxIeOjKAzuf2SZ2PGZ8wx6sNStKzPsEI1JuVu+aF2araw6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793541174;
	bh=DvirAo2ToZqIyp5BRTqN52nPOTsu4aE8FDSRmm96AI0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gRdO8jtbtykHYuxx22gdVRwGXFCpBteEE0MuShKSSyKW0r9IeeA0clqQPwQ5IbYQN
	 tQGLKWRDokRTf9WcgysviIzo9J8VfqYPtzqubEFhP0huNAFr5XE+KQWmPUKATjtFW7
	 t2a3zsBXJmZ6ytjL7woc86siLWkx61tE1PYLIqgqco7oNwQcsaKBBU+8cT0CH1W1iM
	 d/mltofLW41FR09eJa7EKOZ/sZiDPuF9DGxltzAZfztZi3cOdBHeXsHF4P4jR3C7A/
	 zgY6MAR9X+8pSsNbYfSNKvsUrxWsQsyTkJiwXDgqfmqAlDEObR2avPX7TkSZJUBLJG
	 1dzaWk5xDR1+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 877F180F26;
	Sun,  1 Nov 2026 13:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56107EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F93405F1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB-cvVUfj4QN for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4A15240602
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793541168;
 b=FzkUUs7uEo1T9WbDIWiegv96H8l4CtNApdDyZZyNtfKa+q4lUT1sFUuiB3NArBg+GvQM
 Rvp1mKid8vdi22s+mq6+6mn4Kq+sfWBO0gtyM/w4ykHNdimuwjfDGkha+zpu2fHrKxILH
 uXeywVlPLUmPGC7XVKxYo1IR/iJMEYeoJOPftmPmmDZCofQk/SB7RaNPntVNoCBjAcCaX
 8CYoPluv9VlhPrAVZFBx1yix73CElUMwzPazRk+yDu/usoQHilpNTKW+vG8TTocCqGSY2
 nW9JeuS7PPbSa/SG5kLECGikWHjrYDMHwcCGwkhnJmfpFwAZCnyJ8HqOe/9Veh7GJHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793541168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dDjY81ayEBPSsR5yLQGS64BO+GhkjpcHSYHxRea2DYs=;
 b=gqCQrlJxNkZ8N852CPH4Z4yjhD9iFxNWRfcfy6QYCKnV1u9om8AE9M+wGaQqfl99OAHg
 Y8DMcSNcukw32Z4I/Zor2rNX1V4O/LQaftCHmXciKtxWgsjzC5ulqf1ov2YcTtHP19NZV
 +xyw/eM4eQ4T0m+I/JnHkvJhB2aPX1HrEiAF6AikTSZ6TikQweuzVx2NOypWfxX2fJjJs
 n4JtOjpr6IbixafVSPyhkwK7pw7b4n8boNzxJvRUumZZL77jQMREKGFMPyzvChx7I3NiC
 vte/xWffcg0Mp+Xoaw+Ws98+0O2Vr65d34RvbmOUlvCvoTW+lVYnJFYovAuOKEk5nsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A15240602
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 129819D461; Sun,  1 Nov 2026 13:51:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 12:50:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e925aba84470d25f03d923df49fbbaeb72d1ed2
X-Git-Newrev: 5e3b150cc44d2fa6fee583af40118d44d3e2f52c
X-Patchwork-Hint: ignore
Message-Id: <20261101135119.129819D461@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: bump version to
 v29.9.2
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
Content-Type: multipart/mixed; boundary="===============0137941423842170132=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0137941423842170132==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e3b150cc44d2fa6fee583af40118d44d3e2f52c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update to the latest version, adjust to the packaging and tagging
changes and add nftables as a new dependency.

https://docs.docker.com/engine/release-notes/29/#2912
https://docs.docker.com/engine/release-notes/29/#2913
https://docs.docker.com/engine/release-notes/29/#2921
https://docs.docker.com/engine/release-notes/29/#2931
https://docs.docker.com/engine/release-notes/29/#2952
https://docs.docker.com/engine/release-notes/29/#2953
https://docs.docker.com/engine/release-notes/29/#2962
https://docs.docker.com/engine/release-notes/29/#2972
https://docs.docker.com/engine/release-notes/29/#2980
https://docs.docker.com/engine/release-notes/29/#2981
https://docs.docker.com/engine/release-notes/29/#2982
https://docs.docker.com/engine/release-notes/29/#2990
https://docs.docker.com/engine/release-notes/29/#2991
https://docs.docker.com/engine/release-notes/29/#2992

Signed-off-by: Jan Čermák <sairon@sairon.cz>
[Bernd: squashed and rebased commits from
 https://github.com/home-assistant/buildroot/commits/docker-29.8.1/
 bump version to 29.9.2]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-engine/Config.in          | 1 +
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 9 ++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 37d7f7928d..4a72f64e9e 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_LIBSECCOMP
+	select BR2_PACKAGE_NFTABLES
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 32bdb45ef5..6a4931a648 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0e450c03c536a1304ba8fd26ca4c4ff96fac62182fd042fec90ffdf4a0969d40  docker-engine-28.5.2-go2.tar.gz
+sha256  d7ce182528eb4c182f3884a7a83b7652ffcbc59b21d3d302050564ff949a9689  docker-engine-29.9.2-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 5502284dc3..c6edbaf6db 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 28.5.2
-DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = 29.9.2
+DOCKER_ENGINE_SITE = $(call github,moby,moby,docker-v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
-DOCKER_ENGINE_DEPENDENCIES = host-pkgconf libseccomp
-DOCKER_ENGINE_GOMOD = github.com/docker/docker
+DOCKER_ENGINE_DEPENDENCIES = host-pkgconf libseccomp nftables
+DOCKER_ENGINE_GOMOD = github.com/moby/moby/v2
 
 DOCKER_ENGINE_CPE_ID_VENDOR = mobyproject
 DOCKER_ENGINE_CPE_ID_PRODUCT = moby
@@ -25,7 +25,6 @@ DOCKER_ENGINE_LDFLAGS = \
 
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
-DOCKER_ENGINE_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor

--===============0137941423842170132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0137941423842170132==--
