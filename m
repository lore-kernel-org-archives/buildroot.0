Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A181606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tbpw/2Pk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FJh6AFOZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25FE381246;
	Fri, 27 Nov 2026 11:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ezc2gLC5gbwX; Fri, 27 Nov 2026 11:06:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1FF7881224
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795777560;
	b=gOKx8cWCP+rKJjWc+XRGuRifZ7Tf+HQZaSAkHsTTJxh3mBjoAMEHhWjuz5BCVxgG0Iw8
	 11Ns8jnHSZx1H5P39tF3N2LXMaCd1he/eOhDWWUfuvqZfudL1TIPnkxiOPiaWQfakyjeD
	 NG1r1LdLcQ/K6UMD5+XE5nZTjsIatC86NXCxu95w1dwAG0ZThhkdof/mqRJLb/bd+G2hx
	 MJ3fBG9rUc8p+hErgKGdJTJywodaWo9wFfPv5fUO5qcaQCtRAPLOTTh5rzXYV3K+eZfIq
	 Nb7vl+KJqvpqQitGojYNRSDg9B9aweOWFcuy6/3TL7R2nEfn0cl6UHdWhqGjghBuM0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=k4x/iEwvwaf7qmtFC67TnUK4ll2vtIWG0Es/MX5hN8M=;
	b=X78bPu/ZDwNEQlrlMCIm23zllGSzwewXRIZgELyaxp0XI4x6UzWB2jcbly/VDUtzV31F
	 Ak7xhWypbv5J3a+DsN4AmGS8WAmZN04blhXu8Ky6Cqgmygs+hI5eBIIQiArxVk2QxUE0j
	 krwmDAFiB54+tihoLh0ayS4bE6XlyLAjPxyPeaJxXeagPC9inF2BK7aE0VDhNP9E3yLfo
	 9qeU86IRnyLPKxm63BMBS8Y+KWmw4l4DYx3GL7Kp5M24kdMOm9+uqyC8Z05CG/FGUIExL
	 aKRHCDiLSNnd6+WkKSKC7xwHToPSRGOFaJjuvWfL7TCUtrdhHI+klA9ZY/1Kg6VNtHw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795777560;
	bh=k4x/iEwvwaf7qmtFC67TnUK4ll2vtIWG0Es/MX5hN8M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tbpw/2PkBQqhQCv4FZuDmpAW5+QmSxBK7yxFY73HeIPcEpJgE2/EacqRj/Uz5EI4x
	 nx4nWAAjIa8ADlydtkTQoIUxIN4rlHH90PGM8FJvV7jwt8w9xdd3GTaYrqJRg6wkDZ
	 DzORFWYf0ldVgxdKPaPpSUNtpXhO+jTMLuqCJcOSkDz8Erir5dxjiVk2tY3mI3ycct
	 RdcBmBqG4GA48gFKu6Irmy23HuT3cM4DFKQNYISy12sXi52tKzycD2bKPxPKwVJr71
	 Un+Ym4/IBvwRpAVQGsTb8mKeqW3iZ/iSl4LasoQ0xkauKg5L4gWUpIp0+cd6xBWovK
	 k0ndDv2UK2FVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF7881224;
	Fri, 27 Nov 2026 11:06:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17B93266
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F217860AB4
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTXL42qj12b8 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:05:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E908A605A9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=FJh6AFOZ
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E908A605A9
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:05:55 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4bb606491faso42055095e9.3
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 03:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795777554; x=1796382354; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PY2HfW3Tcfk+Gei2Rk2gCILiBwRA1w0+qiDWGVYyMjA=;
 b=FJh6AFOZ9dMeKHq73EDym5eToGmCU3iEjqCjiUIosq1qlXRavx90sR8nH+8n2rUbV3
 gwBWDGfMYlks0X7Tgb1aoUdWcoDbKxh385utn9CloTYlRsM2RG6Lrv+e28gQ7hik9D4p
 vFq/MUe/CaVQBZ6i98wjRIDNbpjUZoSZ90Zx3vIJ81nh8b5PbhOiZkqLMCkIYtBLhgJz
 mVW3h4DWBVk2+8clNjSTIWK7GkTG/316zUBEYcO0t2czoial2aztoOGtA27kS0iV+Roc
 ekzSAMZ5K4LdffY+4BM/d727kScoB6K2gFvC4heKZqoWu8yiF2qGoenHfylDWsq+nQaC
 8mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795777554; x=1796382354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PY2HfW3Tcfk+Gei2Rk2gCILiBwRA1w0+qiDWGVYyMjA=;
 b=nwe2oUANFZPawvZsS0Fpdc24jAcPMxqlwIrJYvJZxyYKoyNMaxBwFkbBSRkyacNxkP
 mad/miX2E4XUP/fN+OR920dnjdwTsOS/W5wCYs3WAJWb4zRAmcVwFepFxntdgDAZJLjb
 IKjWiHOga5TKwpFJHEg30uSKaZRzeJ7mpyRFlL2WJEL16abBZzjhDEWmLx1nGjX2knTU
 BRuwgPmJxAf+DvMfpWVAgVeuQezVCz5oD4BHsoM3k8ULvIBlAZwzGU105UvAr73LJggS
 U9pXxsHlnBEy/K7XDsy6MEhYHytpOvKWjNQ8vOMpf9NhIeYcjXRfmSqZhSqpAENA1WJC
 bnEQ==
