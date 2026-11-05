Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBBE606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Im7Qqlrl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 865BC608C7;
	Fri,  6 Nov 2026 15:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nh0YMgRtKvKq; Fri,  6 Nov 2026 15:59:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2E02608B9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980765;
	b=HBdFB3iRovLPZuRLDwwbMWfyQ7MiIushvJQz2Njwt2Ma3xjWp5HgAURKSuA0GCDzrA6u
	 uA3RXOWdirIM1FFQvLur7ekn2ytA/9FOhlIq7tcQ1V2OvpAkPQ3j7EItPFXR4mbG5Lx8x
	 zaphp6IpsS/4V3QMHGiZCfDdmriEIAwrmydL614BTbdV+IzwF3HKndBu+DA10LBdWYE/o
	 bdaxeLHFEEZwPeYIbE8enQv65d3nAWTWEePhbHAkP6JvYItQu5o5kDPWA5coXo0DZL8/H
	 xmhNiqVhqMA1zvqpbU2BODo4BVlwwhff0EW4sDtnrTHdWoszrqOio0ar3wuUGbMAg1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980765;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8qUtW7RPfIqgS2yeQsYTsyjDtaXC624OVQdc62oqK2M=;
	b=qZj9+ewsjHw1rKjsaa8dyKdnc0uPPGYZglnumAzmD+cGFLpynS+oDXoUR5pTg2DRPezV
	 6UEyYJnQy9+swIsLkPYFNP/r4luLeLF8uSCnADSetOGcTHL0UNfm6JWkYvz6YBFL7KsBR
	 Hmqm+28wq0pUtv4o14B2h+LOdyzUycs6kPwb7/fmINSf9/aMBVsqhvgkxCfvL0sjDEv9t
	 pcM1od+gHfYIsbL5gEugOT1n8jk6rkzB2UmsiGhir8bRfPmX13lVGHiEX7X3JwRxINTwC
	 UYN1WIndBRQnLmGcftaCawrIBXxuIt8EwUCcgzwskICOC9hJMwTZvnMGPpreeQ+fCfg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980765;
	bh=8qUtW7RPfIqgS2yeQsYTsyjDtaXC624OVQdc62oqK2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Im7QqlrlnHzYWfJ7Oa1AYEhBrJSgKxg4GANiD5vbVWm21iptuIu1Lq8NBbMJ2VDIk
	 gWN7i6tUDxBMPGZOduyU9QhQAeUC67qXocVEetFone2wAeOFeAS4MXIHa9PNFPNKCN
	 qcME5cp/If23rmoa7WD9EO9zyeSjcNGwUk+G0cDa9PdRKw6eJ7+uuJomLLpijNnLkz
	 pCkdqOYp1rRXStv0Zatyf+w2f7iccTP2kfKRqeBQlTYM783/GRQy3tM7wICrMT5Ehb
	 MmFeRhImY3W3Gv+82AtU4YsD68tlsxvGLHI2xH0oM5aXrOKVdvELOftcm3+gL3/YJm
	 Q6RSXUt1BG2Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E02608B9;
	Fri,  6 Nov 2026 15:59:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C899E34D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD8778102F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGwgKxPdn8aj for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6828E80F8D
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6828E80F8D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9376E9E0AC; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 13:13:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f9dc1fa6419d5a8d0fef2c49d04545561b78dcc9
X-Git-Newrev: d19bcb52080b16ede6b08bc8d37e0eab8bee7541
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.9376E9E0AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/docker-engine:
 Fix go module version information
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
Content-Type: multipart/mixed; boundary="===============5176103595271011466=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5176103595271011466==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d19bcb52080b16ede6b08bc8d37e0eab8bee7541
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When using Docker engine built by Buildroot, the BuildKit version
information appears as "v0.0.0+unknown" instead of the actual version
(e.g., "v0.22.0").

This occurs because Buildroot's build process doesn't preserve Go module
version information that Docker reads at runtime via debug.ReadBuildInfo()
(see builder/builder-next/worker/worker.go).

Docker's own build system (hack/make/.binary) uses "-mod=vendor
-modfile=vendor.mod" flags, which are crucial for preserving module
dependency information. Adding these flags makes the previous vendoring
workaround obsolete for modern Docker versions.

Note: Use "docker buildx ls" to verify the BuildKit version. This requires
a Docker client with the buildx plugin installed.

Patch downloaded from
https://github.com/home-assistant/buildroot/commit/eb49dd0b3e7cbf00ec3849349251b9798a7d7f43

Signed-off-by: Stefan Agner <stefan@agner.ch>
[Bernd: rebased]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 377dee2baf89d9b41c35097a3eb128761097f5ad)
[Raphaël: fix conflicts in package/docker-engine/docker-engine.mk]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/docker-engine/docker-engine.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 7aee63cc29..fcff3c630b 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -25,6 +25,7 @@ DOCKER_ENGINE_LDFLAGS = \
 
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
+DOCKER_ENGINE_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
@@ -51,15 +52,6 @@ else
 DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
-# create the go.mod file with language version go1.19
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_ENGINE_FIX_VENDORING
-	printf "module $(DOCKER_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_ENGINE_POST_EXTRACT_HOOKS += DOCKER_ENGINE_FIX_VENDORING
-
 DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD

--===============5176103595271011466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5176103595271011466==--
