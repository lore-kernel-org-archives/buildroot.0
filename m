Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2758C606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I5Vh89Eg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03E66608B9;
	Fri,  6 Nov 2026 15:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7sOnwZg29LS; Fri,  6 Nov 2026 15:59:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2117C608BE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980746;
	b=EvtqCof7cu0reQcT5IVPydGvEB5g+95Df4Fi3kEcSJCDaOkHxomgoz4wPCKp56VqDZ2p
	 82MIJNBDSxwzKKshHFtkysaD6hjfRUA+y7aJYRcKAfGAYz/V/0h9ugkfS4ZuCimNYDTiv
	 29CQu1muePMNOZ6YOpz3F7vthPwOhIsaDRMeOA1MSMNhC1FQGXw784JIVshB67jOI3ow3
	 F2lNvI+JnYG/TwnvFzL65K+ke4wprFC4MBPd1soqbimg0caknXQjHFt+imbclGArOa5fp
	 UVQwRR9ee0SzpnDN5f3DkEs1e1evn/B4anZLkk5YEtTYNkjxLK4U4jwwV+/sBTsNmkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980746;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qM+lbiVOXKQUhBZiNLnE9igM5P/A8WZrjjVMRl9iPfQ=;
	b=eQut5JL0qvCWNUgMvgN+PPgLV6iPDZmM9UMNaRbsJSAp50Y2tClC3KyVo2V6C0nMZtN6
	 oshzZWacZgLHVWpqyLha07slY1xuYGnWfMlTqN3ag/q+jtGT+J2r/yckYTBuChVoTmeEL
	 U9nJSL9IU5gD30SCLYwq4RbylyxkBY1IqxNLIPzHAILkLI4bNX+ewG5ZL5WMTOin7SLTX
	 ikbLaZdZ0zN+xS51SHdzJOKUM0EZHdpaspw4z3v7pkTBt6gGAiYiRG5jaxlSLbJiA9qKn
	 0WtAmCw91MgCAD8+m9p8XhbfNDmIADC0JoNUEUO/rKI4AKcmH9lbLA10ZOTNgu4nXMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980746;
	bh=qM+lbiVOXKQUhBZiNLnE9igM5P/A8WZrjjVMRl9iPfQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I5Vh89Eg+MFt1ZITLHgvo9j9F6scrUYxB0I6Wc+ehK0JIUBoomJMSdtAVZCyMa1BI
	 8LsLL31L6KsEHDYUmVStDpA+GVd6Bpn6/00imww6koLG9sqJS5XjoZ8qqZhmVxC4Qu
	 ZlSdUo/RNcRH5YWM7mFmYgr4GBtLaJVX84Oz3Nj+nRgdE+hNTFUMxCkilXqV6FG4rv
	 GVMs+bzg5Vw3hydDI8hzsRbtDqjZVxTrAz260V/psCGP9pn30WbKgBkySomPyERs2E
	 d2o4dqrYULxW3oRrcR+lMljQQv+FekofPnwxAFvAcwxXvNC+CVIPus9rY789rAUmu0
	 tP1sVhdb2e16Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2117C608BE;
	Fri,  6 Nov 2026 15:59:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 553E132A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42A38403D9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94xtQ2aEpeSO for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 67F07403DE
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67F07403DE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F9929E09B; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 13:21:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d19bcb52080b16ede6b08bc8d37e0eab8bee7541
X-Git-Newrev: f0f660e43b766676f09e815e311eb5d8e26825cb
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.9F9929E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/docker-cli: Fix
 go module version information
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
Content-Type: multipart/mixed; boundary="===============2363223126189563805=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2363223126189563805==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f0f660e43b766676f09e815e311eb5d8e26825cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Apply the same change from docker-engine to the docker-cli.

Docker's own build system (hack/make/.binary) uses "-mod=vendor
-modfile=vendor.mod" flags, which are crucial for preserving module
dependency information. Adding these flags makes the previous vendoring
workaround obsolete for modern Docker versions.

Patch downloaded from
https://github.com/home-assistant/buildroot/commit/dba1173fb4cfb39624621f328fd2811f50a34513

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bdfb817b1c97da7835e7ec60e5bed962e1c4c3b5)
[Raphaël: fix conflicts in package/docker-cli/docker-cli.mk]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/docker-cli/docker-cli.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index e118481838..1c5062e3d5 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -17,6 +17,7 @@ DOCKER_CLI_CPE_ID_PRODUCT = docker
 
 DOCKER_CLI_TAGS = autogen
 DOCKER_CLI_BUILD_TARGETS = cmd/docker
+DOCKER_CLI_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 DOCKER_CLI_GOMOD = github.com/docker/cli
 
 DOCKER_CLI_LDFLAGS = \
@@ -29,15 +30,6 @@ DOCKER_CLI_TAGS += osusergo netgo
 DOCKER_CLI_GO_ENV = CGO_ENABLED=no
 endif
 
-# create the go.mod file with language version go1.19
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_CLI_FIX_VENDORING
-	printf "module $(DOCKER_CLI_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
-
 DOCKER_CLI_INSTALL_BINS = $(notdir $(DOCKER_CLI_BUILD_TARGETS))
 
 $(eval $(golang-package))

--===============2363223126189563805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2363223126189563805==--
