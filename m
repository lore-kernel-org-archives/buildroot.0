Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7FA606A323
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Au+Q/laW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IUPtWc4/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2F281495;
	Thu, 12 Nov 2026 19:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KCcv-HoiEET; Thu, 12 Nov 2026 19:13:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 14C22813AB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794510803;
	b=tL9m0SU2oxIqziMLWIzoWV9BQi6sWWYBw74iR2r73tc5DQrEtHehAiEA9D/f2Si1W17P
	 qDBJtwfokkgY2OtFw8g7Q8qeZXVw0tq8TjgDXQ4kBsFqMLfqmN89Y3XkCat4qb22knAZd
	 vH+l4pLNEFP/QyDdHFvZY5PISkr4bA/lptXax+FBd2pQqYe6XsHgBJiFpc95i63sqwYfH
	 GemCjZiotzT/MLC3EInV2iTua7nxw5JcX1Erw5PySnQ/82iggY5B7kWhmDiOWpNm2a8p8
	 QFzHpatA7NdF9R+ZyqhL4ch3GloJd2jpV6fyeuY0Y7CIVi4fmpFZ4NPxAT1moAM9Iww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794510803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xLeV2eUzhHXiJrtjIiXnZDwik1ODRvG+WRYSOLJQOlc=;
	b=lUfSxB8C+8REO+q3haqUR4I4tHNpPJpFTqOdnesFC94ZAhFGHgMUTO0/gbT5ce/FLMhI
	 DPC4mCMI0Nira3PkhZSP7AwcdkPz0km7gilOBi4qyeVgob1eeMgCbi7Y478BqVkB2TGDr
	 LStb4d1MRe1X9Td/c1Ro+TaAmnpKL+OaJJH67k5dob6iPxeq6eNUrAQXGGFOyADQVDIVb
	 utj/+r3R1lr1uPLcuCTWHLERvWl6SwidTYvNAcVSuFbUIHizYtw4hVAiCFEnpXyllNaem
	 hlACl2D5mayVqXvS1GAdc7kPdr6izCG/kpwDis1qYPfkHL2H3tKH6Aw7NEi6GEs8duQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794510803;
	bh=xLeV2eUzhHXiJrtjIiXnZDwik1ODRvG+WRYSOLJQOlc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Au+Q/laWyBqDqCpoWnYQRcEKVhVqvo1N2tpDysX/neUliqTqZ3k3EpPwh4FFMR3t5
	 6k16pbHAxvLtnOYUBqIxFMBjpiD450qP8PX3gxvJ+Sh2HoCjO4Jru+auFSa3OICcSu
	 Fx+lwDMx7MkxsEFcgKjdYkDLB1aOzD1914K+6+OqBc72EFexrTTVdA39tGsvBWR04d
	 DIJTxm9z76R5YhnQiuQzZ10azpoRiBqv/VCqau+Cz9qf1BF15UuszaxHHiRrV8xj4Z
	 13KXvvTGi1gXoIggc4VdzHJZ3JyMKcnuT3UOrMOR9CYr4IuMUXo0MDyCRgLcE2xYKq
	 Zo2upNukHBiow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C22813AB;
	Thu, 12 Nov 2026 19:13:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB2EA2FE
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC27340D79
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gn9SERX50f7Z for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 19:13:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 14C1F40D2E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IUPtWc4/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14C1F40D2E
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794510798;
 bh=iUy+3RUt/2Z4qGYPLLPdZwXvkh3DzRSA8WDO9ASR5MU=;
 h=From:To:Subject:Date:From;
 b=IUPtWc4/MfZQ15y5XRIlvexS8pCR/lENHf1GtcTk77PY/nd5MA6kBzxpW5DzFJsV8
 xZQhP/V5tRzqsqn7eCJ8ZSY7TSTH4jkJZHyyl/T6StcgLpQh3ehYihZhm+fniwginx
 g2vQL2oPmR2jIRAmLE/JxU2OnAitLmDuh/eqjks0swhRI5qrl4j+6M8D4qMv/BN9Rg
 oJwTNYc5Vf1kOWZvZmq5vbGV5L0ItOTH3g2uRK5V54drAdEQeA2tzDsy77uuIM79XK
 7JbtAHp/RxI/SYCSyy2tgpXhlLKgtET8E6YDI/mpuha/a4Tg/u3yXuvER2lSv2RoGT
 BPhkfdwj8c3NA==
