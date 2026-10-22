Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3EF606A338
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 16:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PW9h39on;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kA78fGoK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E38A8606E3;
	Thu, 22 Oct 2026 16:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCUZ1MBuqt4X; Thu, 22 Oct 2026 16:42:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EFDAA606A5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792687350;
	b=FYhPlPD1UsU4gj+FG7Zr62NknSz51mO0iCNGBFUSXadv7aE5KholqW512PuEMXiZZ39d
	 QGmSMeM2VubvbcH/JGWXhU2gW8DZ8rDcr7nv2o2SKEMrYzPccK7/y+i1dp7wq5H4qlTRr
	 goXM55q8G1gkSRBHTDl1m2ZnpLxboFzHsq6x3jPBdbZI+6H6eMND9lThxgvT6Z7n3P0d3
	 Fdle305j1nsQHMv9ttz4UaVKO5biFBjJE/nxasXnaDjrj6sih8m5xs21PUtMGUdgOtJPP
	 5PWw5rhfbFfz3VKqE9V26dN5KwddiLRUg9m19Lfx0+Vk1oULWsO6v6bAkJ7MTW5mV6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792687350;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KHKU9+GGw4t+c6AhrWbiZvYEND0dtjtK/s9olHuTcJ8=;
	b=XYrAWq6tgjYciE0ca2Lnw/ZeEEVQ7sCYEOpPp/1+u0S8miTuh663flHduHREX0e5UkOZ
	 uuSmIyVjrKnBRPb/5TUDZzVFRTstehrE4kQHIDoHJTiwyxm2ZSg7VtNs7X7wcV8Dn3w7N
	 uOOVtCtEKyPYbadow9sPDIKqQrH0o3X4SeIZrSqqixjZ2g8Ie/WtvTkqqIcqqwS8pH3Pt
	 JL4Mv+/dWOSZ+w0MXMZZrdBCTZ1mMEXR1iHW/L+M89rWQ66OZYycNoLK5h16VMZ/KJHdv
	 JgXHZRmhcwQEw4N9ESLwp2PlvoeZGlimijJ8tKsuZd8PzYrp5kEa82mXI2F8MbQG3Kg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792687350;
	bh=KHKU9+GGw4t+c6AhrWbiZvYEND0dtjtK/s9olHuTcJ8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PW9h39onSy/TghEBJWRJhR4hhMJW+nM2L4D2yCRzYf+4iUvGqvn6y+hTHhTKUZWyR
	 AFp/0Y0iMs+LTDvfeoG4Nx4Igb91rhayxXdruqainIt7JQDnLV0YX3TBEtnbOgOed3
	 6pYN2JYhJOxLylwx+smlKEuCAUASld4CpPJD5b0cDeFDDY4AXVfj1DC66Ij1PG03Hp
	 X80T5d+ri/ydQ365CBB4EPcAapz929HP0UHEO0PTeNcmOFqi2HNCewPIfCwvGprs28
	 k8L7Iy+rNS459812GEO4SOwHE70TSUIPOYvp04DKCXE1GcPRjfyDJaCIm4L8zS4iA/
	 fzWHDaglH1Z1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDAA606A5;
	Thu, 22 Oct 2026 16:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2905B356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A4DB406E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otY8W5DmiSSn for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 16:42:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0896C406D2
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792687347;
 b=I30OeJsZ0TYVzWgsirjnZ5gL3JnMq9L/rcwsQx4v6MexEGhqz0XXpwK8dda7IvQSO6eM
 7mNUpizGEsFMDyGh9uhih+oe1zEbMD8OMkaUJCPh9yfn2Hc2Igv7/MGEhEFW0ivORMmkL
 hAN261wgPa5w3b4xuC652sy6DKfTa1AygQmUKse4qe3brvqX90YqH4U1le/36Nd4pRhJF
 ywIQAcZh1goxkQjGEuODPNpejDRDfyNus82pRfbEIU8Ty8EDhck1GBkTwsw5cr2cnX5n8
 wHoHIsmetkxfQUsRqxPs0cVDUiptk/b7UzQtzR7IreMPmkVwqFiqTW9dx/lgw9mOpQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792687347;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=iex98bJlz+NDQFni/X8EuTEH6+oPclpJyeC0GBFtUXo=;
 b=i3fpiMws49iBDd35ruc5cPNYlF+BpuqqI/5QKW0jsidAnzK8j2fFb2zsD6bowUHgfzKk
 9h00L3UV9+QLeh8kGd2HIVC1QuDR3kbNXOqk6vACpT/VvMYwbxyXA1fAwwfV4GmH/881f
 kj8QLtQnWE/8arxDRKdNv88kb8v4I2FgeGzKLb7lYFyZqWUboy/dHdT1MdNAp2iP4xDkI
 dCC4MaH9PtigN4nrzQDVr7HhBSD6fRHo3c/T0K05uy/6Gkf6/hi1hfFLQU9JwpxeTEb3g
 JKxaKHHAKu52qgZv0NmLr+KUTsq+0bHAyaPY5LeJ+gaN6Hgk/PoHZu+R3Nz1DENFpXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kA78fGoK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=a.mestdagh3@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=kA78fGoK
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0896C406D2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:42:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so5234355e9.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792687344; x=1793292144; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iex98bJlz+NDQFni/X8EuTEH6+oPclpJyeC0GBFtUXo=;
 b=kA78fGoKtZ5ZMyBKj4nYH0SrCYUREEZWNvFLan6LR3QxUloiSrmHEtxGy/VUagT3AM
 IpeS7IjwqQvyYz9FdQc10RqS+hou2pVq7VepKdie16m0njOYUFfRLfbtGPrp5T4VaF1i
 fMjDOqVEM1qK1OkBDb7q6b/RxYKkMKthqy3AYo5DDv0vaV2O40HelxMqg7CZbNBOyuoj
 XFJPSoVCbQmw0v2BotrZFgst8VpQzkpdA5XQqrYruGV4Fa7vBqWQKHP/ZSOYx2IWHT6l
 W/qVcDQfwqZWWR1ar/igcLipFfM4OZNyH+nsyIbIwP5GfD8GqULB8By/uc9oIVdr6UG/
 nRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792687344; x=1793292144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iex98bJlz+NDQFni/X8EuTEH6+oPclpJyeC0GBFtUXo=;
 b=RDQIH1g0jr03LZdWfGZsO2fbiDs2Yrpm2BXDZOqMBOMVMvZnWJ0GPKYvcqskFGlHvb
 vFxFVCgxA3rUncOuuG4jTQTdm/J7Jf8ZlwSiiDbA1XSq+1Iu2DQY+ahsDSPJ0AWHlP/Y
 IleeAqSKKjrtiol+aCuDxRV1TVNlqPXZtgM6LFM1L2KmDPs9+RyjNynV4ey7p0FOxdM3
 BqAXlhUenGn34ak40f6Xgcrz1pWcASKOsg1OF2xfsfzGRcy3Q4otlCjeYpN9zext7h7q
 PxIn0MVaoRJrQ0HTH75pZpFWI+eUwoA/XsMJ7UtSSYeB6twJ9E8JaVPohHaGjAOjOc24
 roaA==
