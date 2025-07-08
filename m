Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B10C83F09
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 22:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD6560766;
	Tue,  8 Jul 2025 22:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85g0Xenmp5SK; Tue,  8 Jul 2025 22:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B43607C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B43607C4;
	Tue,  8 Jul 2025 22:56:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A437615F
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9527E40839
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqX_JdxmFQ6c for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 22:56:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.159;
 helo=fhigh-b8-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D30B407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D30B407FC
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D30B407FC
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:56:23 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 824157A0106;
 Tue,  8 Jul 2025 18:56:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 08 Jul 2025 18:56:22 -0400
X-ME-Sender: <xms:FqJtaDKLiVr4QRL_-Hb7kxp0Y_x06D9MSr5hc0OGq1vIOxEEhcm3WA>
 <xme:FqJtaAzjS6loYoZToxsNqF2xm8vKxSGSbGBjCdxsTuwxzIPecaPIgO062LZsA-me7
 W4RurapsBnZFKsmLbI>
X-ME-Received: <xmr:FqJtaLtrLqwvv0BFsAIgMfRE_N510mQ_X6LJAWuk--L38mCwUNszFKE9Hfr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefheelgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjug
 hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfhirgiguhhnucgj
 rghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtffrrg
 htthgvrhhnpedujeejvdffveffgfdvheevgfejteffteehvddvvefhudfgieffhfegueev
 teelueenucffohhmrghinhepghhithhhuhgsrdhiohdpkhgvrhhnvghlrdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhn
 rdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpe
 hsmhhtphhouhhtpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohep
 jhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegsuhhilh
 gurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-ME-Proxy: <xmx:FqJtaPvob7OvWIiFG409MhtO1DIZuEuSkik8S9GNrUe9ksfKtj34pQ>
 <xmx:FqJtaIM4JkwmMumUM4GODBLrLxnIc4rQO_tvQJq0LA2wz36IqcP8VA>
 <xmx:FqJtaF09MeAC_m7a46aoUyidaeTGzESq-Hbk3flQu1cPxS2XLE7Ygw>
 <xmx:FqJtaMMvZvSjWOGt-sRVvK0ChRcNhDoH48GACZPpCb_Ds1T8qs8zZQ>
 <xmx:FqJtaAN_UdAi9bL1JZlbCIsmEEm-sN8tat4i9WLdHW8654hZ4XF-fjot>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jul 2025 18:56:21 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 08 Jul 2025 23:56:19 +0100
MIME-Version: 1.0
Message-Id: <20250708-loongarch-fabi-v1-1-1c9b4df3dee9@flygoat.com>
X-B4-Tracking: v=1; b=H4sIABKibWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwML3Zz8/Lz0xKLkDN20xKRM3eRUE5MUSwvj1OREQyWgpoKi1LTMCrC
 B0bG1tQAdZzncYAAAAA==
X-Change-ID: 20250708-loongarch-fabi-ce44d983eca1
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=4agXRENy7ir57Nl/QjjzvlbBVyqGgeqHkDZMf6B6EWI=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhozcRaJH27gz9G9IXb6UUCmxZ+GZqA3XGfkv5if/5pqzS
 MS11X59RykLgxgHg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzkTg0jw/o0gU+vA2WPxwsv
 XG2bL/hgsfzx6ZqyufMuvi/g05A4fIGR4XbEXMtP+o56eVte9nOYfDv05tHakBNRelG1Zrv/P33
 XyQUA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm3; t=1752015382; x=1752101782; bh=EM
 1026+fMUsHUaNFirICsBtpvI+d2Pmtz078FFM+veU=; b=Da/6zQVA5ptPK3jAYA
 LQ7ZXlcP+C5NzNl7dO+K7hLsxzOjUg8rRoly15LfZSx29Ps4c+CGv9YvLcnlYHK1
 ndZfQSQEHYMJnFXzdxlGEIUq1rKdRQTwz7XHAJJ2qUbRxq4vVRbKovUTm8L4rTez
 SPHJh+fgtcVK2UzKjo/PKAHovoADPQujirmkUK63mL51wXOE+gUm9dqWlQAuD3f+
 62fg/pXwYrKs0S5zYpM4OcEqGZzNg1lHSfe2blbFFbmfeVAdzvKVVb2O/K6Bw/5E
 Gp8FDy4oT3BcWkLcRJ5AuQVbSxAouNgR+nRlF00jXX9Ieax3R+9ORvuL+Awzby3p
 /9Nw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1752015382; x=1752101782; bh=EM1026+fMUsHUaNFirICsBtpvI+d
 2Pmtz078FFM+veU=; b=JtaiUh1kBwI9xiC8X829YjbkcmcdkAxOsDPLgXmnrPBM
 0/mS+c1G4Kf7b1Dz20mDJNPHU03nMOAKdETNuvAEyVNGoiG7Ot+2j9/hdlBFkUh5
 wosdLaOlk2RG6u1HIJQ0LwzYXLN6OBiW5SSJkl/H9LN9Q5/cXBVc6ai5HxqNNb1A
 XIU9hiq1ODqZCOFRwD9YwCazRZVK/d8Zr1ygFVz8UYzdsLJZNB6ALTzJlWYVIn/H
 qVSL3UktmGajNrkrFYkiYc6jP402JZVvT1oHt5Q/kSAq0lE5zT+hVpms93PQESbb
 Wbh3lNef4PvOFHdxWt+iRVFe54QRR0GwQf6UiVPV7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=Da/6zQVA; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=JtaiUh1k
Subject: [Buildroot] [PATCH] arch/loongarch: Fix toolchain triple ABI suffix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LoongArch GCC infers ABI from triple suffix, thus it's necesessary
to set up proper triple ABI suffixes for different ABI types.

Adjust ABI suffix as per Table 10. List of possible <fabi-suffix>
in "LoongArch Toolchain Conventions Version 1.00".

Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-toolchain-conventions-EN.html
Link: https://lore.kernel.org/all/20250706105859.292908-1-ju.o@free.fr/
Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 package/Makefile.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 829636900ba950f4e2af4e070b7f979646600bcc..5ebb5f9ba8abd55cf9519cf3eb2a9a774ef9e271 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -83,6 +83,14 @@ ABI := $(ABI)hf
 endif
 endif
 
+# LoongArch Float ABI suffixes
+ifeq ($(BR2_LOONGARCH_ABI_LP64F),y)
+ABI = f32
+endif
+ifeq ($(BR2_LOONGARCH_ABI_LP64S),y)
+ABI = sf
+endif
+
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 ABI = spe

---
base-commit: 09880508cb26260f30608137f697b6bdf11483fa
change-id: 20250708-loongarch-fabi-ce44d983eca1

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
