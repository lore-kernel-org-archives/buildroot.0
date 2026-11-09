Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47A606A5C9
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 18:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=htAa0doT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ1TtCas
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D115F80F36;
	Mon,  9 Nov 2026 18:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEoBZ5diLY34; Mon,  9 Nov 2026 18:33:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0199880F26
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794249223;
	b=I3QAfAmaB/X8m/G6mzkU3YjVijA/E0uR9Pc8BreO7Rt95P1g1bMJI/RuGKFiVSdiAMyO
	 8TF2vRu07kMZ/KCsnpDSxzBXSmzn2+YslgsOyROyWFkK1sFiswO8LXSyOvV6LSNeAbsLE
	 w2SbiWqjHIRTsOLGNXsV0tuXIafsOPov7CaxSUXpKyPpAGkvvDw/55sRfPDbNLD/C+E6i
	 WuAGYiVedZaSpBDjBSRr9xv4/UJBnSpkErYVf4inhAlHEXV2VxfHNqyoyMInCamRr2zWK
	 R6Ffgr6/ATGaCXeLEgVVK0KOdoK4wUjd1NukrJp1hPK7DHaQhq2DGCS/UFun5BiFQbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794249223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HgS1ysuxwzKiL0RkatJq1qcH3KLd9/EEfzAq2aK8lHQ=;
	b=Av703mrorR5jsx2C+b3RI/RogMm9A7wof25nLmkxycHNCAVyHxLo4fVCq1snWvq9TjNt
	 6xc4FENBm58ojOL3W5xMcY1LVKRj3mVatJ0Yg2oyvkfbjsfZ4T7JuTMJtMlJtjw5tqlrU
	 o6Di5evx6N5Cqf+nhw2lJydmT2YiPMyjtrfKXOsxye7RpaxoliW8Vj6wPdvXAtZnKlcxR
	 L2LZQKhrRtqDuUHTwwbaYURlATNPzzWZfau8w2XoboNm+LFWOqcIcb/FY/RN0hSE7zdF5
	 wkDdVJCAJFmvmHLiIEmL2aw+5R8ekyhVAjbuUokRcBlC8a55vziKpE6liQbLHWCVCrw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ1TtCas;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794249223;
	bh=HgS1ysuxwzKiL0RkatJq1qcH3KLd9/EEfzAq2aK8lHQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=htAa0doTAKS195AYcDvdkLQXIiB42ZfaRpadp0xFpVQAsu2ZWdwxnUrq1f9xpE0OJ
	 w+sDQ3LMosTr1Q11HFdMMBvVK/4Z62hXz6mLth9UKXkkKLBXXQR/6UhtDHbPGAEOgS
	 qN6TtFw03s6dkiEL8gJok55lGbDWcIyhqVloRpJX9w+i2orM3RldjEB4NshRTIp+tc
	 CGarU1c8NzY+K76XJDVDsmMgZ1hoJn3v8LrFklivedt9gUyDvtNuZWpAjIHU5C3RiI
	 HeX9+jgN4b54RzBj1kO6be/lzfha0hO8XZpJaVn0sHyrme08tnKSTQOaUvCfNSN1CT
	 K1GzqfC2ZO/1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0199880F26;
	Mon,  9 Nov 2026 18:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C4CFBF
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 18:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01CA080F26
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 18:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pstThAj7_Yf0 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 18:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0FFEF80F19
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=KZ1TtCas
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FFEF80F19
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 18:33:39 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-4f55a53898cso541453b6e.3
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 10:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794249218; x=1794854018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yRfKG8FkqiFumd49cj9RbcR0B4jVpzYlPCw4fXHU5Q0=;
 b=KZ1TtCasnclPQFFsow6+9ETrsoxw66EgCBui3Ud+UYDyw1RL/Pg18sELJZH/IEmp0Q
 VDr/Puee1NzzuWgGmiq57t2VsnopnfeIxmIVVRuAtNDYuifyHnbowVFb7W2+j72NtfKm
 1/II8BxQ3Hc3T6kgC3GVH215n3hTJaOV4X/jvnvrJdPKqjnlN45hLrflEEN+UsPtSaXc
 BTTkqateCUEE29GKOUd9FS8CBHsiLUV+SwzqNIAU9UoiJBZGZRR2eRkiBrjUPNOO+Nxz
 3tvks2EZk/vx3plEYJUpMCcQMlCt1HU5Vu3ugI0oAojWC8U0QyqTz2YOe869T6TeCjEN
 yDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794249218; x=1794854018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yRfKG8FkqiFumd49cj9RbcR0B4jVpzYlPCw4fXHU5Q0=;
 b=Skoptt/M33AiQkU6eiYtuXJwMlyiPxAo3fsvjB6c7f+g1EU6IDzDIaSBAGrrvUihFd
 XlIv/2BJzUreJ0Uqc0hAWy29wnxNFu0S/WJX2AaQ++s57ahEHWnULrWL2IVJeYeoc1P1
 Gv1JrFXv6EL2hGBZ7ZfXP7j3K8r/OJJr3XWyb2WJR6Qi1mT2uaTS3/NyiGDt9o7b4nWj
 1UIMGY7XYG46x0A5LKuPHS4Tk4Re7Ryi5FeZS+E1f46CM71bAz480KcuOivqLAuue5c1
 dHyuhFQ0Zu6cCFnuR+th/TvSSFalgNFocnno7GU9bykFj/5Lw9tw4JHDxS/Htmo4bOEn
 5qYw==
