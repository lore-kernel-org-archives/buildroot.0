Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7736606A33C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z2o6BzUV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cu9o/nh7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB7D831CB;
	Wed, 11 Nov 2026 18:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LG2JD6NgAHY; Wed, 11 Nov 2026 18:39:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4A74685252
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794422354;
	b=PQSSGAxq6kxVSXP0kxlYaNRqT6+SVIuAUUDtw3DYyPiFZfx3L5B/QmO6z3MLA3ScyYDT
	 dNsdg8u0+q9/4vmmpMWbAuQ9qwDtoDHA11qPPLWOoRhxqQxSnFJ6KeAZMir23Grv4L01y
	 CeqKBo1Oime1jih0ox+YDk3/2gAXsbKvFTsoihIVwnDNg4y6rTtMaVBKPPSUuK7pRpMuk
	 nGjTTVaAsroW6MlAgjgo/E5KTN2isplh7WQXE3HZztyUYJNW2WHSk6vI7ArIU72MTleRL
	 2OSJrbigzhKgrME7WhyGHqeblOvBA759qPU1Hb785FRxqhBVlhZq5vPf9C8XHNuJ8oQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794422354;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nG9eSQ4eso6Lu0r/M0KiXGHUXFOU98uUrBy4ODqUG1o=;
	b=s0/uSw2enKgb8VNP3GfCRhhtCwVn5Y48t/z7XBvNPdMUFTmVVlNeb8p8ycOYGYTl47Tb
	 uu5tbenFQ4zs9vgF+Ykmx5b0FZR1BtBz1P4jkq69Afja0KjiCncm+5hj9jZd50fDrti4i
	 Vr/rhpg2+HbuphFtxMdIpHMV6K+MobAoF095uBpu57TifkcH6mniuzrBdyaiS9qr3vCMH
	 P40d4hXR8BzQY+j3H52kV98F9tSvxwUuESebPaxRKGje+CGu5r/mQE7B8vekGDldPBiWb
	 ujPMhXPbFhOEXf0YEop97EKXXoRfMX/pko9YRRXGEYoimzUT0FeRqlPTuKmistd6LNg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794422354;
	bh=nG9eSQ4eso6Lu0r/M0KiXGHUXFOU98uUrBy4ODqUG1o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z2o6BzUVerrikvY4UChkP1fyA4Z3ApxNplw6WIXYORmg43A2ddzIuSvy5MUMiImVc
	 TQ9Z2Pkhf7aSZKf7dPMZJ74pOv04GA3kKtQYEsRidKxOxuhdUHXg7T5zg0u30IYvHv
	 5fJrUQWvlMv0z75uvrARM8ot/CCqdy47IwhsPDBHZ+yWEYa/4j/Hov7EkAF8CHl8SQ
	 I9QCe/BZuG9MZbDctbyzskA1IKqj4WkDLrfA7UwWIR2a4bAyHFkzyXXo1ai2Ya+AM+
	 nnon1LuWp8Ly0uGhQ/4IzAmn8YqdyrZvumzL4epgPyP8TWR66eGl6Iq+u4HiiPYOqX
	 rof6irTZZ8upA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A74685252;
	Wed, 11 Nov 2026 18:39:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5071335
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4CFF42FC2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg6u0-RX9TEV for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:39:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B43194305F
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Cu9o/nh7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B43194305F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so43125505e9.3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794422284; x=1795027084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IFnTj9BU8E3gvUuT/4GGluSJvynhrmRQKQMmlTx3Isk=;
 b=Cu9o/nh7+LexO8zy+VvrVSQSr9tsyO+oi/WZAEpOVd88UaReIkaYxyUA0SfuI43hU6
 8/zazKE8xJJpwby1jBKIhdRQ2lvFDbbh2umng27AfZ5dfVegtS+xqsEUlE//zk+dYzsq
 45em8lYtWSJYRdrT2TYKUMTWacPO+Ncgp7vr9t0csnX8ahxySAf03q1hLMMFSO8vGSv+
 bS80NS8cVCr0ZkkxY/ZFdO9y5mnQpPMXWFhbYsw63gKeSHJkgYhb5olMBhu98IJQU8uu
 u22pSwiLv9c43SGO1u4pwyztn7BENmJiCOw3qH5MKnsTEm4FYRm+XinalPg7lKFt5uv3
 nrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794422284; x=1795027084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IFnTj9BU8E3gvUuT/4GGluSJvynhrmRQKQMmlTx3Isk=;
 b=UmIOrgW7yxR04KiJEaMNoKmJVEQytKMhl0/p9fnp1ovG2e9tiz/X1UP543ayaOkzOJ
 h3Qn5hIMdlMMI4Eio8sox9Q+tzb6pDMQDz5Xkkm5i3xCHwgWJQ4vr4tDnNS2+N0Y+PNR
 h+JxK2dltqEqe9gART01jp9Foo5ltHjUhwqur/KZZSjPMAN2HFJ4At450y/aRkp75/qD
 P7MmL12tYkPKEeMN8ioYGrV+I0XtQ2DhUjbihPXuD4UVm//gy9+W5jzA3SABWnS1n/Cj
 YCydA/mZAFtVmvhrXhnFP65CBX3kmyxwKIiTiON1Wbm2/cEGZtO1mOLxPptQRQAJ/J27
 hMpg==
