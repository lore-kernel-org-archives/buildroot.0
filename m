Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7C606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GqItYw6L;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lZ3kiG4N
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE74C407B3;
	Tue, 27 Oct 2026 16:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INXOiiWOaMld; Tue, 27 Oct 2026 16:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E3E040733
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119230;
	b=k1hqgcV5UZ3cTP3U66LzlCKGV2NC9bI3KB0vDpEOEzgDF7wed9pHwc25P0UZCD+xkpe8
	 vB4F9iyLtDpOW352QgnVETUMu1UjJM5NLTFJrKZAWdGmgU+/g/+JY9Oub1uMiVC8YaaMd
	 UUUORl+ADjcK6fxp3aLmw5HGsnCUbTo18MbnJQNR2Es2lWJ9eXLkMFzRFIlIA8XMbTg3h
	 /63zWtMXGdHMOo+H6dLm/OeWxBO2vwRAGgOXHq4ZH/nC6OvALc5PITEqpWpdHT7NZ/GmZ
	 8I6iZ4yhG/eQZZ8+TIHP4GfFfgWr8IK72ijXq8ZyqKfgBGo6SsD/2vTKNWi8bcXoucw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ftsn/jslfWDRFgw82QKqvqQeAJnzNY3SEtmy3pU6prM=;
	b=C6dl3+A0PG+2kOELGrPFlk4TsV+Bl3IqNq5gsPOF85A1uHGvlkKvaZHbzqPqE63pEfgQ
	 1FYVB15IkzXwRBHezdaXWEjpQfgPZNV15orXsrWS2aNEnZ3nIHu/QloKoRgpoVak0fG6L
	 6xLRwgX7mP/D0CdYL4oMa9dLDD+cgPGhAkqgCuLxs4Ufhy1oGc1ByBTTcGbW+t5OeWjcf
	 1UM32eWBV9pwiir6Grbly3OOMTIUvOq576656pEScz52Ldx3nAVuytwTCnhQkBXdPAarw
	 tokCac+lv2nKaHWrRAjTsbepVVsyo/qUJ5P3iEMvC+yGzAOael+BzJScIKcMjS4SHZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119230;
	bh=ftsn/jslfWDRFgw82QKqvqQeAJnzNY3SEtmy3pU6prM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GqItYw6LcBHlifMlJUZrCD29IguaMVN2sDRk1pSTsNOh01msCcxLpMmrMz02u5xka
	 xyAI900FwHZkTIyDovvJluaxd334tDQ+7JxSb1JAWQcrsCQCiK0JQsFSgNL+kFSaOW
	 Tmxq3vwtX9gBVKmKSo51efoYNfimHyvL0GzsWfa9m7q2scFdo1/Wp++IdR422WXe0A
	 xEkY5IN+f3H0BUBZDc+fedij0N05BiyOdQ5wnxA/YVDY7Ewr0mn0q5OVdfhWeP93Mh
	 CC4+6R7Xwp+MNq4vTkxR1IM08wQUIBpfagAbvENw/V9TgoaLyhijvnsobvkiateaRC
	 XxFKBB+hYct3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3E040733;
	Tue, 27 Oct 2026 16:40:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8239972
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65388400E9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDIEsmY_zg1s for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 531FC40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119222;
 b=oWzxOLKRqZ6PAPG0lU4rVjJAy+eD3RS/4m677sFhXBGi4D8CcWzc2V+WxQhtHnHSIny6
 pBqESrcD5vEClSM7X4luOXPPWFZxzDGR5/thm3nXSgODM0Cxh/N93wUYrihg2v6vO+Des
 IUQKbxd1RN/hUzpDvm5yB0AY2K0zF7s1U6yLavOF7PI0GhU+A2qu7IfUUDmF5Tee6Beth
 QOhZ6+hVkXCRXrI4AKIUTrP+PECxV5+f5/Soof+Xz2XVe7K44D214BTYPxykOSj7TaWLE
 xM8cdrYwluqO3Amk5J+Zy0upzRnjyGYWTH56Fa9MbvuesUp+skUmwI0LyBxYGveMU6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119222;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=YVl8lLPhG4U7twUxbOSwc8x7BhfvLEwG7KTe8wHZHfY=;
 b=nK+7+lIfcDaMAVsrDCPLozKFpdv1hrIg9KJaReqDuSA1qmqG5nzrMQA82t2EE1heeaz5
 qLUNZvp6mBP9RW1w0DQmCd5reKYzLsR5i+QZtW02Mi9e12EPvYwJ5PGQ7052tUuznuCH4
 kcJTw52078rg3jcSww5fDOef7O78Z7xFZxrWSu8oc79nZsfgGbSxhZhM4vuE2Vd9rFPmu
 y/Dlm6ph49EH/HcCt593uIKGqdnQVGJUTS4NwIIUEfVohhs1ronLa7jgzRl7zojq/c5Eo
 uDF54ZBHb66ogRB0Vq55g/cyeXCKKtjAo0Ri1jUwftWGMq/+aekl9ZHSMUdLaXMmHRw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lZ3kiG4N; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lZ3kiG4N
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 531FC40024
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:21 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6acbdf8e70dso14453a12.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119220; x=1793724020;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YVl8lLPhG4U7twUxbOSwc8x7BhfvLEwG7KTe8wHZHfY=;
 b=lZ3kiG4NU7LlnKAQtGQWYAwAR8ll2tCmepuh9hrZ8GoVdR1C/xS7kcfjK1hnViDMy9
 ZQ6LoYHQcD75t8deuIVs6A0i+2mM5XZqKZgDy/yGvGi4nvZEgW7Ge6A47/guiGBRwTCq
 c5LtO0skBwM3rEsNKs7ZrqSwhuSZaBAPa8Uxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119220; x=1793724020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YVl8lLPhG4U7twUxbOSwc8x7BhfvLEwG7KTe8wHZHfY=;
 b=TdpQshTr+Sy73TcA6InezsvKSEej2Qq5RYDOf0gRQYAvRRe8jGE7Kr8F+tJemwi2k4
 Zdc8m9kuxnXV1FJTXsd9b8NRVBW/VO1n2jdmQmfPGu7TxkZeZHGYJVhtO4rhLvs4y9KY
 MC9GO+pt+0HldxnlAtLlU+UbNmR/LalnnHUdACXUZbLYMNaCQwnBIfSNm/Gm2kr1+pkA
 e063HdHaz/w2ULeqaSHHxOlgvpmWRWIGKUCTWi4LQtcJc0NoNQ+KXG1xwGOEUb+Qgdiu
 5ND6y8GRgxgCmGM9GfNvAIj//VfwrKzl1FndZOjpIs8W1PZ7BCTpa4P/mFhKpUupLMWB
 q2ew==
