Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0958A606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=izgPNkl2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF776608A0;
	Thu,  5 Nov 2026 23:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fm2m0e3PpdAI; Thu,  5 Nov 2026 23:11:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CCECD6089A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793920314;
	b=WZZ0FhNL+iF9zu53QiDmDR3iCGHVD6CVY6nUQYVrm4qdAwahRDEAgDJpTpZlE+q2Zc8q
	 YTXxRxHIpGA+MyZvp1frV3ezXkA0N9Gsos45LoFUkHQNbMERkf9VOPZejap4nADJZ/zqU
	 V3eJ4Rs0Qwkn2X+LvoePMXP1UFA39MYH/nFxN13k2anXb7C0Q9NiuQ7JAgv2Fwvv7kl+m
	 BLIhCx7qK/sKYlworo313gsVH6QuNNHZN8isym6IUUuBunbAGcwBb/k+k6rMhvz6iUwAJ
	 ZrPO6KKW+btbxissk+336mgwbWJhGbJO3oyO3BPmeVaG5U5pKTFSeGndQn5SUch35YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793920314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wpSeD+e/vPgOeCIKPUu0fwVSveaeuvl1kvjcdw0FSro=;
	b=IEzCZuqoaHTlWggvqHLDJIV6rKPppGDVqKfR3HbTM25ucsFrAkJavDJjUpCzjrfgDo0z
	 JXCZXVZN6Gdou9F+nqs3bmkn7xVMkz1AZtmQHuL9R5j3/DZAeRrVdJtHKZN9hTR+DfVtH
	 BbLnNTskzS1BHefM38Sm4aaXkbIqKP0dbbGKMaBKqiPMz3OijvIPZkHI1sCvrTzU1rzIm
	 DblozmrnBn4fzwULZyVYUn4ivYDehFcWmwLw7/dOrdc2h40VMrJ7/07qZaqk66C47vX0+
	 uPyXJ+DVifyKZYYIh8jTRskuag0Ih4sW//wCBHqgUDK5BaG+byf1jujpT1HxjZCnwtw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793920314;
	bh=wpSeD+e/vPgOeCIKPUu0fwVSveaeuvl1kvjcdw0FSro=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=izgPNkl2XjF1yuJPwuJBhlql/JB6GNf8NaiZ562YM6CttULXeDWPLxKoxx36ioe93
	 4pX4Rn3cOl/7Y7YdSjAF/u+NRDP0gJSjBixCvD8RaYHpLEC9lisXK12DqhquInCsO5
	 bg31zuz0Ds9Pcc4pkKcXgzxwk/xHmxVfLIE+glUBVjQNsdatmaXTwTHfahMdreM6Wh
	 XwPsM/+qzsdyagf5BVhUEdOPSgLJEvNC5KhF1UpeAyY5Orl8PTMD++dzuszKjjxhLO
	 HmZHoBsQo8K2Rmq/8QfZsZ40CWx7SzrJr4ao05L4SiP/f1gP4UvjN27R7IqujQ02e8
	 MQdZ99eHNxHtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCECD6089A;
	Thu,  5 Nov 2026 23:11:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FC0220A8
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D84B40378
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5W11CC4E5Wjd for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6E141400F9
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E141400F9
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA0A79D385; Thu,  5 Nov 2026 23:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 00:05:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8d7b4416942eab1f92069d249314294a2786914
X-Git-Newrev: 41f189330401904d48eab86de61767ac49174ca7
X-Patchwork-Hint: ignore
Message-Id: <20261105231019.EA0A79D385@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli: security bump version
 to 29.9.3
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/41f189330401904d48eab86de61767ac49174ca7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://docs.docker.com/engine/release-notes/29/#2993

Fixes CVE-2026-116587, CVE-2026-116591, CVE-2026-115538,
CVE-2026-115539, GHSA-2fqp-xg6f-v7gj & GHSA-w26x-xg27-7qjc.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 67f4c1195c..76a0bab4d1 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3b1fab5e2ee2d6b63b8ce0e8bbd08d6f54c0537c470332f2c345ab997233409  docker-cli-29.9.2-go2.tar.gz
+sha256  23d7472c80bc7483e57655085d687c631b398837bbc92535528c4582fc17e95b  docker-cli-29.9.3-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 563f4c851b..904f7ab150 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 29.9.2
+DOCKER_CLI_VERSION = 29.9.3
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