X-Gm-Message-State: APuU4Z/f4Zd2TCBZSMM5lc/Gz8+zdKp9DYdhAhA6Yeknp0J2tPJ+ltAm
 k+f+a50xakzpKnvr0M9GRNPhy+cZhcZ19OGesQVDjiaQif4xSJLe/FbPkujP7A==
X-Gm-Gg: AZFdTZda1prM+VckMWg+jIpDPZfsD/utYrJl2iYu5fIL7N/PGZJ7QYNjE0kqfMHOA1g
 9F+0yTEaeOR9CSsUcV8eS2DJa6uBQL11g1mYAXnb4CLt6NjfYV+gO0mozQBjstDRaZQqvAl45Ps
 peoFpv6Tc+PkXWie/Ge0i7T24aGfGZg4qp68LM5RWok8hkMTLtw3FnW50jWqm5An3SBRB7PFu+G
 3SDFV6A03SSjxZgsSYgl5SXIqOE1fCCf6mLSTHHouMXypqzi4zIwz2NGEA5gJTGurGltOgXe9UF
 OZsB8WtFTWBxlB8+FOi29OFjzApWTfAnWOsQRTJSXSBlroI9hAOl5InY18WgKQRkNMs80AsQiQH
 AfBgCT/8JPYvGIpHkzXnn9rSUj+/w82H3NjYgolNphgPudEyUBAuNLNJE1acMbHHKQ06mSVqiox
 +EwPK/RnoidlPJsWR/fbN+WwfF0cwIuo2FPZDLUS6CuMDIpvOtUVNvWc+njomi/WkeOY7RZegLw
 Y09LSkz5WWhXaoB2KqcHMbjkdHfs3vWxqKUB5x3DZ5fIVImQTuNGW5Ys+KXXqTNr4qV196cAayr
 lZ9m6qdP/bTJG/+Ks6GsNGdu1wlbIW5XB7xeGEBkwDoIRciZ5v8=
X-Received: by 2002:a05:600c:1d08:b0:4a2:392:9de2 with SMTP id
 5b1f17b1804b1-4bb8882bd7bmr474970545e9.28.1795777553331; 
 Fri, 27 Nov 2026 03:05:53 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4b34e9c3ffesm30957126f8f.19.2026.11.27.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 03:05:52 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 27 Nov 2026 12:05:50 +0100
Message-ID: <20261127110550.16853-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127110550.16853-1-angelo.compagnucci@gmail.com>
References: <20261127110550.16853-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] docs/website/news.html: drop the wrong item
 class
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"timeline" is the class of the list. On an item it adds the list
padding and a second vertical line, so these entries are spaced
differently from the others.

The items on the left side take no class.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/news.html | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 7ce2d8a22b..79fd1b6449 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -108,7 +108,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -146,7 +146,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -226,7 +226,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -304,7 +304,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -342,7 +342,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -463,7 +463,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -503,7 +503,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -659,7 +659,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -699,7 +699,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -733,7 +733,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -771,7 +771,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -849,7 +849,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -889,7 +889,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
@@ -928,7 +928,7 @@
     </div>
   </li>
 
-  <li class="timeline">
+  <li>
     <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
     <div class="timeline-panel card card-body">
       <div class="timeline-heading">
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
