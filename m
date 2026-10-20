Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A031606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IXUpqUEm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFEE880F24;
	Tue, 20 Oct 2026 12:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1HzCKTcZ5Ej; Tue, 20 Oct 2026 12:07:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B70778100D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792498027;
	b=sDRD/3+eWDqK8Nhcynh2xZKxZBAMEi1dAYdJiBAJBSO67jssyCljokM1rceClZ8kuTJw
	 lDM8bfhH2XeMXG/ZC6yLQvbRthKEZvg1XSmrVHnQdURvUTqpIRBWfdIEhRbnGTQbISKcf
	 XwGyAPXNSsNkCQ3xav4xrVsy0Nqy0AtZLoLZJj0EYhQifoZnE0Z8KdQoPAREFsixGJibI
	 jxIIxjm3qO4F6P0p4Vd7h0/o9s5YWJleVtmCyWYg8yMHno2VoswzyCZSqWdnaP/uf1DJI
	 ONSYhSOFTJYfDWNuNvxbMJx5kcS+EeoVPWgRHg+P8zev/hj+ZbeP4NTnBtPUDzrFn7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792498027;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=6pRRQhI4LRmMvQUxJuBdWz3a8MRN5nvvekSSe4SWu6k=;
	b=aaDqjwJRvV4iuP+tDqVAZjiDPKkH6M3hVVRMoGGflGOaLG1av3mkWC7bnOx19maAHc0s
	 tE9Kd7Cfz8f5qGLQO88Xkui7t7ryVq5cf7NLE51AJ/a0U7cZBhaNz3iTKfZVNH2ezfNHR
	 BUGBAv1ewGzpxh21I29VuM5Ibv+Uox2HfVSNRzAM4XR+IUNRPGr8U6GgIcML+dP4kPBE4
	 13bP2J0RJ8WYrgOJNXBrJ3l1QWsjcP2Qy5tIir/GOoyaUD2kiCnp35v9pqNpNNS8fUTsJ
	 yKB5TWgwhsMl7T1R5j+Kv9OyN+vnJf6ASGD4RaNFWxKNUtoIGR6FK01+wG7U4rBdNRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792498027;
	bh=6pRRQhI4LRmMvQUxJuBdWz3a8MRN5nvvekSSe4SWu6k=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IXUpqUEmuY7eCBHOs4FxkPFUMrY5hiwwAybWsrSPRYGT6GYXwHM4Pxy/MlFEhRtuO
	 frVILccHyec3EsxoWCWKUUgRRm6kzo+z5dd1u8vlM84/MC3ZacKn5oMLPcF/4jet2t
	 P8NFfNqQBFn3qOSkrveu6uRfZjUR2gxPGX/V3Hg0CRtIU0xAaAjncRNKrLECxbC01U
	 DQGPPhZJ+HGrrJdNCFre15GmXZrvs4b7lsHcqjvoi4Aq273l0VbdNQPLNIbZK7c/Td
	 AGcIhOSzVhYOkkziA8K5oma1wHph5vlJvgiA79Br4nu5s2372C/v5nv4D6gKrVLjvc
	 RCYGJuP2IqJzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B70778100D;
	Tue, 20 Oct 2026 12:07:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D5B575
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ED4C607DB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ndf5fO-5aNW for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 12:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B9EA1607BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792498025;
 b=pJROWIG4Nnr9/gX8iJw0Lbrh3a5xQYs6hmYCZoyQgL0NRHgxaafr/QJjYZpaAv255VnR
 0ZBKHnyE1vFs4s9zabgwfnXl1Fav7/J6qWk8UEGgwXJ7VXqbGYuH4HsitrCOEqyquokIc
 MpQY0ILYiEDOz3SkILxchmVQ3ZXWH4u3Asx8FxgEOyzLXQoP+ijReUO+AAbgbBS3feCJM
 WSqo0QaYI17ASIEqDxshFYCzo5QCvRQdIuXkAKqkp9714HSkxfCqk+ly2Ouvsh7RFhlgq
 ayStdx9P6QX3l9vUoSX9KhzBKHGzj0ZT9eNC9moaGs1s4T7FgseapakUjJWqbXiOg5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792498025;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=SwcukmSwoslw5cljpEXCqxWPNxb9TvIOCXkmR63j0XQ=;
 b=TRXjhv0AMXilmMdw/Cx4lgvVoa+S+7YU46jC8TSBH4b69ASDqpEA3X6IQQT1ecVopzQw
 vfpShBvooHalNNw7syGbs/7+vn/K0ehdStxHihLgqPR82gsaggIMyAY/jXUeviAYMF+Ot
 JZ236Xzc8qZ2S7sPlNbux1hjM/Au18PkzLcDbqr0U+UB+GhmnBBDvq9ruxLv5env2LL8X
 5+Sg7h40iX4YnTE5pomWLkaXz+cr9b14t0HsVkN1mIyZ0frHEPs6MR9ARFMqKp6rAck/H
 YcW8Qf4XxyKDZwn9R43Xeib6RqhtWkth9wIAubNKKhHxWU6KcM+SVYNqpN5DdNnay3w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jsVIPShH; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9EA1607BE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:07:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B70B5C5CD5F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:07:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3490160393;
 Tue, 20 Oct 2026 12:07:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87A72103289A8; 
 Tue, 20 Oct 2026 14:06:53 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 20 Oct 2026 14:06:44 +0200
Message-ID: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/pkg-hare: refactor build command
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In order to avoid duplicating the build command, use an intermediate
"target" shell variable to store the make target to be invoked for the
build. This is in preparation to extending the build command.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-hare.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
index 14e0cfce5a..15dc769311 100644
--- a/package/pkg-hare.mk
+++ b/package/pkg-hare.mk
@@ -49,10 +49,9 @@ ifndef $(2)_BUILD_CMDS
 # but in real world, the target "all" is not always the default one
 define $(2)_BUILD_CMDS
 	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
-		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" all; \
-	else \
-		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)"; \
-	fi
+		target=all ; \
+	fi ; \
+	$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
 endef
 endif
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