X-Gm-Message-State: AFq9FYK1uzACK1iDCTKxWZGuYwzUWSCPzPrZMHV7bzCE31IxdxTE8wNS
 2fA3fY7SmtAIYetQeYKZVV7ST97ax3J+T2mbU1aVMd9Hu9UoWe8bNtj6ljgEWxYq
X-Gm-Gg: AYBFou1IEcq+LDix5jdsxaz0o0V3Fo0ORK9Eo/EG7x6wJuxnI94kZDqTR7XkkGVw/49
 uoI31lg1Tb6gZMDNZQykSBRKpVwuHR5d8oCH168ovH0zWqWGZwzXV2s/YmQ4Y3xrS65bdZF2BYE
 DdU0KImIBS4j4OeqpZ8u1EYi1j+doeUbXTzK9guEGzcb3Ke9Jr/gR6pbb9/vHN36zPulJSY989f
 0u2QDeLqSX+7JMcZ/3J9yk7pE9Cc3UcxdHM9jN/GMFI4q43oXBKaBm7vaEKsbN9h/6o0UxWeFEU
 c3i6M1zJREbg0enoQ7gqx7KxeaTwtYW9st23zoB0vWo4FciG5O11XStpi69F+j2kRbRcRwAG8Kb
 z/6+QMf0chmCVPDQyVlaDTdIItvm+fW40e/Aq7Vx9NGHuEq/lgDzGkiN3W6b3u3NOAQ2OTnjg4+
 b98kmrlKX5da9UB3VRZS5hPzOKEidzE85VMo5HZilZxciw9aXY7xdB+OJJLl7SJoeYDEj7GakXJ
 4bDoouq4qN/w6cHtYt3/OrnQDlizoShv31JCmO+mGJHh3ANFfBUWRYlTDrG4R6gf1ZG1Oi7Zz8r
 vveeNYe4SQ2XMlnovhgkmPs0yIgGZMluGAs2E97rpak1If6o+o2paaAKsholOUkmz4vIX2rW89j
 mZf9cYUGCrSRorID/cklpKJYHQ2cstA==
