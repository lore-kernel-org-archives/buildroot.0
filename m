Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131816082BCC
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YJa5fYs+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6DFA815D2;
	Fri,  6 Nov 2026 16:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m82JuYpF_2Eg; Fri,  6 Nov 2026 16:08:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2211D8156B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981328;
	b=OQ2TG8oRFUWBr6ZzPtkXuxsXcntBxzvt6Tj7ELP7E4Vnkt3fqqLeQIpSY6cBjVwtTLuM
	 s5uupmf0vwuvgurklMkiQslo6HkvaM6qt6fT6TeNqNLyz2qNg8x+9uTlUxbOT+QBEwdA0
	 Q3H8q0RkpGeLh1BYuNSAd4qDZ0MUUlSAyLdxrXP8flZBkhK+SJmy+C4FzT/9WLjRS3u9P
	 P8801N8ATFOK3kljJpjOfTSZEY4fw95j0cQ2Ha16ZKRs06vvv3WL4lO1N27wgTx2So58E
	 /Rpck5rhejVWW6WJmIOtNeVxm53KbCxYm8bmKBV/krPqtlxNRCCukJRZonVLQg7oBhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981328;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fR0g8p+yjz0EUbgDYbiRo0fFf1wASMJFQkWNI8ROsxA=;
	b=Op3Mrm9sPWH1wu5GAGGGIZPkzliK6bYgHg1Ya/R/fcxpkhDDS8u2UN3XwrKajcP4Xn60
	 a6ERAT1QqMlQEg/FEBKsrCU1t2+V1nyb9RFx9LsCvjwsY5J/vtUqos83E944Aubmz+5+p
	 GWKdx8UMqNZnHBaDjZ9snICrjmL6GfhTKQ0JPNM8IVdyR0fzJF2Vjd3r7zkyF23gQXUXR
	 K4ieTRHshVkksvF5sjwdJmqzq/cL2E3C6SeBtdzLT0dHvK6EotX6vdpFJMko9SI7x+o/C
	 Y39E6uDRZI17NKMiKIHxykHgiede/sFRM7oYCRhCEL6Ddg0BMomMc7m8vSRoRaS6t7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981328;
	bh=fR0g8p+yjz0EUbgDYbiRo0fFf1wASMJFQkWNI8ROsxA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YJa5fYs+rlH1nMbgwImeTGXa0Gya1+/y+3LjoYQ1BzOOllnsQMcPMYBLpyoMre0hK
	 q5FfZWqmkYCjKlotvT+1Pn90jalb5GL8OfNO3YoMv1bfEcs3IffunU829orpKEg8ix
	 3za8+yo6TYve0K2muf0GpuJtCJzVjbmoPEWE1kYsFRhyaP8wl7mD5w5HVxF9q46o94
	 h0caY4AWwD25adrT3n6ARFHaRYWLKY56TGarUF33VmoU5J4FGdLvCTOk1mnRHhQlDB
	 GMxBK6mElpubFq2rAR7tVztMGDgkc+EfHbTH9nDOhxCWPyNLu+tuhZ1XTfBwVH895Q
	 A3kBXgXahJm1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2211D8156B;
	Fri,  6 Nov 2026 16:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88E3A2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D28281330
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsajOt0N1wMG for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9EAB881362
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EAB881362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C77C99E09B; Fri,  6 Nov 2026 16:06:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b9087a21312d61c2076852aa850eb5dc3b8dd7b0
X-Git-Newrev: b77d3f1479e15f777a94b9da221cf4f9141a6d54
X-Patchwork-Hint: ignore
Message-Id: <20261106160656.C77C99E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/docker-engine:
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
Content-Type: multipart/mixed; boundary="===============2893496485122449786=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2893496485122449786==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b77d3f1479e15f777a94b9da221cf4f9141a6d54
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/docker-engine/docker-engine.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index bf2dc588fb..5502284dc3 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -25,6 +25,7 @@ DOCKER_ENGINE_LDFLAGS = \
 
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
+DOCKER_ENGINE_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
@@ -61,15 +62,6 @@ else
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
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service

--===============2893496485122449786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2893496485122449786==--
