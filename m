Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CC6606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RpsNGMca;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eamucYbi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F99160B0E;
	Fri,  6 Nov 2026 21:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypZdbDG5oxT4; Fri,  6 Nov 2026 21:17:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ABB7060B02
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999821;
	b=DZMNW+PiiCUZJfH/SxcNe+iXdx5p0QaSwHMPjFZNDrTWVCSC/5FVFHxd2o2nFzbRwM07
	 3KH+iP6oqeNgQ0HH9fQbDbrazkYkW9fdBqO1nUTFRaBdEYcXkpvYktwKrpOfONsuFjPH6
	 iDoOVyRWPmmZHYwjmykaOPm4ol8lH1PF2mxe26jkYVWiGH9YCv4RFtjLKZ8yoG/2oD17I
	 YjpEproscPtOBDWLEzsfEXvyjBYFDYN+rdW60lYQOy+LmVCsKuELEon9aUcMxEQ7PlGoU
	 TTlk/FNX3A/OrpNZ1wtUMZqpNFlU4jtCCaeZsteOsqVnYo4RTQ1C1zTloC14yYkSQ+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=asJ6tpyfzOMXm4IR56QCL2yeT3ZGxuAdbosG98aFdo4=;
	b=cs9S+BuO9Vq4ePfo34FS4dVxE9I8ofkZKOCq1WErKPKyjqPbQYLRF9Nn+KAZp1j0VxxU
	 1p2B/Nt3MsGNhX0+W96yq6SoPZbUsQtwWWnnFKisYwb/nSo4jNCzdTwL7yU4+eFsajCFz
	 rnwLMKwbDXF1XXCtpB/InYyYulffPQgYVJlyn8w29FoPBVsUc8PBplaBmq+RdAbRtSdGD
	 Bzbu/GbKxNLEzZvcZfzpQA7GNsbDaBxLjEJeom9IUH/Ez3e/8nLAyxwKXKRtxQWNxYiDB
	 15RIozfo0f0OfQNuZ2Wn/Db44vGLKKQkMVPT9ttz+4Y1kXqY25PfkBGPiVIMXMq0NPA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eamucYbi;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999821;
	bh=asJ6tpyfzOMXm4IR56QCL2yeT3ZGxuAdbosG98aFdo4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RpsNGMcaVDYD9g5tgFoR6z+jfirbWNLq02oTassWQaxu7DkbHCDGCivwrss6ZOHSW
	 aboL0K6lCTaoZJ5EcaiqDFah4AT2oRLuQ3E1syIOyGe+/Vqwk5vMOLcR7+uVuEofYE
	 cFFySGTWuLMhviaRkibp/6xd7bEg3v9SKfxjSrJMAfSO5qaN3zNGYV1yzka6RShQ0T
	 UgsGLEYlPEBLw4X7Qsb8XTh+ZBiy9gHKFWnYAqCBSRHsCpHq3TBTXKjkErp/92c1HB
	 uOTmX+8doKK7B9o7Wq0g6hJmLOyHyit1lEPY3+1mf51+goC3FnQe6uxxKEvI+h+Hpg
	 ZWqTMEaLeXE4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABB7060B02;
	Fri,  6 Nov 2026 21:17:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 369E7235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C6C660A5A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzTpUKg2Om7K for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:16:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3552360A40
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=eamucYbi
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3552360A40
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:57 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-5642e0910a3so391553b6e.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 13:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793999817; x=1794604617; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k0ZLlT7pSYm8Xn2Ji5YfCy2jw28a/EZv+prnMQWbGIE=;
 b=eamucYbi9nfMmbtK/SvRZGYeJ+3bR86FBJe/ycOhvZZQjAtt0UVC6DOSa5iKnT0zTg
 YiWFJJ1nfuNddYLNiBV2rmDwk4ut0aKZTq+UElVGim/OO9GNSscXeHrrGRptimU/AYiU
 sD8LGyVZREayc65bY1AH+25wLBmkDMnnuPEnAzq+UwbsYSoZlejPmBQ0XI5GMmmqd7ZO
 SnhBrinYpzAvbhqgJkx7TcrEBNFCgW4SQDg6Gj78/YNJBKC7iBt1xTsPDFBLK4/4+gtz
 OSQiNBqziKhQZOLtaoF+3JWHRDYGWpStiObuZhkHHLhv7VNAVvFmJ9ol5Lf9LAoqpCjO
 0J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793999817; x=1794604617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=k0ZLlT7pSYm8Xn2Ji5YfCy2jw28a/EZv+prnMQWbGIE=;
 b=UCE7rTAKzEBKgRjZw6lKtbeg8vRze3FUQwHFC9YfpanszeZNUJuaWhh019p1kWditS
 gXqzaXKhADTpumbSDuAvTTMltjApRfHvgPUcSIrJSiioADYW8iBxJiswBUXiyaMqgwB/
 DXXLQiRnkF3XeXUPeDwVHcFp1lf6R1mhjEvSCSMUGaRbnwPe377qMHpeyN6IwcywXwzb
 JLA1AuYALmNcYv04Nlat59CQkpG2jXv7u5fLQm3TWQrHTsTbSukhCuviuLG9blsNNEh0
 Eopp2FUdASvGcrFBa4E6lhqmgRNgl2XNQ/5LV7YmHSkdZmZ8v2WpWWZ4pLVOwsmemwxU
 Y/mQ==
