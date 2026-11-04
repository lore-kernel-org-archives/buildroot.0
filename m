Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A9606C926
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Opr1UbUY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=daMYc0mp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4444D40894;
	Wed,  4 Nov 2026 21:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE_v2VJvvs11; Wed,  4 Nov 2026 21:00:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F661408F9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826040;
	b=Hfuyqzip6SwU0+Gsc7hEnviYv7oFheG+EYpWM4+kNG9x0fWNMQZHt76RW3JBbDsboAVY
	 Q9ik7TE/BNuCRl5vNLDXZ/HlcRD2ReSlD2Szt1BWJcmY9ew7ExWv77I1wFSdG9o+Nfnxb
	 ThMywgFA+UsVD11tcAFdA9tYu7FQ8aK1CO7/Y4bkdllloVzxMTG4AY9hXTheQTJ3xGE8Z
	 20Mm5ZVn7tex8jSOkep6zbcYIZpXCnCrYdmcCIqkbsynsToulG23wSs/UcL79GStoeyU8
	 HOgu9ka9kz2edgx60THRwY+SY95K1zGMsq79XdmVXvT64mPQ3G9YM4AFNVZ+Gn1l7rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=oxESXPZlVUbgcdDkrmtwIMsOJc6y/N1A3OiPoDE5ANw=;
	b=b0iSGdEeluHgVv3/txEg85x5pXXsSZ08tdEK9Ly4wV9IlTS9KpACY6LTtzKiHRWaUTJy
	 7Yp5DUzRd/9vPnTb4EKd77OCYM/gDJ5phV16BTF+7jLXOSDMqynTgyp98dvEHOqCq/ZK/
	 9FiCzZQq3SP0bYxKeNFmjJMPDz/Mop4+5EzeioHrTiBRm0F+17u4n45iBkKDERF7EwMcj
	 0+eE0Nm+sGellzvTg9Ov0uVXJVJ9u0nkoPVgS3oDhE4E5eji74/W5CUtO12PanHxSu0yE
	 Pdjroe8s0zw7E4MRu/9KbM/OvK9bC9d+2P4GvQ4LWV9vfDk+bi8N+JAAZbL6ThLxlMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=daMYc0mp;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826040;
	bh=oxESXPZlVUbgcdDkrmtwIMsOJc6y/N1A3OiPoDE5ANw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Opr1UbUYu0nKs8qpWcloKQFQ5q85rVoxKpl7AFIUtuSp4A/P0fsEUN8XNRMyjvDst
	 dTBkDbrI6h5sKe5uLx2676V0p1Q/yEuuOeP+Yq8ZtdtwWMkFKvDvm8mAyvRvi9snaK
	 WvXMfOgL1sMTdbcD4iRmh//cAPzFHYuu8TqF9lz/fh2hIhIY5fUjmH7gF15kon9xmw
	 FFQ4W3rnYn9cQUWoXoVcjR3Eug8eIa6/FLHZYkIJF6RGWvdqpQXD+Tw6BWiT0PYART
	 9q24Lb9QJzwk1IN+MnWiIH5JKwg+pjZFVk/PdtzjOQSX0ga1AAwmI1UDJC3zvkgqHY
	 VFGRccohcKZkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F661408F9;
	Wed,  4 Nov 2026 21:00:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 688FAB00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55820408BC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeKvOn3mNiI7 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F296F408DF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=daMYc0mp
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F296F408DF
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so761842f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826033; x=1794430833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m0q8Ad/VQ+zZXsoCNTaRb+NYyIQ7gwXwCtJVB0g5wHE=;
 b=daMYc0mpIVP4FAL4yfrPYctCnzAis1wV0dWTBt3x27FGhWmY26CjS/GH6Musns9CMK
 eF3SqDSSAJkAIABMDe/+v2kvJUMz19XTBJfZ1UiEJLpJXbP8c1rFL1mcQyBubMg+j93f
 +h8omUQh/zAwgFJSRCP5mdqZ+F4uI3J/FXJsjCN5g9p4Yb/77e+JjnhlWRgAgsS9JF65
 t4egCySxEpYmDIxOACOYsUQA1vn89Pgb7UU9xYJWlygFIJ/DXD2uGu1x7o5ufu4HmmuW
 moPpydfbWJfkWNnPj3IPLJaTxuzW6QcPOLaGLj71buR0SHolbkt+//MkkSLyOEvDNzSe
 TFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826033; x=1794430833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m0q8Ad/VQ+zZXsoCNTaRb+NYyIQ7gwXwCtJVB0g5wHE=;
 b=zN90xlZehR89efvunYuPpQ0bpQScoEVfDHgPJIF6gh9IY6juZx5dDaIZ2qaUsru/dn
 L9s1pmjK2wJgiiq6FDrERCvt8dVI7/8i1AaOKYZb6A5bCdPDFCrtyPJoghkRz+XrIhwc
 eOhK+AV3HwOnpNRxr++NeFLGXoS438E5XKqBfO6kqHq2w2aK+JmymUsLw2vcFtu1lblR
 28cIchkTe2u+XrjxOWGItzNRkBJyKhQIu4uFkdjfBJhcqcFBV+dNfkZe9FKwki0rH/oP
 QYfTAlwePxuhuZfv+iUQQf1rLw4ynu+atl8TBeJypSvLVp1cXI06GRBLnR4NkfDzFkrK
 kImw==
