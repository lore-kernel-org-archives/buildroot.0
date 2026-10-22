Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1378606A31F
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 23:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tev30JV/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83221403C5;
	Thu, 22 Oct 2026 23:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUGgOsr0qoRF; Thu, 22 Oct 2026 23:53:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8C10D40306
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792713224;
	b=RKMdr4XZg4hQIdZPHami5cq8+euvOtBMZfJ5ji/krH/xLMh1yOp94mT83SVY7WBwYSeK
	 S+GP9mVUHSJhjNe/DR5VG55uxTd7PhFqnsk7BrwV8HPqs4taA8vItP8Ji/47Moi7y21oA
	 8uxUIu0BHoJCLAM64gPBytZQyp9VgkqBZhXDos7dSmZNzHgmv6eTE8SQqPTLi4LhD5qkN
	 l87hzXsEqZ8DTV5rHNwVX8zylrmUKEJaxwL+MQ6NRZX2U5NN8aDbBm1e1waDYC+tcyvT7
	 M4Zdgo6tS2ttNZUaZQsjCxq3ZS8rOwKJmHjBznxmm/4egVXrEww5qCbwjTOznEeV0nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792713224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9AJNjbJrWQbLh13DXFvPJQm+yvbpLJAW+VUC3K0T5oc=;
	b=DTn9rJlpZtA0wIqc65qKSR06DlEqlgFiGFs/SemFuKtCIVTa6pMUJDmnZrRQuqntaqzg
	 IdFzr10jplErdoj2uJymgMDqQ38CljVp6dlDIihhIwaqzicmZZTsyFIq2gTrGOBooLwZP
	 pVrmUVJ6NZZT+oxTPlrtd9hsPMC2VHSceu4IEFmE9+qjBu5w6xTKSvlzAWQz+uH+QHHWJ
	 PSm/NaQ5IAbJOUFLasOQFZzfXU8LxdqNvfpphYO+J6g9dMEi/+JWmP2bBbzvwrXeH+Tp/
	 ujnSTgkfJ5elR3g3Rlf+kYWQ70ACt3p1SIqiP6QGsTqT/JOp+xeiX6IbW+P2/w+IzUA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792713224;
	bh=9AJNjbJrWQbLh13DXFvPJQm+yvbpLJAW+VUC3K0T5oc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Tev30JV/BfpY+8NkFjl34KH4hpGeCpanmb8U6rw8ywCqYdbyCzeEvM/TxAzHL0tQJ
	 fPz+DHrCU0dQXsj2GL6trJeZlNbQJXithI8eEHo6sLddedUrWfCpd6eIe9PKxer7Tm
	 K6FV98XqI8FHjQVdO3XIIlPclmJkU9w6QoRfwxQAkLxZEj7/PojeG7a6DabdFhWBmM
	 4mMF7sbUDB9emhdQVKeZ6b7zpbVJzt8FoZRuywJfV9lA3XNwLu0ftrYiniXhx8n0Xd
	 vVNesuzqcumowN7kLxVXzAt1qzb82YZbeUq/6Q74HyboVTeFXhX5iD4ZLvMN9WpffP
	 cC+8HzwdOgwrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C10D40306;
	Thu, 22 Oct 2026 23:53:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6A1A499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 23:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C845080972
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 23:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_74oNM_SloH for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 23:53:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 578B081205
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792713221;
 b=EKKSbZ3n/DGFnJCpc0AsgqjYzluqKb6iZiD1sfgX+GJGw7ZTf1LCQaUczNTXwnup2f2M
 VGcwW0NPmsb3YEuYFqfNozZ0H0Ad9/E1f+k4rtBUnVTunGyRyFhuYcTqLpauSzK+f8DWA
 FF5t9s334UEGOB0tplS12123kXZX9ugO4jj2gXdRHqUKgyv+Si5YBAPNZUohvX0S2aCXN
 fXxs2rGT68APu0LiU/5vVCmQaUcZqRq0DqUyT4lhAVuHef5wG8ooMljzkKpubyBb/okHh
 K5mpwx/5OezT6tOFF7DEKbKwctZ/ZkepNH82DD9Lb56NzKDAvELqLp9td9cMotZM1JA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792713221;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=qpuY5SekDy1aXmlqv1plPs0wrwo46ec729j8QSsKW5g=;
 b=Q7vhkIHw9RPGtm9w+DHqsu/+zdvYJh4o7uvSMrTqb1o+cYp6QDM8A1drNrN0bwrQrbY5
 G5VZiVFetMKWUFibUjdqKtnvbZ0EmCgb+V3YvbjP9mzcLLzidIKky0r/03EOPLJG8Xrmh
 6DcxxA16HOzS7X4Ls+laCFiTr+GT4kUv+c/J9aRDHNF5TT4wJKjZ9SapSHttMAWlxoTys
 bfzW/+bZIXS2sZFBGYT76jaTDOn0/V3E+nzdW93gKKowDK5RBzYze7F7GS9fkxpCo3Skz
 PC1521Ny1Sc8xEew/DKBynWxEYT7Fymyuqp2XVkovtcOsLSb7vs7whLoyHSqmKpoMdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=aNL0TuvT; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 578B081205
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 23:53:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KTy-1wbOMH2C7G-012qdO; Fri, 23
 Oct 2026 01:53:35 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 23 Oct 2026 01:53:28 +0200
Message-ID: <20261022235328.3259902-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/KauE0r/pC/Gtpo/uE/3jZXEY7Z3fPAl2eNDmILOQy5qhw7Kayb
 wTjiXuspvqRWCQ4xzL6Of6DVNGapzfzHDTsD+85qAQhRkuqH8OUDEjm/mI63S/0a4s7k4Bf
 jTxV+accD0IjdX3/rUyxehXOOz1zcLw5Hb9v2yPeme2MUW0WP3kMOJy2k//OQhQaGH6BYdJ
 BCUxO16MAeYB20Lt+pPuA==
UI-OutboundReport: notjunk:1;M01:P0:YGpwYhh1F+g=;t+dDMrmz63LGTQj9cObNlVvULbK
 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
 fSnSQtN6g==
Subject: [Buildroot] [PATCH 1/1] package/nghttp2: security bump version to
 1.70.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CVE-2026-58055 [1]: nghttp2's nghttpx proxy through 1.69.0 forwards an
HTTP/1.1 Upgrade request that also carries a Content-Length header and
body onto reusable keep-alive backend connections, re-adding the
Upgrade and Connection headers while passing Content-Length
verbatim. A backend that resolves the resulting ambiguous message in
the attacker's favor enables HTTP request/response smuggling and
cross-client response-queue poisoning.

Upstream changelogs (no specific mentions of security):
https://github.com/nghttp2/nghttp2/releases/tag/v1.70.0
https://github.com/nghttp2/nghttp2/releases/tag/v1.69.0

[1] https://nvd.nist.gov/vuln/detail/cve-2026-58055

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
@Bernd, maybe relevant for you: The changelog for 1.69.0 mentions
testing OpenSSL 4.0 in CI.

 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 6af7b3eecb..f77eb6a67a 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2  nghttp2-1.68.1.tar.xz
+sha256  e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c4285c8bc2  nghttp2-1.70.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 50b94582e1..7d02877561 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.68.1
+NGHTTP2_VERSION = 1.70.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
