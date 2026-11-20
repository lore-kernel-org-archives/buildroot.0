Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9960A262B
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jmBGLzuA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6sTOJDE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B8840E2D;
	Fri, 20 Nov 2026 11:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATjRPezhGCC7; Fri, 20 Nov 2026 11:11:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA2E040E18
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795173062;
	b=llz9xOGa4dfwghmBtu8+bw5rpbFmM4zEiz2hDkwUbnd3ULZEIoYJPEykuiMSCBh382pE
	 b6pwLsL91u9sdicjkg4CELlfvFwOPshISsUIyRMIv8f9lEU4eSNlGWm9a2q4GuZ+9X5X6
	 AazSRTKM7BrEZYmo4qAwLMxis6mnKdIS2r0Xs+xdW+xgRNLVrvtlOlH6xsUPUzwUSVp5M
	 5vgeH0/W+skfOM9sccMm1ACfY0lcpuDsDmJrKULzBLSekrKpNODN/6nhRRnYD2NW9R8yB
	 Ucaa+P+WrV8s/xb7Zuxc+WK9Gbu6zMehQACI1tcBu2zbzH2Ann9FjAZ7RPB50ECxpkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795173062;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fThXEA0+KIr/ORP4GnQdCZotE/4CZAbWmr9dV0onOPE=;
	b=rjdhha33c9CWw/PpwSheHgpMsTM5pOsuZG4kmh87MbCDS41C3bjEZv4voqb5whzL37Q5
	 939qnjUq6xjH62yXgL5H4RKnWg9J69Wk3/Pc6Qo0PL6Tde6cvhUqqRF06ANkFe+ny/n1M
	 SfLgoWLePxGENxGDq86qVNwuFCBgCLZIRvADtSaCbAW0p/tNEtp8ElX1NlyyeJ/0FWJrq
	 +jPrOKIQiGuMsd8g5lVjfpIy5JPand3NKdmUx8xmNTPK66Lx4TEZaVbjDdUG4oQArPGXr
	 loLWMpdT7NzRTzRsbv1ym4SGs85HNYoV9TwBaExVwhNxM5MTMYCBf3VjizqK6mF+pUA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795173062;
	bh=fThXEA0+KIr/ORP4GnQdCZotE/4CZAbWmr9dV0onOPE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jmBGLzuAzehwpDfHNbYz235czSZaDJMArh7adDdhxRovicJRoH3bBgzkd60gdey+P
	 NYZ+46c8fW9fAmMWYfh/QcP+UvMnvd1IKkNFWQDpXCrSWfHE2/TtGDskdvaNGFksjn
	 eklvxg1Eoiyc5aTy94F4eCxQQiZDIgVpfRdC1xTrKigmucd6BdzNe4bp+9u5mFbK1k
	 dQTiuVbwKsWcNjLvOVopApCygMveRcyCGQTFbtvzN4D2vTmIEF9unEpP0QlrHVvt0p
	 YdmG7ZuTNX9sw2suEtdnwLAb8VgvywgW22uRDPqE0GvcHkfSUpfSYuEEc4Yxf+glzG
	 8mA6ItYh21OfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA2E040E18;
	Fri, 20 Nov 2026 11:11:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43419E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 11:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3482A40A25
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 11:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEsDoyfIvDDi for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 11:11:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1DD594016D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=robimarko@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=d6sTOJDE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DD594016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 11:10:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso6714345e9.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 03:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795173058; x=1795777858; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CUqvxUJuRdfC4mKJYnNSoJiMfT7zxtBSmrxuBs4unfM=;
 b=d6sTOJDErkA1B3LPuHv6hNqS7gng65CPTw55dMMCv+blrjyo3UIGlZSstifFG05iri
 qe2pouMczVltOLYQp//7WdHTAz0uXXd2eJTmAMhycJkJJqSmd2gCixYtixnPcXyGroUn
 YpRw9eI7sEedmOO9xHau1eJUIR/dUA+QzH0XOjuRjsO1wCNYFUQ1otuERWlSchC0OAQX
 qQK7zdhiNI+rPtMaeOYazSN3lC8eF2HZffeMTGJwog0aitOr5cz1mzFXEh2bMTW3fSml
 dfGWFWFKAtV2JsM6N+qvkf6AlLwNB+Eu46kd2aocixVmnop7uqo0+jSmxOs8bJ1csLD8
 hF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795173058; x=1795777858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CUqvxUJuRdfC4mKJYnNSoJiMfT7zxtBSmrxuBs4unfM=;
 b=twu0Mvi7/0YwloaGATUYxDD8FoM7KT8mu8fUoUDOALH8Sp/Xce2TaQi72qnHNkmp3D
 t+mB8Iel3JEDV0ZDI39yedcbYA5wJ5C2zfCUEcSKUbjo5uv0oZgEa3iHmr/o5IQsJJOp
 NL9jXJCHDdt4EEEfDzZAjT63aV4MxPfgMsB2zZM9Yirlb2bZEMGz6uuC0g0xxrs9zWgo
 oeRECa7BOcbyM+B+EBodYIZJqHS4Wk/9rY2hMBGdumfVmr+gFviF9XKLslQVNOB/V8CM
 cqaTVBJZR6fKJDyzdlOmYsBmTGBRuVS910kjyVJ5XVVk7UtxPcwhlPAQ+I0usDdxnZkR
 0GIA==