X-Gm-Message-State: APuU4Z8NXOKiJYxLVgAOkETwgdPHx1AJ1Z19KFuFG/pXFyxBfng73M0C
 POjblF11S0YQXhrnAyMVTw4z4c3OxZd7eHpmRqOC6SVUd1Dgrn3zQlwgLBh7Cg==
X-Gm-Gg: AYBFou0LFzdiX+msTxX7hETGuYDIyyGLUT9oBBMV7cEzFPd4zeOFu7BPg+89Yj3rnZd
 DCZMXpBsOd8eXTaYyAL16NWlKJxcZbpR0oT4pV1qcuhVi5jItJqNF/fRRzD0zdlx2lNe+VG42fi
 9KvOy38MsVN179CoSWCMQScnfIj4AAnkOMgJW0XOUreRxtPGxfPWnLSESCht8LAYriOgp5N1/U7
 ttNQ0CnMx8E7zZte9Ma1/OTzl4wMi6l26xrHIWBW2o5ez+rn2ig3r6ngF2bZHxCPssy/YgSDvmH
 T0/Trw578BP1EXILhHlxPXlJ/RkXN+wF58u1fwSqhcSjcRAlj6OMXDRS+F9k2C3EvTD8vXfkj70
 J9pMJdWRfNb4W/L25s2lK9mK0QazCAgVW7m5l6lJDv/iN4DXRW2GLHa8PojX0x2F2LBIm+NU04C
 YEOth3ui1Z/RQyn9I/5fhwzQ0/jMR2GNUgkb+/sra5SNctWL3aH+vBuXCLqj6fHN5U5hu0WT+Ab
 psfomCFS9ElJAFew5uLmTN4fGKaNwdX8qEXpprlvLqdqNg0IG4/sthJEoxwIeIxJSM6ePUBFNXj
 i3rRukpNQYW8Psrtnq1dCi2zsDxJ26R7Zir+M9IYJMgWb55cJ72Fw2iM6t8aFo29KvAl2RSI7Ao
 =
X-Received: by 2002:a05:6000:4616:b0:48e:6c3c:c836 with SMTP id
 ffacd0b85a97d-48fbd1f7766mr8761621f8f.38.1793826032643; 
 Wed, 04 Nov 2026 13:00:32 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:32 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:18 +0100
Message-Id: <20261104210019.3509258-8-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/8] website: escape the bare ampersands
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The news and LTS pages use bare ampersands, in text and in the mailto
links of the LTS sponsorship buttons, which is not valid HTML.

Escape them as &amp;. The links are unchanged, as the browser decodes
the attribute values.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/lts.html  | 8 ++++----
 docs/website/news.html | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 4308a37a4d..3b58cbff0f 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -38,7 +38,7 @@
         <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">2</span>
         <div>
             <h3 class="h4 text-body-secondary">
-                Vulnerability tracking & reporting
+                Vulnerability tracking &amp; reporting
             </h3>
             <p class="mb-0">
             Tracking of the vulnerabilities affecting Buildroot
@@ -264,7 +264,7 @@
               </td>
             </tr>
             <tr>
-              <th scope="row">Analysis & commit annotation</th>
+              <th scope="row">Analysis &amp; commit annotation</th>
               <td>
                 <div class="row g-0">
                   <div class="col-6 px-1"><span class="badge text-bg-primary d-block text-truncate">&nbsp;</span></div>
@@ -401,12 +401,12 @@
     <div class="card-body">
     <p>
     Interested ? Contact us at
-    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">buildroot-lts@buildroot.org</a>
+    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&amp;body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">buildroot-lts@buildroot.org</a>
     to learn more about the different sponsorship tiers and get all the
     details about the sponsorship.
     </p>
     <div class="text-center">
-      <a class="btn btn-success btn-lg" href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">
+      <a class="btn btn-success btn-lg" href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&amp;body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">
         <span class="bi bi-envelope-fill"></span>&nbsp; Contact us</a>
     </div>
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index d7e680e41a..be4d550505 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9787,7 +9787,7 @@
       <div class="timeline-body">
 	<p>The slides from
 	  the <a href="http://fosdem.org/2010/schedule/events/emb_cross_build">Cross
-	    Build Systems: Present & Future</a> session
+	    Build Systems: Present &amp; Future</a> session
 	  at <a href="http://fosdem.org/2010">FOSDEM</a> are
 	  now <a href="http://send-patches.org/news/20100211-1-FOSDEM-Crossdev-Workshop.pdf">online</a>.
       </div>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
