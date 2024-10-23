Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EDFCFA464
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5182E40296;
	Wed, 23 Oct 2024 20:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbVKnhpLaiWK; Wed, 23 Oct 2024 20:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D440402D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D440402D2;
	Wed, 23 Oct 2024 20:36:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 499AD27D7
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 361C48056A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Utfyopj1WcPF for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:36:15 +0000 (UTC)
X-Greylist: delayed 467 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 23 Oct 2024 20:36:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49BB480544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BB480544
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.153;
 helo=fhigh-a2-smtp.messagingengine.com; envelope-from=anisse@astier.eu;
 receiver=<UNKNOWN> 
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49BB480544
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:36:14 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 35B571140151;
 Wed, 23 Oct 2024 16:28:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 23 Oct 2024 16:28:26 -0400
X-ME-Sender: <xms:aVwZZ1L0vKcK2dImz0hyKo-e6wz6zskscmlSsw1eobiTDWNY5COERA>
 <xme:aVwZZxLPg84E3CHpeZxyIluulKs88HgHX-BXaQ6naXF5J69UrV5GTY4jcZ2C355el
 PkDk1dixJUqqjb-6t4>
X-ME-Received: <xmr:aVwZZ9uuIdKeHHnBdd1xfW_9PcTgxgqW_Gu_ntra8IlYbJZB4MRlWvbhxKpHcPZkw4e7Y92Gkl72aaAkxIQrzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeijedgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
 hfhrohhmpeetnhhishhsvgcutehsthhivghruceorghnihhsshgvsegrshhtihgvrhdrvg
 huqeenucggtffrrghtthgvrhhnpedtfffhleekhefhheeftedthfejgfffvddtleehffdt
 jefftdehkeetfeefieelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhhishhsvgesrghsthhivghrrdgvuhdpnhgspghrtghpthhtohep
 hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghuihhlughrohhothessghuih
 hlughrohhothdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnsegrphgvrhhtuhhr
 vgdruhhspdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpthhtohepth
 hhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohep
 rghnihhsshgvsegrshhtihgvrhdrvghu
X-ME-Proxy: <xmx:aVwZZ2ahNxxUvS-kwpBHlO9FxtJs7t0OmX0dhRq4NmbmIkI1vpvAPQ>
 <xmx:aVwZZ8Yg_XgdwHsHVSvp8tQu8mpTFI9MEhtxVJ1tAEMWJy6VjuhKpg>
 <xmx:aVwZZ6B0p1p3gEaVlys062R3yR6LzbeBHoSjhqCM5KPWFUG6MuCdIQ>
 <xmx:aVwZZ6b5McLFzvZvVLfoEsmUOkU1fzXwSPmGRvmhti9L8M0g97r5Ug>
 <xmx:alwZZ7w1sDETIaK-Q87RVjBTgrQF3rQYlg_o-d3de38HmF17Obk99zJ6>
Feedback-ID: iccec46d4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 16:28:24 -0400 (EDT)
From: Anisse Astier <anisse@astier.eu>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:28:14 +0200
Message-ID: <20241023202814.447269-1-anisse@astier.eu>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier.eu; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1729715306; x=1729801706; bh=L3r/QuHcgeTaWah4O7gSC
 SlbWvX2Y+080DF5dNk2Naw=; b=CdRsojGuBLrRmLj9Mp98oZ1Bnpy/PdyJtvKh0
 uNi/Ak+H0AiTa2nExcun0hzMEh8NVcrbA9vdKkmmEmnpIq2zDZc+hSf4FEujbCv0
 jcaG6FSb5f+MmytRy6e9VG0uy078GyyC7K7zFUKZAKBsWHvqT4KD+3ALSxARnV7D
 wnsJSsev0kwa07wr03aSfeyMqbZ+mrxSudg2vILKwL+3Jo7LzSDMrodFbjKWBKtn
 WzCHIj6qug0TfJ5gvjPDd0hNSvFR7tPLlX3krupSoS2yh0QwVnRnZUAVKCuAHf1x
 6ZUGiW1nz3CwpWH/Y0z+neUc6PK/TYyytd+Sd0R3zSzHIKLog==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1729715306; x=1729801706; bh=L3r/QuHcgeTaWah4O7gSCSlbWvX2
 Y+080DF5dNk2Naw=; b=Vs2rqKn2HR3MJPtaxeFxvosC0VR6oFlbo3jF+vl0xt1b
 ffiYcPW4yp5dVob2uAdbeCktlrgbJnVwa11H6L+HRTXbvPpbmPv6FIS8oDesQbCK
 IsokBlFiNR2CI+cZW6aKO4Eo6rb1uasrtwwa+YmvZXRzQexdEUL9WJh7exM6PONN
 CEBgYXpmE1rFii1JVF+EovGVAMpW3RC1+OrYngMT3i/Hy6rifIDFfZkcdNvqhZr3
 r5q20d+QdFr/bJ+HleFX0bTATIvfXbT4ncNivwzn2VhQHgMtRxZxpeUx46PBuvJo
 KYOT09vUL6/VIDZtdfBinXn6M4lvAFr8jykGglVSaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=astier.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=astier.eu header.i=@astier.eu
 header.a=rsa-sha256 header.s=fm2 header.b=CdRsojGu; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Vs2rqKn2
Subject: [Buildroot] [PATCH] DEVELOPERS: drop Anisse Astier
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I am no longer actively involved in Buildroot.

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 136b82ce14..aa10989c2a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -240,11 +240,6 @@ F:	package/sysdig/
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
 
-N:	Anisse Astier <anisse@astier.eu>
-F:	package/go/
-F:	package/nghttp2/
-F:	package/pkg-golang.mk
-
 N:	Anthony Viallard <viallard@syscom-instruments.com>
 F:	package/gnuplot/
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