X-Received: by 2002:a05:600c:1385:b0:4a0:34a:588c with SMTP id
 5b1f17b1804b1-4a204baec93mr61398105e9.14.1792687344197; 
 Thu, 22 Oct 2026 09:42:24 -0700 (PDT)
Received: from DESKTOP-DBJQN72.localdomain
 (255.212-129-109.adsl-dyn.isp.belgacom.be. [109.129.212.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a210327422sm7734295e9.14.2026.10.22.09.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 09:42:23 -0700 (PDT)
From: Aaron Mestdagh <a.mestdagh3@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
	Aaron <aaron.mestdagh@barco.com>
Date: Thu, 22 Oct 2026 18:42:12 +0200
Message-Id: <20261022164212.615-1-a.mestdagh3@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/fluent-bit: bump fluent-bit to 5.1.2
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

From: Aaron <aaron.mestdagh@barco.com>

Upgrade from 4.2.0 to 5.1.2, bringing multi-worker network ingestion
and improved OpenTelemetry processing.

The 5.x releases also add Google Cloud Storage output, Windows Event
Tracing input, NVIDIA GPU metrics, and new metrics processors, alongside
FIPS, TLS, and proxy improvements.

Signed-off-by: Aaron <aaron.mestdagh@barco.com>
---
 ...001-ripser-initialize-temporary-entry.patch | 18 ++++++++++++++++++
 package/fluent-bit/fluent-bit.hash             |  2 +-
 package/fluent-bit/fluent-bit.mk               |  2 +-
 3 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 package/fluent-bit/0001-ripser-initialize-temporary-entry.patch

diff --git a/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch b/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch
new file mode 100644
index 0000000000..c98bce88a9
--- /dev/null
+++ b/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch
@@ -0,0 +1,18 @@
+From: Buildroot package compatibility
+Subject: [PATCH] ripser: initialize temporary diameter entry
+Upstream: https://github.com/Ripser/ripser
+
+GCC 6 does not accept the implicit default construction of
+diameter_entry_t. The temporary is assigned before it is used, so initialize
+it with Ripser's existing invalid-index sentinel.
+
+Upstream-Status: Pending (https://github.com/fluent/fluent-bit/pull/12533)
+
+Signed-off-by: Aaron <aaron.mestdagh@barco.com>
+diff --git a/lib/ripser-1.2.1/ripser.cpp b/lib/ripser-1.2.1/ripser.cpp
+--- a/lib/ripser-1.2.1/ripser.cpp
++++ b/lib/ripser-1.2.1/ripser.cpp
+@@ -185,0 +186,1 @@
++	diameter_entry_t() : std::pair<value_t, entry_t>() {}
+-- 
+2.43.0
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index be02761ed5..7fb94d60b2 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44fe0f52e89a63b213695748f99691d0a6247a4bd05065f1b517c798d9f89bcc  fluent-bit-4.2.0.tar.gz
+sha256  1971d86c7dc0f3e6b906890297635d6a3a84e5e7ad64d36521b74da202fda62f  fluent-bit-5.1.2.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index a3a44b8dbe..b53da90706 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 4.2.0
+FLUENT_BIT_VERSION = 5.1.2
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
