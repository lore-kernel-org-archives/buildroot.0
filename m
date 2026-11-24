Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E2606A339
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k49s5Ik0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lcGVMxvP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBAD9405C9;
	Tue, 24 Nov 2026 12:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeL_bN6cMb8H; Tue, 24 Nov 2026 12:04:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2641640603
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795521898;
	b=lXfXSdkxwl94d8b34BSulDFygNMQ9SlvKQQoCjLpZhaBfYa0dk/sOJrW0oISIS1Jnn1F
	 UckqH+W3W9G6AVcpkay7KE3ZfaArPIs+FZOmqhsrp7x3NraMfdCfK8gPZm0xIEbywKXBN
	 2MPsZEBOwbBqrezx2cP1fyztOpvd3a9pqUNzmLNhBKMDR5kHTTCNF5rgTzKFJr2kxk1Ty
	 liUW2lPczTNv2+cZNAP22790Zhu3M4WwD5W066R0EyhJz/t1bm0wPxBysdaCgJfHWH4Yl
	 8DLhmkXN2S5WM6pgeH++Ts51vwI/Vu5hk7FIASBheZMfecOVAFRq4fGlHughyOJbyjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795521898;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=IDVeOMsph8B26NblbazVY9XOD5zGIigIaHhmJ8fogR4=;
	b=lPBB81QTrlgHOQjUTe36AH2ch7RnzG+JkVo9kCqNjNN0EBgS/DFHsohfQ0E5k+h7J6aT
	 WIGsUoJOUSzOskdfHkouvoAxJsTM1mvQiKJ05fM8PaetGsxalDoDXh6yQglD598H+NkJQ
	 NaiPsl090N8h4zpULzUR01APrNXiFhn04nYek7PSuI1sZO+5+7xCFqb3s5357OVYaCtiD
	 /8o68LYKHEo7YbOsCZzgS9oNRkmdXoqWnvUti/eV4fFdQ1iOrq1/w3LYFKFRl8WEc26K+
	 WZYAWv6VyN4OtMzEVvUhFTgQ+fJHOvg9Ginswvr8kim2Q5t+1ZNtL1yGoTnfOpPtEdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lcGVMxvP;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795521898;
	bh=IDVeOMsph8B26NblbazVY9XOD5zGIigIaHhmJ8fogR4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k49s5Ik04EGdq9G3obidisi2w1tOfEclMO+MvkHc8aPAdudaVocws9+Zv19t7oJx4
	 qQ24siTqVrcpOaJksvSonofkjaoEt8Iq++XHGoqCXeiLUWhbOPKzS0PT804GVcty/f
	 4w8XzP/IVJO+ZMDijAfQgIhCGBkQ9ZSvSFwDT+Z8XPx33Jx3I2JD4vg+Uuekeg3GoE
	 jR6FApaZdEviTUc69Z9NmPLelJ44rQHkgZenFk+6+GmmnGVpkuY+sIAXho7cRzluPR
	 mPn6b9SdoXmCQMBeQFUgOZfaHavJ/gNFnctjQgWYXO5eZ3rB6JNyz4T43h+MU5sOET
	 C6ksGPcILb1lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2641640603;
	Tue, 24 Nov 2026 12:04:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3FFA3A8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C197740655
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkj9g4UQItzs for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:04:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6C34A405C9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lcGVMxvP
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C34A405C9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:48 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c408e21e8acso72603366b.3
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795521887; x=1796126687;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DpsfN4Pt3SZwO3YJRJQsP9i4cwMWyctoL8X0CLe3sak=;
 b=lcGVMxvPyAIIFUpLqfoOIrGrlDkZ3g7DY8u4f3e4cdc0htSiQjEDdXE0sAW60IQ1mF
 4KI4xxzdptSbgweBcBIEhDyGiPtDPmJKE9r9KcgKrDfAEAdaw6v+HQ6HAQgJ0v8axNUX
 uHpYR3V6R7jd7Iido3slnSfRe5eevHx1bc5/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795521887; x=1796126687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DpsfN4Pt3SZwO3YJRJQsP9i4cwMWyctoL8X0CLe3sak=;
 b=HwVUprh4CT7pa2pEkxpu5j+xiwarODTEVbH4wmQbzG2SBcnHh5cKqDNSpZQccB27HM
 SJJ94EVMRS67cMQhBrINNHdYVKRU5PzFdqfYi6NvDYvHomzaMeO4VODRi7SQhmLNA6Hx
 32VVHvxl6sve7IhMSXhmf6LTvhcTqhv5AOAXVxZ+g/kr0+mmgTg0KjG8Arx9EZbrn/ff
 iWwinTvtqRQyBByYR5YlR//ntE66vARWgSI4Eu+GU4mNkZ7FMlFO9TJOXwCLTutTyEvT
 5qrp4R9EhEqRL2YLAgqhOMeKvUwMWj9CwRQtDcfo+nbTXpOJRlk75co/HAN1WBecqyz0
 CtsA==
