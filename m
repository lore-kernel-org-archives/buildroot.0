Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BD6083616
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pe4MOs36
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2515881573;
	Fri,  6 Nov 2026 16:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id IYVqHmdJUIZk; Fri,  6 Nov 2026 16:08:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 535B381567
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981331;
	b=SIrpu8crn2JsZgIKCm3zvlXIMm1RgHWgmNG/bxB6jb5JbUcmAAld+Mjf0XwBZgsRW0mP
	 qRnN5YbNdgiGDuyEVqP13mqXfT3Tb5EMG2af/dIDJPVoMKAGKl7ATpoztkdRdqA00VKL2
	 fXlnl37N7QvsJdgdYdRIHExMY8xgYtJQ9VeXdt4zkNkOf4HH+qzZhf2rlHhkSL4xY3EAv
	 ebjm9C4LL9EIk6pcDfJS3nj9oc7DAjbXSnJgO2Ftv6fyd4K/1psUjv5QDCrrKEi9Sn9XQ
	 Q/ny62SpcSfYSaRj3tRz7Q5IoqLa/bhNK5l+1yedBJ0oOuGtRS845wOy3dStblqGKIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981331;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LcEDvONK+cjt3CDx96k5OrtOQxcFD+BJhx5AlGZdan8=;
	b=J+OvQcCZ0TPZMc7ouSJNaMoBr52qfO9zOtHIhtYQ+jDeWuMnDFakzdlNBUWhFccGjD3R
	 hdrAVSpWjgYQJMXc9wxgjkY58/of5QoXayp+jIjRzrp06+ymTSou3h5pOXFIfU1zSVe10
	 ZrfzVBksF2wXh6WYsq4c+nSSUvyRwH56GFAF3D1SKREUmUk5gtK6+jm0LK4XfnA2Y3YoY
	 L9EE29ZfzI/kLEqQe3GOJa2o/CG0aHdoe+BbCwdVLx2JREl6qex9VT3AM3EhChcEbj0hu
	 Dhi9ocGMwh0P6w/3+MazFz+b4yEfNrqvd4S0jRHxzOE9nCDBP04u6wMOfoYV0AmE/sg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981331;
	bh=LcEDvONK+cjt3CDx96k5OrtOQxcFD+BJhx5AlGZdan8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pe4MOs36x+KwnumcFVaO7LCSAJ7QTnEcEsBwyaEr53NJTCZG23A516QAQy6qHteJO
	 Qo9d/6wDU2mQXYB09jz/tSXtG7Fudf0RXVS4WaKBRHAzzzyd7V1LAyi1ihVezb8Nmc
	 wOoR6MJIA1dK/T6CrWO/5pXsNAerZqqwfjlCpJOOZK7XMKydj2mxwXZG5LtcUU5fOU
	 1Pn5Kwolhe7oCAGIWiNkM7JhI+OJh8DAlt8S2OoyLGvKILaUCZZJWjDg6SSWZ8CJxC
	 yQZkiEbgMjoLNVz/gMSGPmSMH0jMrGadySeLekPMGgjimaddWtckeuyaD0N/l5LTsM
	 YXFQZO866mkQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535B381567;
	Fri,  6 Nov 2026 16:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7BC82E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F28608DA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwzFNpWC0Rbh for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 200DD605A7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 200DD605A7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34ED99E09B; Fri,  6 Nov 2026 16:06:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b77d3f1479e15f777a94b9da221cf4f9141a6d54
X-Git-Newrev: a3e5e742025c537e1f7fef2a400a2b2eb9d0a688
X-Patchwork-Hint: ignore
Message-Id: <20261106160659.34ED99E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/docker-cli: Fix
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
Content-Type: multipart/mixed; boundary="===============1527583584023111529=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1527583584023111529==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3e5e742025c537e1f7fef2a400a2b2eb9d0a688
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/docker-cli/docker-cli.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 8ca74af7d0..216cf70b95 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -17,6 +17,7 @@ DOCKER_CLI_CPE_ID_PRODUCT = docker
 
 DOCKER_CLI_TAGS = autogen
 DOCKER_CLI_BUILD_TARGETS = cmd/docker
+DOCKER_CLI_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 DOCKER_CLI_GOMOD = github.com/docker/cli
 
 DOCKER_CLI_LDFLAGS = \
@@ -29,13 +30,4 @@ DOCKER_CLI_TAGS += osusergo netgo
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
 $(eval $(golang-package))

--===============1527583584023111529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1527583584023111529==--