X-Gm-Message-State: AFq9FYL6/C6kFsAYYon4wjFgfiX5RY2LpOdpAr+A4+om2MYPo/PAMbTc
 8d9WkbGScDJcR4rnQlBbgLzSVyT9SGMPqcHqAX3UTIi2OUWbtT1w4k4I7nWNUcnv6b5I6/5MEVl
 Q4FuyhYo=
X-Gm-Gg: AYBFou1+GgjzTOpUncUx28svry+pAc5e/OssrRNEY9Z4uxGD6xTSVJgdjhrY4u1lAWz
 KW59AHwBlqAEmVs0yD9Rw0XT1PSRqPCs4qNxpf68jOSf9WZ7SMh16PqD3vcPUxtp8AIMuaNvBds
 VRhD3+U645iVxoyqjF765yRRgVlq7H83+4AHypg9E/2tYk7j4bVIVmLWMGGpmD16L7Mh0EVlurk
 WgJLmxWibx4l9wxWfAOqElSBjY+Q/Mb3AOvhyKaj9Jd8GTwqeMvekR33xcNDFlSCBW2WGj6vW8k
 tIAlx2/7wnxCMjdgvsukZCVuZgVEysjyjUTM7s1zaIxKg4e3jL1foWr23hBDrhTCZyrahmDIIXN
 0+8+fDfzKAaylOOgq2+WkFd34AbaZtJf3/NJk3W9R6ao3GpP9IFN7gI5Kf9M2/WGz6ydFLvvRzT
 zEodnuB7CYKve2qp2MU/n+NOEVHKGg9FY9lXQd9o14KQnlbrBE9cnH0+EhCIoBfvMGcl8iQVACi
 VPPUdrGxMZA2tlZr5uCIubEFWSbvzF6Scvpakco0T8DZQFGq6NC46fndYGd6iz+BunRrsb0Mfii
 uS8Gkay0uR4IgSUHZEj6nbRQXwqzRs4sqdy9WmaTS+4bJW5f/4kLPrYUZVi5vxp3ZSXzxyVa61u
 W8mG5fWPpiO7kgmo2rXRvdWZFwXZm3K0X9s3xPSv2g+/bJfMF0aKMUkotzWZ8HNlzXeLAl94KdS
 7X4Y6OX7w=
X-Received: by 2002:a17:906:33c9:b0:c40:5ee3:8694 with SMTP id
 a640c23a62f3a-c46bded22a6mr1118489666b.4.1793119219846; 
 Tue, 27 Oct 2026 09:40:19 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:19 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:03 +0100
Message-ID: <20261027164013.1602502-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 06/14] package/mender-update-modules: add
 banner module
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-update-modules/Config.in              | 12 ++++++++++++
 .../mender-update-modules/mender-update-modules.mk   |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 7c5a7e4442..97f583e0e2 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -16,6 +16,18 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES
 
 if BR2_PACKAGE_MENDER_UPDATE_MODULES
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER
+	bool "banner"
+	help
+	  The Banner Update Module manages the system's message of
+	  the day (MOTD) displayed when users log in via SSH or
+	  console. It uses metadata-driven updates to change the
+	  banner text without requiring any file payload, supports
+	  rollback functionality, and operates without requiring
+	  system reboots.
+
+	  https://github.com/aduskett/mender-update-modules/tree/master/banner
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU
 	bool "DFU"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index d18b5111ae..1db47cbd15 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -12,6 +12,10 @@ MENDER_UPDATE_MODULES_DEPENDENCIES = host-mender-artifact mender
 
 MENDER_UPDATE_MODULES_MODULES = script
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER),y)
+MENDER_UPDATE_MODULES_MODULES += banner
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
 MENDER_UPDATE_MODULES_MODULES += dfu
 endif
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
