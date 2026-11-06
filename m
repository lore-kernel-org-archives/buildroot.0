Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3FE606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p50FDjgm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxgI2s9/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2707F60A71;
	Fri,  6 Nov 2026 21:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hI6P5jtnrnuL; Fri,  6 Nov 2026 21:16:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5465F60A5A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999819;
	b=Pv6Dc+2REtsEUGJz4/DJPo4RumQjnQzs5riuXSZGFSl4dMygVVQITlo9zm+XXH52Me8z
	 EPW46DQ9aTMbdm3STHRFZwtM+WD1q6SsNhjzqU9LXklAAKe/IhJyd0+p4V9Lon1pGGcC6
	 RDvXgNph+v4AlYcf/EYnocBsPYST3aomtGPS0FGqTp2y10SeI+LNCKsJqJYMCwV3WNjmm
	 AXiDLt0o1FFx9+uLqLOndyu/wH3Tlw3IQRV1qcaiMiPQFLJAWP6qh3iKUwkAcB5q3EsS2
	 ytz6Ij3OKY2mztyMdwJ7ITqaOeq47ja7QmziQliNSepBEtVSs2IaO0oEeEPyUFFGW9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999819;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lPddDNtAekYknlQJ7ygeafbmrWsL7ylL+CttALN9DA0=;
	b=BpmEpRxlXcbB8YLDPEfe4a8pi7A/vkrEcuw79PoEMp4W4KhqXTHH8LRDjWXIWDJDIW8p
	 WrJmXDUWlr5+XdwF57NvYziEMI4l3I6dSwna1ZMy7PI1MQjlFsaxC98lWFbD0qHYLB9XW
	 5YBVKHJa7igdmcZO463hLvhmjdwj98oThvwg9zIJjiOKkYgArJZDFZmsdga7FsAxwi73G
	 EPUWDGz2A5Mm3X4LdM5PkwqOV17HkEjMYn1pEnmukXmhcpDrfyyyaZV5pGHRiP6Bh9OJF
	 8rrFQ5QPH9d3igK8dzygplWaeT82EH+k/Gou+GKqWF6yw7om0o6Sq07QzvXdWSlR4iw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OxgI2s9/";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999819;
	bh=lPddDNtAekYknlQJ7ygeafbmrWsL7ylL+CttALN9DA0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=p50FDjgmXK9Y4i28/1tJ2+0+owlUMh4T2E0n/pnrFkcwDur073h7ERhUD2DZNmbsl
	 ZpysxbeBmxL3ii4ic8K+a6kP6Cilxm//Rwg1U/Ow1aXRaGlO+IWs2b1kzqtdd6vgMt
	 VhAqQfB9fXrWYFEBf2rzWxPrdqvay2YAWd86gWv8jRBW9fhpeo1ggKhL8jsW3q8QOQ
	 fgbBZ2tN0rIbM2S8DoYXtv4N8QsOokAslPZZi3m91CNDcC1emctZvtt4uGIuutJkOP
	 uhQtj1W8Pel3unmncqB245H4oIZc5MrQbD5Pk4KLaUlAQN81sqvuT9TBIFjkw1aVwD
	 KeOuO1LgoXxDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5465F60A5A;
	Fri,  6 Nov 2026 21:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E976531F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DACCF60A5A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1ouvA_w9g0W for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:16:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 383C260A40
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=OxgI2s9/
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 383C260A40
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:56 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-4877837890fso543734fac.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 13:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793999816; x=1794604616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Veboc+4VB0NV6Y9/j5mJRGm4sqVHcCG77cOLSWwItbU=;
 b=OxgI2s9/vlqGkAS6lE2wdSG3eEbM1orWe5gCkm1fDoHMSQc8SqNndCP0vsYhq1MMn8
 2DZJa1e8XvfiN9l4tED7BlpXJjeacQEd8U4YZH36UTyp34SdXpHgalLWIUskXKcozOdq
 VLhb6Kpwy3OHgQTkjarlC2lFgEp3+B9+SPCDltuaSY/+9C3/w9lF8KIZfGyp0bCShOfj
 4xDH5Bxvur4brUDzWM0XZC2HqlADiYN/gIWsw5cFzfr312lMCTJmppuFoqMFbSwegd8C
 g/yYuXiz18PQgGhwRS0yoRknIhuLl9B9kayyBNgubwNDw5vTeSCfXIJPmvOcGNDBl0M4
 Q10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793999816; x=1794604616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Veboc+4VB0NV6Y9/j5mJRGm4sqVHcCG77cOLSWwItbU=;
 b=2J921mNasbVBzCHU/Ge7lvRRUlRNdkbczalhPRKP3e3dYRo01XuOPQHZx2wD4lQA2b
 bCaRbpk5hd6X/xCXWW7st842qKyS5pcdYLtGRuyDm87Yxn5O/2FTC//3WSoqSoJHC70J
 TTObTCl3AFd2rVUEVBB9Xao4zqUAfBv2r3u5r0XWezJ0+2nbitgYEEB0HcqybfKkxVfw
 kicFbKvg2/Aen/8l8T7q6onCw+mrCTKqTQdJlM4I/Hyv+Wk8UEYAXCaeBA7stEsnAer5
 Oiqq44OfpL4faZ4Z/lmwEeyULudeTa+Dc4Dk7seZbyjionzlKDUyjRkDz92Ez3kxvxKS
 TwgQ==
