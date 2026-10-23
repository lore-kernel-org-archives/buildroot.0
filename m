Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9FE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BoCjnE8u;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hWVQraZe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3468A6069D;
	Fri, 23 Oct 2026 15:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESVzfYvz0AOl; Fri, 23 Oct 2026 15:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4887B606AE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792770987;
	b=HjUdh6H1OXuiUAtg5iVlKK13ffZX1iQz2xNCjeRjryxKk4hAG8viQGl+F1Kti4H3ncbR
	 7OtfQ47BhT3/5OfV43NFaBXlUh00rIWJoFvBcl05E66H1pcmBsHTtEmoeZWscSUtj8Hx2
	 UbhOjEntrYGjRYGmKsF2CQgmE75nL0k9kY/13rKTPOzQjYa8iz+FnEG6qAttjH1miYMMI
	 6Uq5ody33U4XsqsYF+2WZcx1z4hYdeMgA5ScmZBT+iC+XXDPv9cbAF0zwvkJUB2xBYCHK
	 jp2WfajWr67GE5hLIMDgC8Kqt2m/ElF34NatwlUbpBzT5yVmY7M2tNDRD06R/zsQYEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792770987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LAGkxIYP8SA8ulYKvoAa1Ab3cB3tRPQqGQnHtAFfczo=;
	b=E/GWOvz4RXjN1WIaG9qVBTaCMc34EDU5dIiwZC400RgjoejA58VZFpcy7AHFxrhD8pUh
	 F8PTfo6XL938Rblo7pTgmuOlKxHAzo66FEzfP5BBZ+v8d7yHbFH7NaOEIT35RMjJWGyjP
	 uSou/yPQ2DVL36SkGCodJpxg7oZdXgZ0V/Zamp70IjaPMk5jbbUyBkGGPTvj7DWGKBa52
	 yBmQjMNvUjPnvkQxSW05TUHot1CiLW4lyRD2YyujByjrjSr8NlvdZGRhUdM/9VgqJcBEq
	 BXxRNnVVUhAP3gUJCuiCSXp3I4kDywp4Vyum1frkOOkzYEJL4yw8EAg7QFMW36L3Buw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792770987;
	bh=LAGkxIYP8SA8ulYKvoAa1Ab3cB3tRPQqGQnHtAFfczo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BoCjnE8udgZ0demRVOKabRqWV8lnCxbaYuItSHZmV0JbvZlSg5qoXIyxTI9yhqIEX
	 ZrdApgqHWh9alWJ0rlfF7yqgcp3LKA3xRR18r8uDt8ReTiKTL5Cw7TTX0UpF+FcIQl
	 LSzyddyFXCmujZ+w2A+0ax5Oq0dkgibsUvhh70pgDGsbIlnLRZmZ0R23C+esXaw+gh
	 sFMlqpUuTpORsNpFinaaZg5OzNhw/kcR7YhWilbU9Sc0tg24zcknAUahSCpoJTRi0c
	 IQ14cA1bJk7NApg6g69NpLgr1CTgqzvQpwVlwtY+9WxIOc3pkwp0AKJWdcBsEWou9z
	 rsvJGxaNdCpMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4887B606AE;
	Fri, 23 Oct 2026 15:56:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB73235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3561813DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKnKtkJe20GL for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 15:56:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 48606813C6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792770985;
 b=TKe3z3i1yxojL/j4glQG22doZCiiwsS4kcwwMUQYUcNafPYdPtL9yStWtIBEkVMoqAzM
 maYBQHW/3TQiICZ9Wku6Vn8ghjAw4dZLPqbcsh3jsuTzikcWKRWY4JBgQCYtYxKv0/4Hq
 JRzBT4KnCtTgrIC6H8mkugmPZbBLgspa2FEy5+iaDB2Bmu2UmKDEPbexS60E6b6mu8gTM
 tcd6J4gr23oK00/vfnz9I/JLjkw4lc5VvQxBk0cWv1zoneWaQOJUGnFY7GMCH5sfNolCQ
 uwKLk5PyoWc26DeLwGt/oPJH+WKMW7xH3uy3dWnCmq1F91zbR1oqmDMK9QOoBxvOlqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792770985;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bTLB4MDeOErweLvMVLRPyxyQI3M+cKjtwOlG3QZRmJw=;
 b=ERNN7Ybvu4BO+JzJ9ZManAqSWesUH6TPMJimsQqYwJ718CqxqEd7HX6DYlbFRpUedk6S
 yxTQ5X4VGHwXNxl94r/VYRhyyingh7ID56+HakRRKCt9cWZQ8Lx5c5Wl3OVFjLg4026v8
 YPMwbHwfIxUy2BBwCmO3WE3pGAmZrc1o6PyiZsp7h9XuSvZf3mW6d+F0k/etnFblDNCx0
 WPle21klR2BICl8EF8BJ2DMzPB3qbjYpRHWC8V6D/CXkCG5GfJAZp25oCGJqIIkeizx1y
 YFT1Qf6xuW4EjbJ6sPC8rlDOzRA+Rj/uy+Y4akE8aFtIFdBvwLUyymGfutGv+eKMudw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hWVQraZe; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hWVQraZe
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48606813C6
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:56:24 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6df7f544919so617155eaf.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792770983; x=1793375783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bTLB4MDeOErweLvMVLRPyxyQI3M+cKjtwOlG3QZRmJw=;
 b=hWVQraZewTqRJst1WsiVuCBY+1DmYnm9hHnVHbbgNMTiAu/Dt8uYF8eT7XgO5bZ9ZF
 cTMXpdNT4V1MHxUAWNsRhUIZSDLVO52HVhCtItUDP4peh9eYkHvPulEB+KZKhV3eD/lH
 Iwt64UsxsNSUC1p8wj9kK7EMLczn6HOSsMk/U45d+pKw2NYeatDFw0zomtRfg7Z/Qfmu
 aP+8LW4NciEzlWE4doJ8pncbFsrKLDDMsnMdlrJ6Gk6nixwcVanPxxpUTTaaZJJJzSah
 HHa8aHGb6fS69SoQyLuz9raKexS2JRkeLXzn15oYKDkwJ9sCFxYWUrJ/lEe7xFBhLqnL
 k/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792770983; x=1793375783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bTLB4MDeOErweLvMVLRPyxyQI3M+cKjtwOlG3QZRmJw=;
 b=OioCeFFvEfPsKqPF18/HLrNa77ppns4zA/BHwQJdtHcvYGm8WNSebRregpzWTzX7AU
 7We2TpR7c7zCVQAEep7NpYD8ANRl+Dd7S2UlHpu+Wch+N58mgULUB02QptHgMQyYIngq
 uWLhzbHa949EAYoeFwYKViBKb8SmKtUzQkC7IhKwcVl1kOxOHftxHoSQByVRQ19rm5yI
 N4Y0tGEbr/DBzdVgTKmjngB3UEcz071hcIIvFiHhEa3VujEjpPCRFHJTgSSzWUz93PWc
 PN5xFqI4C2wroKlNnQGnZSydZnMNlGxn6Xqv+EEVPVfMlnBxSdPP52XxH5uELTjEE+eZ
 /lCw==
