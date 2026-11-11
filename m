Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9D7606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RSgXMsnR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uc4fxAOi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8269A81307;
	Wed, 11 Nov 2026 15:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TY32LT8Z3s4y; Wed, 11 Nov 2026 15:46:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7087A81338
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794411969;
	b=qdudxO7xaHmuxwTJ3mE9U1otXwkYc1m07wJtNZc9MG996dVsNXxvZwQGD5hT2OOPoT6X
	 OHMnFjFCe6Y64hgKRlyB3dXkT69xIUx9gop5j/GkBcfby9W/Smj8Yuh53XDiKFvFLL30A
	 z4L5BWkAVItQVRGbxvygNE9Z8CeL2JpIoG+8ANwG+Pz8/zLHZC8mhIYnqC5leTG/ZvMUV
	 UEYnH5Ta9eHkcJsFmJD8jeCqpoGGKrcL6cghLbI4A39jPHdItrgSdATbAlb0azJb8bBQ/
	 JIHePReexrmKMjUjEx/XQhgxvvOkACFLbIbVhQb8s4ZDHDVUg1xraY89XF5DpKSpB/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794411969;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=l0+elj+Ma3PQmqelDqVVhIyGebVKdoL7+aLzSRfwHqM=;
	b=kpHxkFkpIyl5sXEXsLJtSmnIPvH9uShiwgB77W8+oj6X5zcIN1ib0bRqpvyYMcAt/Gu3
	 /NcJCfvFyV3GFS1/mkVxPggmJPNMJo0qZdjQO2fSiiAmL0+FafqhJuCcafaRbshDiK2kz
	 f/w2lHAXuvE4B5ywsWUcaBnyTBmw+a4cpwoDwtK+6IlGzXwEUsWHz+aICPHbhs8hXiNiX
	 kIQBgn3z/EF/YvY4hzEf+gjttmn3NIgm477r5i8ZlxY5IDzwi3+upiW8Dy3BRtlhpiHNA
	 vhmrcf2VwG/F5g9X+r1Xgd3gHHProYR6yyCm8keWOZsclmjfSNn79/YswabS+wcu39A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794411969;
	bh=l0+elj+Ma3PQmqelDqVVhIyGebVKdoL7+aLzSRfwHqM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RSgXMsnRMuHQpM85/KqeS7jRPYmGa/RLWujuFJn7gYKqV8ybwV9pm2Nuth+cS+OZT
	 7sT+G3a+Gb5GG4zE/6RdL0FffDNp6ElWK5C4Ad+Lp7JYJ9e6CBNqnza3mCFhERxcWV
	 PaMnz76k05yVNacIwmi7iWI16HOr9bbeGbhbBIOAKHAfYPjEXar08IFMUXGpBW4I1Y
	 3TkaPPvKzjwnCmt4h8BahcDAX8V1h4Qri8oElnesNf3N+N+OkSHHZUV9claOqSQFE5
	 M+el8R2/ykbg0awqHPUpj/Gj0uewG7EuQsrOLUoHx23Xx36woGjZCk7jnmHcs6lFfM
	 MYaPtPi+WM8fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7087A81338;
	Wed, 11 Nov 2026 15:46:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D86E631F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6B0140518
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DIvL760Fh8a for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 15:46:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A35F540891
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Uc4fxAOi
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A35F540891
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so29010005e9.0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 07:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794411960; x=1795016760; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x6tkEmW1bIwRfLIAu16y0YNw+taF4Gv92grK3VcA0og=;
 b=Uc4fxAOiw9Z2myHdMlX0L9CQgBobzpQ4Hdscyu9Y5IGzt0eOBcKDDzXLQOjk/q50ll
 QR+ZcZXPz1IbjiPAGoZCX0K+QcrvcwaG/6I4T9N121WgwDNT7La3zaxHu873SmvyTPrk
 c2Vsx67hILOHygIR19BxfH/lldzkP3iP2gA/d8njZVGZvshaWK9wo7SXuKLh2Tbn4LwF
 0iev0+0oa6Fa3MWUvNLMZ8Zw2mGkQORpfTStWxaGrnQRF5MyFwaNv4gpIXw8N8yi5ce8
 QtYrIX0LYDh5lqv4I6cNU4EB2hICEfkUXM0Wl45WY+wlavbgHi+kZWPWTP/oQv8U+t/c
 x8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794411960; x=1795016760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=x6tkEmW1bIwRfLIAu16y0YNw+taF4Gv92grK3VcA0og=;
 b=FSZsw1zLFI3U4eUNTPX2Z8q/82WzJoOJ8pfM1IB0KtWiHIKFE5W6xS1YLubfn2d2L7
 LzdWGRNVykqxHic8fpCKcm3ZgK+Oe4oWpgoCOuLIgndC48jAtEdpJKb/RM7cxDJFWADf
 6fySGtSBAKZqNglDYE0Hor7YoyYbdpYdl8Z/ZM1fEGqs3F3s6aX8hTGaOTBPW4E0ZxQ7
 VsG2oh/+sujpgZbMy2CDnYhCYPYAXnUziPR2oxHA82kL8HvVpR8eFm/AaxouYSrgzMf+
 eOXNtmKW7j7G16jwihMTLYEfG4tXObpBaua+VOoP5ZDyA6PBG2LQ4auFFbbXGjDcmbjz
 MSYQ==