X-KAS-Sym: v3:f51bdf72230551df:Clbr0x+vcQ+nh8vBqvFoeZstHusRJYrRDDnZznkXjRYlN
 ebf6e7/iHV/u9RUYEfS4E0HJ6KsO48+V/xEOn5+Cg7YfAAMuZXQQYhoLw9y4MTpkcyz2l8s900H
 teTo6LqQtb59w/+q6FSzp4L2qxSCANHJvRVokv3rVcpk1QnraAosmkIulJqTmlcrxPkrG+iaHfW
 TMy2RGQXSDOsYZZske4MwoIehla6vD2WGp+Ss+N70BpW/K5niNVj6AY8sac7aEyGuBTbAOp1L99
 rAeX55JwxJy1koM809WZ+qR2MB9hNg3x4WkKIZc+h9dFkHqDHChn0WJFJ9irW0BvXmZ2fX9g==:
 wARrYsDjJCkESor01jVUF1PzFTsOLZMJRgTdJZBDfgNJ+2Zs4UPvCA+l7YPjotdwSW4Z/vVNNcO
 8scRSnWVhSral1og6SKQiT39R9kr3QrDaRXsvz+vvcm1bubEej/fA8i1vYQC8s4HKTlfsy0r3UT
 iGq/Bap9MJHFI6tszFAnMfv8c1qKQdl86BgMT3zq2K7cSS3ekWukdPaSqpCAiDXmYZOKlPC08Zz
 qzO8gYdU8XbLhWONWTByhkBMERxZOxF3wXXraiJZhpNsCldLsaVNTATlg57Z/9VPYnfLxQgStU8
 KLR1c6ZJ2Xf51tGwQA302pGPcpS3FFKM6dLA22aR9GdAthSpMY2aOlEqCqVWXuBWMy4BBZlMB1i
 /iWU3y15uWr6HSs2f4Qh2MOkiiGIqL1HUs7dWvbY7xmFfduXaOr/w5vf8TNKYLcmsCFJ3yTIaM9
 lNqOHaZ4TrcW0qcj7Re978a0nym/iQxKctQjXpEd04uwJIqFMERnH1YWMm64hcWfDGOz+Ndlm/l
 5jCVRqBQIdH8H1CCEtNcJg1S3ygAXdSFHpMgRQPaGfKzuX+FswdQNEdqGoAmIMg+IKcR+CwiQmw
 BIX8
Received: from fli4l.lan.fli4l (p54a1b984.dip0.t-ipconnect.de [84.161.185.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1004FA4C3AFA
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:13:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34862)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xRaEX-000000000Nx-1rHV
 for buildroot@buildroot.org; Thu, 12 Nov 2026 19:13:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 20:13:16 +0100
Message-ID: <20261112191317.101718-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-hts: bump version to
 22.9.7-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
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

https://github.com/kodi-pvr/pvr.hts/releases/tag/22.9.7-Piers

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 153d1c8d1f..ee2a5d4758 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  36e04924b200700f8c4ab58f5333ff739e7ddbbf36fff642807f50babc7d9f48  kodi-pvr-hts-22.9.6-Piers.tar.gz
+sha256  a64a96489c9a11a451889d20307b559f6c9d5444f13482110bc9b725932cbf3f  kodi-pvr-hts-22.9.7-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 23e3ea0138..90d4a1fb14 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 22.9.6-Piers
+KODI_PVR_HTS_VERSION = 22.9.7-Piers
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