X-Gm-Message-State: APuU4Z+Z4uikx1fSvBIA4dg8wiXP3kFgOdzPWwTKX+iaGV0/t0jaJ2rU
 AtYyZmzQJWM4lQLOHois5w59n+CQxxq+lOE8Usmu+AeQOtyRJ0atR7JWRQcTsw==
X-Gm-Gg: AYBFou2UDEPEtv/9KkpWHPIqVewtYSThTd0azSoCuzb+55OkZzmt89HgmkrAhII7hhG
 hijbHupxdmj88F5EMqhmw4SajnPxjGzpOWB7knCQiZ7WHSqZHRjZ6YRNP5kuODYGFXHOJ1KIkX6
 wdDBuj9Hl4UZb3gNhAKaB16db4oYXxr0GGftkC8TE91ZcOWQLkL3T2aGu0bOcc+2g5Q14NPEjPs
 PphsT7YuEwbR32VaiRdUNSC9npLUP8vkf5FIeL71GVd7HVg15VMr6LuKlrkN7kkB6SZH4KkNGLD
 KaUOciAIodPt4P8DYNZQPaIz8dWbUh0hEHOP6t9N671tWu+3R2kjChzlRC1QDxRW+7Psi0tNC3o
 P6kaoUMx+mssERTCFEoD2YxUlm2FHparIwgODyMKx/YzyfUk0jSo0WpMBiClPVw7/7EOgefPboA
 BEi19nXdnHOYcPmsnyR5kx0NT5c6rWCb6gY1D8haOa43jPr4T3slcyzHJq9AVljpaOo/0s8n4Xq
 SOSc6sFJUj/kgRSqQVS/WIUBmwEg4aGMo7xoEtGutztg2C/InUXa2riK3CoRWfI1EqbExqejgrr
 gZc+sMe986iENuMmFaWL5BWqBDMmWWDOP4+vmJbw6rDvKV9/TXKA/0WeFEDpWHJgeMLylexd/39
 1KdHmaK/4LfZYUDSTChYFZqUZ6/oDYQanOr4Na+g/yEZl2BGCsvYjT07KaOYzojq6SBdGt2ZPB/
 scL5KRpOrQOKnTeUmHK/e1WqKSwecN/BS6D9/v7jNo05u99KDv99pmDiJMKIFcsFhWm19gG/g2t
 g==
X-Received: by 2002:a05:6808:5087:b0:4f4:857c:98ae with SMTP id
 5614622812f47-567e0faea86mr2702598b6e.11.1793999816867; 
 Fri, 06 Nov 2026 13:16:56 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4ad97a37725sm2986242fac.11.2026.11.06.13.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 13:16:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:16:51 -0700
Message-ID: <20261106211651.2571873-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106211651.2571873-1-james.hilliard1@gmail.com>
References: <20261106211651.2571873-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-telnetlib3: bump to version
 5.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
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
 package/python-telnetlib3/python-telnetlib3.hash | 4 ++--
 package/python-telnetlib3/python-telnetlib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index 65881e7808..ea1afcf48f 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  b60dff81a92a07ceba879130b48d1e4f  telnetlib3-5.0.1.tar.gz
-sha256  6fde197ffb71cf26ad27fe2c88694d8364f4b1cc962a37762e0cf7e79b9afaed  telnetlib3-5.0.1.tar.gz
+md5  ef45fdb8d87bad02153fff239ea3f6d0  telnetlib3-5.0.2.tar.gz
+sha256  30bee6ccbacc5c7540ae1a4fb990809eb81993d98900597c0795a5d1ad45e40f  telnetlib3-5.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  23bf24a5fe7cbfc70b962da94334649cf60a3b309834c72eb053d91d8caf60cb  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index 60772a63ba..8993920e2f 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 5.0.1
+PYTHON_TELNETLIB3_VERSION = 5.0.2
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/b2/6f/92e130274d84487c48b149f1c5bade54dae3cf535b4c7a5d4ca3e6579590
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/5a/d8/f91aaffb489997de5cb04debb4e251d9523835737935dbed6d1fb2f20a9e
 PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
