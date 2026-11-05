Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE17606A329
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XAM19LgF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ewg9ZdEI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C902408EA;
	Thu,  5 Nov 2026 21:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmMrcDn6M38V; Thu,  5 Nov 2026 21:55:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9E9C2408E3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793915714;
	b=MRT/twWAsTPDC/uCM7yZh61feFL87tIJ1reteNdSc8CgUZctKY43+f8ycMOoHkCt9RMI
	 PgI0l0SaKMRNdGXluKArG/PPGLwnVO6hI6vHIuA9+xIkVRrJJPoVAioZSwYYvBg8QxGNC
	 9/hOGoYXALaeJfR8yBlWvFxkPzMtDy8KZHasdqLVln8gWYhG6g3MHDt73a3y90t6HfviE
	 219gMrbVeGauR9OBnY4xjkToblDq3rNGVcguoA8uD6jMrKSbmRj01v8y86ZoYducR0UDN
	 fhWKC/K3lIpOzTLEw677K9/1q6DrMiQXxu7XPAY7O793PkwwOc9HzfdYNAhd4B4sk3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793915714;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PJQyHGWk1YRkU9XTv8eIodh1HDp0zVG3XGplGK8IrjI=;
	b=WHWEuxRkhUl+DrsmdwJW+84x74AD8TPDDfWPcm2w5IqkG/T6VqHIi5P4p922Zscu4ckk
	 5ENjZXJq+Gsqlcnuhl9e6LOY7Rf4fzFPFLNKXvRI8dRZFBQDZKb2amA8ohfGZA14finbI
	 +f8SqOmJWJCDrXVoSrmubMwHEIOfKsVeH5KGQFhLMi/4EG2WS/0FUa02K4de2sAqvdqvf
	 J+nzam8Yycng6pc2uMNvrCl+eZOXxkDHhnxLdiUhzYFhJ504C9L91rCXDxmEsDZxi1rZB
	 znBIxIi2COPu7//Oe1Ej2wHdH6Lr/0SspxtW5VkMLH+4axpvEUY4oXl+1Q0+oI4w7rg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793915714;
	bh=PJQyHGWk1YRkU9XTv8eIodh1HDp0zVG3XGplGK8IrjI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XAM19LgFZ/IZJ5dCiiWNJzkDODgxsrISHaO3GPZ6/I+i1c6e7kJD5DTIuYBlChBH+
	 Y7l59io19AV5HDaZ2TQ9+iEN25i/sJjIf66lI53dm2ZK03SUpT/JybHteIBfhYSkLp
	 3P3LvCsEuWmOoeFgfMjZF66vjeCdyvEWwYC332P2z89KebV3zUUZqjUR2AJwsx1hg2
	 qSnURTUf6emGgtFN524u3rKN0/ZXETPvzDG9o3CRj7+NaX7prI1kN+wCN+F+tHQEwC
	 Sud9qDdI4xbk33SabIIlkz0xWWJ4MGMxIOoGrJat2JJJA05GX4DdwwJU4wqtQK271M
	 s6GZoVuw3/tHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E9C2408E3;
	Thu,  5 Nov 2026 21:55:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD4CB7E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3F36085F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-wxw2QBw-PX for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:55:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1DA3C6085B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ewg9ZdEI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DA3C6085B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793915680;
 bh=9kYO7VgfalNYX4lIlHw6+ctqBCCiGMN01VYvjCF/IOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ewg9ZdEIOLi/85jbL7FPR4BAagi1shxD571MYeacqd/MvVJipS7tiCcLQ26vVb//f
 HX1JzxjmuzazwaoH1Kkq8MkJSOqn8mtDzmzGIRlkxlNIstKKtIe9dPOCAFR9HJEyzy
 cE8SoxC9x4/f38q90aUIIwonFdUKUAhoGWEfPcUW79PFNeRV5xhWPjE+yGteLWWRQn
 ask3CDp1LUHaUl38hRylue5k+c0ug5sggWCOELFzfFVA7qLwbM1l7P5B4RHL2bYDRD
 P7IZqRFk7KhTJaeKlq0fx/cXPoPMBxaDFZ3FDNPMCTDnDBXLuqXRt2kVD+BGkDCFy1
 KPGsGHc/Ra2uQ==
