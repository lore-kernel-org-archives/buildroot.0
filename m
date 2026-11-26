Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975F5606A326
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ga7J3GAV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lizL8PRQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A7C36066D;
	Thu, 26 Nov 2026 11:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUHbZoWUIyKt; Thu, 26 Nov 2026 11:00:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8A81E608E0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795690855;
	b=VQI2JIlMoexWd/CblZK9BNuZyLGV0R7QZlT3bji6FGt3ryTk5/554FP111GfVVVBvXSQ
	 riG19aenbYaPD0VM15RVvdFzN6bw+AXRlVA1n8+L4HGWEgauPstxPBxMXaTePna+5mPTE
	 dVD5XbkI54901VdPU+0pKKHF3nhSaybJxjVcTtpNwery0AdObcaQBeIqQmAvzkayy03sJ
	 6Gi/uHEZl0yvgS9Oj9/1RDGOa5AO54NmF2hagWU3AiYUYM1DIzlywE32v7c9YaoFoX9DR
	 tLarTC4xGcQxt09qLxequIahc0I7inMcTswqpKBv39wRI0lwU0C2V0Qft46YxrVeDXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795690855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Fn2Tn0KBva+1wFtcu2VWlE/RHFxuHBSMoRw5hsx3X1s=;
	b=YdD066ejiyZLp2DYt+fqkF0Hrl2VOiwRJtDh4si2ik45TuYkfYXrZHZ+2zUh3ym/NPqd
	 pxbLDcOnveqRkwmMExCC7zL2+pEC1uCWQlOz4ZHejMBt4303T4bcanSxy1P7lViZPJljG
	 HhzgiRs1w2+D3jJOOd/qWo6N42kdSb8t9ak6XaAI2ZK0m6s+epRVZDNXrtMVUNcMpT9bZ
	 S9DhLykjrIu8kXxYnodOUHcF8Ym3M/OjqWIFT6aYvPmAPH0iM6ANmB5u/Zypc3R7VIFgy
	 LV5RUB0+5tpVX55Y4zkE7jhSmb/e7PvNUxAqe/7veHobqODpYCCTPokyJWEr8Irj38Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lizL8PRQ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795690855;
	bh=Fn2Tn0KBva+1wFtcu2VWlE/RHFxuHBSMoRw5hsx3X1s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ga7J3GAV5QDFkL9id7CEZKh60idZrle+r+CgkUmpPFhyJKShbyz2m0IstHTgpe+Ju
	 9A66NmacofiZj0Sp0TOPYkeM4RYTFopfIPDT8uPguy354oZlrxZrjGB5Dm/osuXtFG
	 igZdvSHKRpHICJexAbsch+d0BJZ6yrLqNCVXnmuw9BZn1HUXQse3PFXxbCMS3Zjk7e
	 EEtpfmYj5aDxKvNO7jO2inFgI4IXxuxm3EOG5vO4SN0qr5xOFKmvz6LFyQicWXv+ma
	 gSBa/GTrn6TlnMunrFx9vfq2fNIDGLB9R5X1xT1tYsAmLK/mP1U6oDG6wS7/o38Nqn
	 8Ql7CeImqBsDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A81E608E0;
	Thu, 26 Nov 2026 11:00:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC63A325
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C23FC608E4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k436eDpNwXxz for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 11:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C1B0D6066D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lizL8PRQ
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1B0D6066D
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:00:53 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c50692e6c0aso109455766b.3
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795690852; x=1796295652;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4icnG3t5NCtMP4GlevzArgWg032SW1ADgdZHxYyhfGA=;
 b=lizL8PRQH1767HihMCKj3NMMcaN7mtotDucseZpztWA1f7txmEf65HMjCblyMvKl5Z
 s3Rc2i+Vl69OPgOhIncjB8JdzmhuS4YJt6J72HWIn2STA9wBtbx251IGpB15PKTe0pmr
 sol1rqHTMSGieGWQV74veBa6ylKG+YH7LkWYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795690852; x=1796295652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4icnG3t5NCtMP4GlevzArgWg032SW1ADgdZHxYyhfGA=;
 b=PmRlDuRn31b4WLEQQln1PA721fzfe8i7EmqgdyGrl3lIOy8o/h39TPvj/k2VyrbWWs
 LpUZLsEWpeDhUHmSF2FpXcmILeKUMajJVFXxD4Tv8dlnab2ewC0GA8E59eOgaqtISf3Z
 TPNyZBVk5b58ZMhpYZvvR2pMT6qXEQo93zpY9UH0GZEdXBeNuKLFeBPsNw4I0WT4fjEm
 qelgeVfNJo8MvUkOYNLzwV2XeEi4xAyHxvIcCCqq32JS6OCBDXgrHksCljFcz32Nbgqp
 v/MsxD6xSdBAcMAxBWKAj79d7f7EuPKzn3Ta13KD+KuySN/qtGBs14al2mvI+cu3ybAh
 ZwIg==