X-Gm-Message-State: APuU4Z9Aou4hoLc5l6OY3H64b7qBerY+bM2hxIxMIoDQDGo90Msg1e4L
 WLpJ0bcb3LH5L7WINCYrcVEDrYtxDJr2L3kWX7z/yRx9DlppMcRIcv4HlsQZzrV9TqiJr/B/zAU
 0fhrykDU=
X-Gm-Gg: AZFdTZfI0p+Dt1OS/aQvaEExS5Rtwb+VL7FS4jjXB9+RblwWjiY6fdF77Q5rrPrxp4S
 WhGGebeFNCbaJpY96oBVNQ8oHOFUlsYHy2YoOng1582qGPeY4I16bgL12zSVNKo+KBgs1WYcfL2
 Tmxmj1iNoO1hseGRMNHL88C2KxwDjFxtLv7CpGcZXIf6EOa+BM8nxZ6EdsqchmvbhprwsQrkJfo
 h9iGAuojhbYhU0YXOWs2q4kct5JrxxgYn6fyl3RLP9VrUy4GlQhiORnFfXAhywWzd+18HM4w0Qn
 qD73rwsSHxwLVHfq8JMyZlDUmy6hzOrnTDXhjEmUN/oJRBpArGY+MFNAPKTeZHiLxwr8cMpcmb4
 3r+OjhrE/5qhsJYypC9gg5KZ1YdynAqdzCQFduCpx2b55HVSLdDO1LeoUwUvnVIWoMqUKNEmh8R
 OxvjOrtL9ig3L4XsJsrWMtR8Y9vKu5WoaqTw8JEIE6h+P5+ouHw8Kh9vKSnTxzXbxQrFSsNWI6A
 A1o/UBQ0YVSidFnRH2jeH7Suo8Gs7imMRaEAK+z79EGC1O3w5A+Z0DXCfEaxjiEHaU/C89GlpuE
 L8uY8c4etaOjG+XExWivxZz5ChTeMQuvYAC4yveRqxpQF3HXLwK19nCyZe5SQzuuZs9jG0YNXUt
 shtCw/5Dv+zB1Vc50tIggGW98Ejd4zFhu3jAX0y62HRTgxlyZS1laXAy/k7ykAMDW1OXahZBEKR
 anGjAD2FKCU8h02IdjtJWFGJne6vad7ognnUklO+wXG74BSwm+NqFohwXDIPqpEbtHqkWvHAkd5
 QeZ5oFOVKu9NUYU8YnOOg==
X-Received: by 2002:a17:906:6042:b0:c3f:98d4:dfda with SMTP id
 a640c23a62f3a-c513a5f04b2mr1091850066b.3.1795521887027; 
 Tue, 24 Nov 2026 04:04:47 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm499466766b.27.2026.11.24.04.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:04:46 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Nov 2026 13:04:37 +0100
Message-ID: <20261124120443.1909297-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/9] support/testing/tests/package/test_flutter:
 bump kernel to 6.18.65
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

Bump the kernel to the latest LTS.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/tests/package/test_flutter.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index 30c6a430fa..ed8837c7c5 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -16,7 +16,7 @@ class TestFlutter(infra.basetest.BRTest, GraphicsBase):
         BR2_INIT_SYSTEMD=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.54"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.65"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
