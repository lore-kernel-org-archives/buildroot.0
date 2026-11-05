Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F4606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pkOlrpDj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F326B408D7;
	Thu,  5 Nov 2026 23:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nM-d5WZdcPG6; Thu,  5 Nov 2026 23:11:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2D83A408E3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793920316;
	b=b2VWsK+NZJGdEEtk/+ip8e6PRPyPXg/Sr/SMBeRq4Q+Xt4Ow9XuADhtXMlGbtssRCqe4
	 pFzjigUQVbXRr7ib4+TKtNIU8yGY+mRf8VhA+Rvlc8h3N4j5pQ8oLUVWHNvQXfYFAY3AC
	 +aqoa9kLeDLSQ6xLNlPHM05f9KY23tMdZwXc++0LN72EPHSTuQ0Tp172PyhVUVKSW/yhp
	 Z6ETMvGvdRSXjkS1RXBlqiF+CqltTa4P6uX+NdHICSJ/W3JkVbDcrGZ1jJBGcxyWp5fGR
	 twy8DywYKJhPXYFubIGdX7iS8WHNinAwq2iToOR/ED3C673tiEJiegF+QQ+WlVtsxRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793920316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f3Th+LVnxB9+JbVAeyZIkLxnNvNgu4/f1lU+t6G92Ag=;
	b=kUxxfGeAVjefxUo9AKYBrMOkXDBCBo/qIox5cG6LRsFn93ZFm8T5zx1PO33QgtLllK6P
	 wyInZwSg+2j4IhqjyrtOl4nHvjnrsxBeFGMEe3o36zeQwmi/3NJGDtTgjop3zHb32XC8q
	 6hILJ7vMw+COzK459yhPntXiIJ5mKA5KIWyH/tAJpFlv9XfqwWE+IH7xXL73/FApfiVQx
	 3frO0rfYIZazptrZme7oK0/sE96/VWF82wOlO0qg5/XRE1HUWUlkK504G+wTbzMQbrnkd
	 WQb5jCP8WEc0MJsRPKVznd3rX12OvvMND6m2SeXUqmgJhJzpl6oC/iul61psVP2LPow==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793920316;
	bh=f3Th+LVnxB9+JbVAeyZIkLxnNvNgu4/f1lU+t6G92Ag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pkOlrpDjm4kCQqcZGE8DWEu9WdLS6314lc6toq8MqdukvZU7N5bWPu9WB8DtjUpLe
	 1Em9su8rA7PP796WyTUf0VeKh5s/EbpGNm3Pg+1mrdYccmxCYSEX4qLISOJAVek7eT
	 uqkSFyfxYyat1AFzts2tCA86ENP7y7N+pIyfLWrZVik3tudax4lc44n6eAmx2NLBfo
	 VOFPehCnNGj8yRcDti85jc9u2hEFQjuH/6uTPJ/+e9OqV1Y1qWjl6CkAPxvoTMGPJK
	 /Mdym7fuj9nVIhz6XWyhQtuz0Jp7j1vTcJh4NK/rLW00MPUT6qnED4TeTjJLh83sqc
	 JKIInVc2hif6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D83A408E3;
	Thu,  5 Nov 2026 23:11:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A194137A
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 409486089A
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfQT_rFht2ma for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7F91460888
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F91460888
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BED99D3A2; Thu,  5 Nov 2026 23:10:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 00:05:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c7a9c3110d560fb9b31c1127844d4c08f8026e9
X-Git-Newrev: a75cce0723bd51bae00158e0495e8776aee84b27
X-Patchwork-Hint: ignore
Message-Id: <20261105231020.0BED99D3A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-compose: bump version to
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a75cce0723bd51bae00158e0495e8776aee84b27
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/docker/compose/releases

Changed v2 to v5 due to upstream commit:
https://github.com/docker/compose/commit/2b4543935c092f2a9178121bc56e7b86c6b36bf6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