X-KAS-Sym: v3:f51bdf72230551df:oBFdRS2G8zfHBKRj6bG8Ba8AHJg7PXKupIQoU300YtD6J
 tzNbxyL69nUvBs0dh9dS989O1obLAFF6Hdf4ZLvvNkOyCHBtxzmxbHsHJBRDGOBayWkDMwH9NDD
 LQePK7osGqt2/g/FFH5/ja14WOBlEiEsA65gV8U/TFcLU/BUSQIV5BGXWlamtlPQFlpjMtWmzeN
 hO4BFtEMIEZ9r0iQ7LMNU5Z2+bNVKkVtYsbJxkV5wyr6okmE94aIwxIuLG+ZI4v+xmGRMuJdvmn
 pPNBFV2kRJ65+8CckieQVnIGJcS8hhT5jSeM+ux2U5EJdmruwawqxEhHVVwh5kCcKPfGu7DQ==:
 U+kmA9fZEbLeDd9YgdYythylRhrT6kL+xFVG6ZGSlhr+n8E7TVYo84tvqA5OIjaujMje37vFyHj
 Na5Vuit6pzK+78R/Rxqmo47u2yQDrPdEBioLYAeHBUh+mW3kCxY+YB8EPalNhYUg2oursesC0Zu
 rTXPhrzCou3FK4uurhlpg7Mf0ouxFgHbE1Xt7QARjuobRqJxNZjZBjB2EWnFHBzGquhttp7pnI3
 UjBMYgaZ5O5E/UE4MjiRrnbO6ffAdzd885LouGw59o0bnun+aNH9x+i9Gzeb/MLpFCX0M1zC8GU
 IMkWZjz6Ozhv2nr9hy49vKl6YOOSFMCiyIY9usg6qQM8XPA1+yW4N2RwxELgy+QeU/oCmbwKWm6
 /JKTfbAbDLDrcTc3gd3WXjNTdlvqZnkoj7oiB/+CroAePf23MEXkcAY6TKSCxUeKmeadC1w6MwB
 5H4+kvAUO4QwO7iU8L79sXFS5n3oyDxR7yEVv58+b1UBSYupS+ZnwQRy6QCUy/kmt+jRygK3dH8
 RN0lR+D9B4gwqyvkhs5pXU0ku8CzVinYSUj4tub9zKg7Lz925+IoqerECT0iQUz4v7Ve1RMbk6b
 UhdtgxIz
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C78D8A4C390E;
 Thu,  5 Nov 2026 22:54:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36894)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP5Ps-0000000041R-2fjd;
 Thu, 05 Nov 2026 21:54:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 22:54:40 +0100
Message-ID: <20261105215440.1613885-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105215440.1613885-1-bernd@kuhls.net>
References: <20261105215440.1613885-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 3/3] package/docker-compose: bump version to
 5.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/docker/compose/releases

Changed v2 to v5 due to upstream commit:
https://github.com/docker/compose/commit/2b4543935c092f2a9178121bc56e7b86c6b36bf6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/67d0a24c77af7c3e1fb6401cc68a34a32503be3d

including test_docker_compose:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3033929122

 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index fd715c3591..600f815d05 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cdf70334f2c6afe8fcf1c5d6b4065cd9e8d26dc6317811ce5aabe0f8a0e95951  docker-compose-2.40.3-go2.tar.gz
+sha256  faf3ce5928d0a44d4bf35e64cea45372f30b030002dfe16c7c3c6b8e5105a8aa  docker-compose-5.7.0-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 17390e6577..68d7aeed48 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.40.3
+DOCKER_COMPOSE_VERSION = 5.7.0
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
 
 DOCKER_COMPOSE_BUILD_TARGETS = cmd
-DOCKER_COMPOSE_GOMOD = github.com/docker/compose/v2
+DOCKER_COMPOSE_GOMOD = github.com/docker/compose/v5
 DOCKER_COMPOSE_LDFLAGS = \
-	-X github.com/docker/compose/v2/internal.Version=$(DOCKER_COMPOSE_VERSION)
+	-X github.com/docker/compose/v5/internal.Version=$(DOCKER_COMPOSE_VERSION)
 
 define DOCKER_COMPOSE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/bin/cmd \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