X-Gm-Message-State: APuU4Z8Ze8BEnrJlidZCYNqnq7oApU/j2OzvDIt9E/ndYhdfQVSybtYd
 YJZFqO5aIzhbhF7idgLwmMGGg6DKlyaY13e3U8bLOwJH5N1cS16ZbN3tyDqbx1zJ
X-Gm-Gg: AYBFou1EdAOCl+hwbNfhfyw6rUm7wpiQR7NP73+40KEUaRTBkBc9wWjvq9AyUGp7FmG
 Zl3hWE0nfwpD9P1/G+Uu+bduoFCfaJ9WddhMYgN/B8Nsz1V3XmgTO1y3G3ObwWA7+AcT5ic1Tmn
 U2NE/ewwOj4S2jexbmm93LdPfLdCoC9nD2CBQj8C+IHWL8B5pdM5YOVi9jq2xST2oaZdjEscKzA
 XbsUEZyTnFNiO8BrG6rOeAePc5mbWvZoc7/0zPhfe4pDPQlXhCBrqqCQ/DewVsOmQUvfikGOlHi
 bt5Sk+JdayVSuFPBbWE7tPr2mEWnpVN9tdWykAt3Y5VAyFZc6C+o8ZGdPqCyhjpNtlkL2cd24+F
 lL+wER7jQcqbIvnPgMqeM88oQuDyb4bw2afRIytVCn36XgjWbA7VyLQrS8gsFlJWk+MJQCUmFJI
 5PaKVtyGwGmLKJhE9CRhGVO4F1hnNPvq9W4Lh1kJedPZ+luQZObbQgVLLN+bzziEzzPQuIg3Epb
 Bt2FBmCQJpZq0vdaaE+Cm2Cy4GabtIbIxBU3hu1+f97LuMOh3QwEijSt7m+qNFjtAWWNvMp5MgE
 m+CjDqV5i6uZAH6oWR6HBmsvSJWW9awjxu/m8GZa0Y46ayJc38rA
X-Received: by 2002:a05:600c:b86:b0:4a3:2f35:38b4 with SMTP id
 5b1f17b1804b1-4ba09377b2amr54760495e9.10.1794422284075; 
 Wed, 11 Nov 2026 10:38:04 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988bdef64dsm11007672f8f.20.2026.11.11.10.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 10:38:03 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 19:37:54 +0100
Message-ID: <20261111183756.2235235-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
References: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
 <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 5/7] boot/at91bootstrap3: find the memory@
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
Changes v2 -> v3:
  - refresh the backport for 3.10.4: cherry-picked on v3.10.4, the hunk
    is at the line of lib/fdt.c in 3.10.4 instead of 4.x [Edgar]

Changes v1 -> v2:
  - new patch
---
 ...w-name-of-memory-node-in-device-tree.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch

diff --git a/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
new file mode 100644
index 0000000000..46f591910b
--- /dev/null
+++ b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
@@ -0,0 +1,35 @@
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
+(cherry picked from commit 72da9d23ed07bbfc793d767dc5a4044cc0a95706)
+Upstream: https://github.com/linux4sam/at91bootstrap/commit/72da9d23ed07bbfc793d767dc5a4044cc0a95706
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ lib/fdt.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fdt.c b/lib/fdt.c
+index 7c37fcd5..84538856 100644
+--- a/lib/fdt.c
++++ b/lib/fdt.c
+@@ -277,7 +277,8 @@ static int of_get_node_offset(void *blob, const char *name, int *offset)
+ 
+ 		nodename = (char *)of_dt_struct_offset(blob,(nodeoffset + 4));
+ 		if ((memcmp(nodename, name, namelen) == 0)
+-			&& (nodename[namelen] == '\0'))
++			&& ((nodename[namelen] == '\0')
++				|| (nodename[namelen] == '@')))
+ 			break;
+ 
+ 		start_offset = nextoffset;
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