X-Gm-Message-State: APuU4Z9q42T67f9qxWMBWdyaVPwkErOWdN9NB4xLm7JIlu6xVyZgIUkh
 +sTi2vXSqu3Yrkme9kq5wjV1/MLdb4DC99DdMzGZMjdQ+zXctjKnf0d95yKanTAw+p8=
X-Gm-Gg: AYBFou0JwBK1I14MOPmDcNdDQgbAcLJCAvnS9kgdK6Lg3gdGkvawCeUzjLBKd5npEyG
 lMFIsVCozAfP7oHn1Os7Zr1yuj0iEx+VEK1PWrYII88d7vjaOnmPHUTqvEzK3pLLOzdyr+s+wJz
 PlSB34MNy2/w6lh47GWMa2T554QwZrBMl0IrkfIW3FvlWTR9YOi7bAJGDrqSvxLfoeuFLQY5hjZ
 5RkrHNE8aUm1uKsknt2wG75x3K3tstiRK+K92rYhuhQ73WdV9vTd0FaP8WNWfFUzdj91kCjRk5c
 mq8+HSP1RLvQ27eJUZgHUBVBu02PSBOdn46a1OAisirJWFlpX2lcMmGl3LpuwfXZ3DiMGFGm/aE
 z6dGJhRC105DjKGo93RwzqI1Q8A5E3sWWoa5rEiWrCKdD2G9g/CIaVK75Eh4jvvlf+VUTJQEeca
 CfYYWgv48eDW4d2S90VCBrxIHw0lbJ2KT2N/tkiuiy1Pm1jVVjao7GgivO9FdWQWER0396Iap7E
 Q+CVNjq8oUfSVjq28s49y2iEXyHY/eojmhSWFhDzwDUShxAYqFuSwwGN0/bGu/JuuH/PQL9Ihi5
 YGCDlLvah+eB8k9Fk4W6BTvCJnfk5R7Z9xzjfZ662TEdzxWds+G9cWEHM9aJpgdUczj+LBOu4hl
 wD2hgTRsvffZhydpaCWH40NpLuGdlGH3GahaJLD6tSo63EMz5OdmotdBRlFPR8xMP6fwOiJ/Ax8
 75B9DngeGigmLfvjNRL2uer7T6aLsN7pIvlw==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id
 5b1f17b1804b1-4bb8881ae90mr62512895e9.32.1795173057801; 
 Fri, 20 Nov 2026 03:10:57 -0800 (PST)
Received: from threadripper-fedora-workstation
 (cpe-109-60-83-101.zg3.cable.xnet.hr. [109.60.83.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88f1391csm52199695e9.3.2026.11.20.03.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 03:10:57 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 12:10:45 +0100
Message-ID: <20261120111046.811866-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/linux-firmware: Add Qualcomm
 IPQ6018 ath11k firmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add ath11k firmware for IPQ6018 WiSoC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 833c07b615..cf0a6d765d 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -194,6 +194,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X
 	help
 	  Firmware files for the Atheros QCA988X module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_IPQ6018
+	bool "Atheros 11k (IPQ6018)"
+	help
+	  Firmware files for the Qualcomm IPQ6018 WiSoC
+	  (ath11k driver, hw1.0).
+
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_WCN6855
 	bool "Atheros 11k (WCN6855)"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 86c6402cb1..ac701aef5a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -275,6 +275,11 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
 endif
 
 # ath11k
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_IPQ6018),y)
+LINUX_FIRMWARE_DIRS += ath11k/IPQ6018/hw1.0
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_WCN6855),y)
 LINUX_FIRMWARE_DIRS += ath11k/WCN6855/hw2.0
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