X-Gm-Message-State: APuU4Z+07Oqg0TNBwMSP8x2rqsE1zP2nusEzzizEfRJNd/4jxDroiPPH
 bwq2vdkvNC6J4yzOIQAadMteKhHNYad1KNcjsXWvIINqiqhtafT+M0fqo4OD3Za5
X-Gm-Gg: AYBFou0XY0adtIft7xt1DEC6h8rACpuRjsqBD7Un+ZVBmQtGULYyOxsYYvQSbTHmK6v
 mnZeK0oT0obF7MAoW2hxTboxO/b1enwazuidIF7UXwBM5sWeNTPULYNgIVF2IpMcnZrIAYWSo4R
 5eJ+ZewszWpakeXEZJ6mVUxivmhhcxXA9QbSGgF7a24ko3QZM6ID8ZLNJ86oTyKwY1QB0lJJzH7
 olu3pbMlu1IX62IebspRr3LDLteOOiLyHn4y/nRIiCBFOms5Ly+3KxTARGBJQ05tHtWgL1gw48p
 NJ8BoPrw7sQEDJcMzLBwFUrNR/kKI170KJZmy/mh0ukcBgCVOK2hS1y3LZ+fagZXI5wAg7L609K
 dhZ4NT9I8cLACxqP0Kt8S6ZewRSzQbpWPay+r3OseBSwzNuOlAhrBcHqgIsmL+NpD4fB3DW/ZiD
 xhcZqZy6Y6gb+rKVN+WF+VF/sJOc0GDNM0Xijcouc4IREumZ8xLR904ktD+ihuiVwgbs5U5mrzF
 VPuzri5iGhnSmcjM80W78gTMgBRqcPugGce8t1f+WGo+OIHQSihQ3sOtDIsSdhLppgZrUU4AtpN
 1WxcpexZw+p4XvYye03j3yqJwtikfLtQAw4JXBkHwgasDxwjSh8b
X-Received: by 2002:a05:600c:6819:b0:4a2:167a:c946 with SMTP id
 5b1f17b1804b1-4ba0935f880mr49209715e9.13.1794411960265; 
 Wed, 11 Nov 2026 07:46:00 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c53bb94sm4574095e9.8.2026.11.11.07.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:45:59 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 16:45:51 +0100
Message-ID: <20261111154553.673632-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/6] boot/at91bootstrap3: find the memory@
 node of Linux device trees
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Before booting Linux, at91bootstrap 3.x sets the memory node of its
device tree, which it looks for by the name "memory": the Linux device
trees name it memory@<address> (e.g. memory@20000000 in
at91-ariettag25.dts), and at91bootstrap stops before booting:

  DT: doesn't support add node (memory)
  SD/MMC: Failed to load image

Backport the fix of the 4.x series.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - new patch
---
 ...w-name-of-memory-node-in-device-tree.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch

diff --git a/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
new file mode 100644
index 0000000000..ef6f5e14b3
--- /dev/null
+++ b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
@@ -0,0 +1,31 @@
+From 72da9d23ed07bbfc793d767dc5a4044cc0a95706 Mon Sep 17 00:00:00 2001
+From: Xing Chen <xing.chen@microchip.com>
+Date: Fri, 24 Sep 2021 10:47:35 +0800
+Subject: [PATCH] lib: fdt: adapt new name of memory node in device tree file
+
+The name of memory node was changed from 'memory' to 'memory@address'
+in device tree files in Linux. For example, 'memory@20000000' .
+This commit checks if the memory node is named 'memory' or it has a trailing
+'@' .
+
+Signed-off-by: Xing Chen <xing.chen@microchip.com>
+Upstream: https://github.com/linux4sam/at91bootstrap/commit/72da9d23ed07bbfc793d767dc5a4044cc0a95706
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ lib/fdt.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fdt.c b/lib/fdt.c
+index 8d1fdfdc5..aa20426c9 100644
+--- a/lib/fdt.c
++++ b/lib/fdt.c
+@@ -254,7 +254,8 @@ static int of_get_node_offset(void *blob, const char *name, int *offset)
+ 
+ 		nodename = (char *)of_dt_struct_offset(blob,(nodeoffset + 4));
+ 		if ((memcmp(nodename, name, namelen) == 0)
+-			&& (nodename[namelen] == '\0'))
++			&& ((nodename[namelen] == '\0')
++				|| (nodename[namelen] == '@')))
+ 			break;
+ 
+ 		start_offset = nextoffset;
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