X-Gm-Message-State: APuU4Z+HryWhUBmqDx+yjIFF2e+JwwVzcSCSx/m61IfxAonCCPVMNj9s
 l7xLZNXWhOs1sQDi/XYlmO3xgufXI7zJM1nH01qjw6obmbHSU/4vsNBBYaN7QA==
X-Gm-Gg: AYBFou1PwdIURfO9EDLbpaRCFH8nIVu6bNCMHThc+LO1zBpH8KodEpbd7cdrd9SAdG2
 hW7MB4uzROho6Zap1UySoRFXu7Vo9SKM6LP0A613FQ4nuDnlMkAzzat3dhq3qYGSnrKO6xtdd70
 RJ+pPGtUw8ACRPrS3jjZpBUvlmflK8aYw81rIbDk81G42REipKe9tGg/UQ2kw4iiESeLOEGSLrA
 tks0JxzIQhTNlFIntrKn92KeT77htvoJY7Po78INIpzvJd+qugVYNTBUHeUNX+lvr4hfm8YzCd1
 EEhIf1lZHLCxnXPEKhBnXtvU4vk37B/ZedsXKMddwrMK9YSTeHPHAIQtKbJllYWPJPuX153LQrt
 vkdd/wmqghVqG0KAPFPLlWjKGdQou0BHRmyhV6c+swyzKpVBByDTPhqNorq5Mo5MDaZDk2yrY0q
 IQBRaj5qwj+juPBgNrvp74cX2LLsLIsQKKB4Qp0mWVs+4YCUHtG1CQ51af+2kqIeUzf6lkNnbjc
 1GuIXcgzICB+SqT17G0nS0cOUfgGMFbE/9i/lZKQXBVMi2igF35i6T8dYBs0gN26NTI2h5ActNF
 Dy1r4bwMijeqjY8WfvhNYSlsLk6CDh47XsxLeoD7wDC3TIdOKU9wCEsvVcip+Tnc4DZIREGB2Eu
 uaDq30o8AiMoYQ5c5RnEyjl8F0uWBDmuvRLZV4ZDtEYQ0A6W4w8sHY6D6QkyGFDfLXeGyuqD3ik
 H5mCVVRp2ejHxHoVNazzKIYQ0ZDfE+v8jcdcCPF/bVuHcBMkJakQPrktPPO9Sy+I7PzI6znLRl/
 9TOoo5+OiJ2z0HYWfjSGQo=
X-Received: by 2002:a05:6870:829e:b0:42c:49c7:a499 with SMTP id
 586e51a60fabf-4ad984f8341mr2634121fac.3.1793999815920; 
 Fri, 06 Nov 2026 13:16:55 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4ad97a37725sm2986242fac.11.2026.11.06.13.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 13:16:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:16:50 -0700
Message-ID: <20261106211651.2571873-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-telnetlib3: add missing
 wcwidth dependency
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

Commit 25867d252b92 ("package/python-telnetlib3: bump version to
4.0.1") updated telnetlib3 from 2.0.8 without adding the new wcwidth
runtime dependency.

The server shell imports wcwidth unconditionally, so importing
telnetlib3 fails with ModuleNotFoundError when python-wcwidth is
not selected. Add the missing runtime dependency.

Fixes: 25867d252b92 ("package/python-telnetlib3: bump version to 4.0.1")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-telnetlib3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-telnetlib3/Config.in b/package/python-telnetlib3/Config.in
index 487258c272..80e30d683b 100644
--- a/package/python-telnetlib3/Config.in
+++ b/package/python-telnetlib3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TELNETLIB3
 	bool "python-telnetlib3"
+	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
 	help
 	  Python 3 asyncio Telnet server and client Protocol library.
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