X-Gm-Message-State: APuU4Z/FVc9wJFohFcZzbNH7iudC1vyTwzm0yOwcz4iHsgrTdM64tby4
 MQpWq4xsMSSRFY8iBnEV81HkMyJh0XZdPUcvQVo0W3XhVYPqvSe9F/C5ITdfO0cO5Wo2DLwbgvi
 dTS88KwQ=
X-Gm-Gg: AZFdTZeTO+M99aIacwXQn3gv5X+HeBYe0ND/T8kHeS/xFm8qOSQAcb2XTxtRN6tjv7o
 nBRN0cwjUzTBSuZBoac8H05UVqSHljBs/RbwLzR576x9QygDdZyRUVbMsck+DjbPfs4KiX9XdCB
 QR4rpCXi/i7WH5ZoFVMSb3HD/0h0W7XyTpzZ2RZ6maQ96L5jvvXaMtK8b9lKHrH8tf0o9LeUWVx
 4l1YqunZM6hjQWtB0x5OschXSrWnlmZkgLrHUmVS7hKmo/o0CdEaG+P81Gl0CmzPlrpAyaSKevX
 7Z68ZS8paHPdQJg4RjEQ9Lo1o4l+dVgkjohFDXNe7UwVPx6Kw+ntkDAaSiBdq3mlB8Q2gOiheWQ
 N4iVsjzeNMg5MxPjs0IRaXagXP3I9JCwejRyl1LHGN784f8JTfivqG//aXGqAT8SrD7xEgFkBTR
 3ybp01JSn3JyV4fYtmvx/WKqVZWX7riX5D5NjP8z9UvbyiiDfWeDM5dnFi97oK+mlmAfMJuAeMD
 GbZj/weTzwgU4EU+jfokT+DiBm/KvGNySZp5++zeNzgA3sDFKszUiWwpO8+mPzPehUGanh8BBkW
 HAusmyKeQrDXaaw3jrBBUaJX3t/dqpp4/LAw5+NamXlT+Op9xxz0BS3GnDM6Esl5DV9BjXaEivd
 vN3B8nwNgC10yGs++SL1Q22ZXfelFe37bl6eRSeEeV1IumqstAzBK3PlmihHJpj6BXnx4LaWorP
 bbSW4x
X-Received: by 2002:a17:906:c311:b0:c51:45d1:eca6 with SMTP id
 a640c23a62f3a-c5145d1f0a6mr1333736766b.2.1795690851505; 
 Thu, 26 Nov 2026 03:00:51 -0800 (PST)
Received: from localhost.net (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae9dc7asm752067366b.41.2026.11.26.03.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 03:00:51 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 26 Nov 2026 12:00:25 +0100
Message-ID: <20261126110027.308073-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126110027.308073-1-adam.duskett@amarulasolutions.com>
References: <20261126110027.308073-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/openrc: only install zsh
 completions if zsh is enabled
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The zsh-completions meson option defaults to true, so the completions
were always installed, only to be removed again in target-finalize
when zsh is not selected. Explicitly set the option depending on
BR2_PACKAGE_ZSH, as is already done for bash completions.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 6229cf873e..9cbc8f59fc 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -50,6 +50,12 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_PACKAGE_ZSH),y)
+OPENRC_CONF_OPTS += -Dzsh-completions=true
+else
+OPENRC_CONF_OPTS += -Dzsh-completions=false
+endif
+
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