X-Gm-Message-State: AFq9FYL5a3WzxZsPnJVqFXfH4S2eYqmyZSmh0Aas0DsmH4prfHWOfaZ4
 Sa1NdY6hdbiZSOwZhJtjRvtYsdjZC4N+uwyzAOaEOLHF7OmYt62FhmNqKxTjSaFw
X-Gm-Gg: AYBFou2yeBv2jmRsLu6wU7HC16hZW/rwYLDIY1a/8Scyq12Jab6QwjV6KjEUQZJj0BX
 dVXV/L58tThIj6Y80J7evH7VwUn87zaK/SZbVOro0U7ObFpJ2kCyMYA8u2BJKbseBT9dGk9l3bB
 IwsDkqECaulpFbK+4awzLaEKV5Eb6t4ObPFXVFtgtZYobucy6nUxjxGraKkLvkVgeN/r1GFybTk
 ekz4MzJQh8m+vBLXnR8Iq2qk3nX4BKcCCWzkuSHg4NOjx9AkLGBNulG0o3/52VW+ozJ0/SYUJ08
 gmfMct8Z5HbFMNeCz7Wf7mMp1Jsp+Yk42nfSyr7YYbgUB5Ro70IywubYs2Eo92kHQW2/dYxkxEn
 n8VaXx57p+Hv2d91mAN1KNRMSZWeJbnXUtKmLXd1fYPfJDyzkPwcjhAq3J/Y9JgI7tKM4OyURJf
 5Awv8PSLvdXiVFOcmZueeFSCshdDfhE/toFNltwJVzRMLEMy9Ue6mXWGrmp71Uw07sCD+sX1csn
 VZbbI69ars/Cfc4fp6ZgZ8WVdvcgQnH5w/9HwOUkBnKxaO4VsFgkQ+Zl64ir1FaJjdjEBpq+i4o
 n5C1U5IiYeUWaoGzWHfI4Et+g1allvz5qbc2BhXUJIDgACVokczvZILZPJodwFHgjaAeW9lfGA0
 SQ98nPOCyeymx+KJuudpudJtZTfLdF5+0ZN3jEDHgqZLH2mX5k8oXOy6eXyS/rtMjpko7FYrREf
 NhdK3Z1Atv5ilw1AjOVwgOhpV3
X-Received: by 2002:a05:6820:7092:20b0:700:52ae:7e46 with SMTP id
 006d021491bc7-70b889e1c8cmr1280529eaf.49.1792770983575; 
 Fri, 23 Oct 2026 08:56:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850ccd52fa5sm257523a34.17.2026.10.23.08.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 08:56:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 09:56:12 -0600
Message-ID: <20261023155612.373228-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tailscale: bump to version 1.104.2
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index 761fc9b1c4..c75034a872 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  40e552cdf23c09c413fbb2f8f9744502a1a923bbb7a899708912dd201c689240  tailscale-1.104.1-go2.tar.gz
+sha256  6d57857ff91c06ab9b7af465e023c27e27a1caef55e731e7a9f79f144b4bd3cf  tailscale-1.104.2-go2.tar.gz
 sha256  a7ca6186a7963a0a60740f6047760eecd7a0234e8c38bd7e1e0bbcb324bda45b  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 0031292226..b07b3f9631 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.104.1
+TAILSCALE_VERSION = 1.104.2
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