X-Gm-Message-State: APuU4Z8DT+RbEXAt6V06V9qKSPWZ/+Ebtd64MDPoiZQFV6dwSk+gwK4+
 eKXUt3MN0suz3n+5uhEF3/5o38nh0YKBl9L7VcTD2pZvM71p9lwXp3/+vgTiaSR9
X-Gm-Gg: AYBFou3nYL3RQ9m3IeEKYodNpaITN/YmMZXFXW5lXBQHudcvp4sjhhfuuK0tcnyU6xo
 LZWQJW0c8pxPa+wxHtszbDtP9PCKu66EvjxEap3tTqJvcMOcTh0/N4DHt96rKq7OX/uvvqb3Jfq
 ZBcbLIfzkWE/LxuHFr+CDt2VUHS1Dtit+LJy0Y/UZhfqMYVUDBpkpeTiSQS20h0xzkTEhU+wDtO
 n0VdmJTEx9kuEJZMPPvwBAL2Wq8GD7xPYKKFIjPKdMgCCeZB4IlY27UaznVLQUtXRF03WrMN+ZV
 KQePh3XMDp17PqeJ4HH09uaI4fFh+fKNRBnh3AHQFa9v2RrrJK2vlB7I5cv1TbuPFlvjlqsf0Og
 k54V0UF3DLn586QhHAhAE14PGh+BdIjcXj3Di2OLYxzK2uBU6eVZBVL6Hr9zNepYxu3W1c95f/+
 NuYv+UBtpCqMfyZStdYX+NrO6elNr3wgktujFManm+KG5BjPBn8bOPJbTxfb/5f/RnQDICN6V6x
 GkMdfH9LZDMK7c6k5pt+f2tNC1oNCzKAyHRnodEBkiJbPc1gK7B1/koQzc1kVnOkKhc6n4Iiqol
 aVcuq1J0FNtnl2A0PALak+D2N5mEJ5OTK5iSyV3J46tylq1izh2EKtWaqiFlgKMPpR95bo2Nq1l
 Qf7VWhxnG6aE9ErpoT55BgeC13FXkcqr9CDh41QO3j5FxKO68ZAwAUTjszXhw4z72PPfP8tuqIW
 yjwkhF7OvP1ZI6jf+KRvMLKCQlaHAZ9vIXSMwMY3dcq92azdxzwTmyBav1LUyeI69oDmJOfCjw
X-Received: by 2002:a05:6808:6711:b0:4cb:f21b:6f8e with SMTP id
 5614622812f47-5683cd8051fmr334012b6e.33.1794249218458; 
 Mon, 09 Nov 2026 10:33:38 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-56813db294dsm4980323b6e.10.2026.11.09.10.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 10:33:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon,  9 Nov 2026 11:33:17 -0700
Message-ID: <20261109183317.1852200-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zstd: disable optional compression
 libraries for host build
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

host-zstd auto-detects system zlib, liblzma and liblz4. Updating the
build host's LZ4 to 1.11.0 breaks compilation due to the removed
contentChecksum_t alias, even with an unchanged Buildroot tree.

Disable these unused codecs to avoid undeclared host dependencies.

https://github.com/meta/zstd/issues/4897
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/zstd/zstd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index c5a19c76f3..b0fbf3a1a5 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -114,7 +114,12 @@ define ZSTD_INSTALL_TARGET_CMDS
 	$(ZSTD_INSTALL_PZSTD)
 endef
 
-HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
+# Disable auto-detection of optional compression libraries.
+HOST_ZSTD_OPTS += \
+	PREFIX=$(HOST_DIR) \
+	HAVE_ZLIB=0 \
+	HAVE_LZMA=0 \
+	HAVE_LZ4=0
 HOST_ZSTD_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS)
 
 # We are a ccache dependency, so we can't use ccache
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
