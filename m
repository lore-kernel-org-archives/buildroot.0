Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82908606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mgBNU7aq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYi0/72R
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BD8B608EB;
	Fri,  6 Nov 2026 19:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgCbz8a6A_pC; Fri,  6 Nov 2026 19:16:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76432608FB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992582;
	b=WaJblmToDNIcg6t8Eg7dI/+UreTz9izeqiJCb97QSRIFrEUJWp28x6p8TRArwtxKvG53
	 Z0GM2wiNCkAuuolO40dVd8mvdCcA8o2XwIGd1EEFTT8fK1mTlJn9pozbIno1EcD0e0zTy
	 amzjQOX9gui6jj96RtsdFukI2nCEvzkw2ye99ug/4+Ly2T60rxB1ss7hS3vRsb+XwbORA
	 rPMP1byPxWXiZBlUbBsJp4aBknNZaJ+EiPlTR+Pt5gkBAF3LTj/CO0k+bj8Xqi1ktyl17
	 3qKqHs3k5YgZ0Em+tV9tH1iI40JjQtUGkhJ6oSDS+BRR8WjDJgw9GadzRfMYbmXaxTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992582;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xmXPcs2VAxym3HdemvJfOBz2BpHOo+lAd/sWcHcUgRI=;
	b=UB5FtryD+A5kr2ltzGSmqE2tI9Qxdmp3xPSKNC87IfWaT8ZPTXcf0os75mzgsgz6ZZ6r
	 Pb7CkOQs21RfZDrGOHrc0duflAxqGh0g1F/QMCA7X9Y5yDng/zhYub0jiTMD+o3wu4yh6
	 +5mIy4tVu8rv/bC3YLLmUaZFZKmR42581nho5/wQEvmNx82EnUuBbqUgBrguWkOgQheXu
	 3U1BqCNZP1VWhFOo6q3lq3yospqA7p3PDNw2RF6OefHBttbtaNmxBFgCpXf7ug+h2Vhe2
	 I7YFSDd8VH04+8Gtm36kcex8l9jG/o1pMhO/G4LL6+od+Oz4O19RetD7e1x79hAVZ4A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jYi0/72R";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992582;
	bh=xmXPcs2VAxym3HdemvJfOBz2BpHOo+lAd/sWcHcUgRI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mgBNU7aqhy8GqgVBlfv2x0tY4CaB871pSm97/5552RQCyauKbnY9IYpb20+v0u2dv
	 kA0wzJQupXmhcL5EqHOjylzbVddqQ90Ke+Cl3sBcpBtH0hDjDR0NLR98v8/AUuitwo
	 bPGqB4e3k2jBan75i6O/h9e+xUUG0hI1IYD1Kv0Yu1oxWeHcZeKaZJMN9YcMDKojCl
	 8ABvHLF1+/vVkQTFhuhaAhrZvrt4tjjOKb09E2Q7f8ZQVRuiVG/K8z/0kJishSILFw
	 Jnj7KM0makSnQZfkTRcRtYl9jXv6ruk+Nhg95UmVxv25tUk+ily5/jz9jRlgQeH7Iv
	 HzbtPEt5lNBKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76432608FB;
	Fri,  6 Nov 2026 19:16:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93E034B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F9A608E3
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwqv2zGvG0Bl for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A104760A44
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=jYi0/72R
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A104760A44
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:16 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-843a4ca671eso453824a34.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992575; x=1794597375; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QeCg+05yaRksDnPqLW0reSjL1nOZPrnbXMtsY8TnLbA=;
 b=jYi0/72R0KNMYPuxVWxOUwHw2bn50r28r7p169gPXi9yGNY95hqmG3O2uj+3/NwGSm
 6+zBIszGamE9GKSejdgqM5vcI0KWUOM+OjOZJNWKJSuCJntgMFGsUEaqD2v7jiiNbF74
 qVT269PkSrxFUw01NbiONw3hOJlHxmNwIxhMaBsJE07G/bqoQGu/Nv6zmudTCkJb6rq+
 vp95U5asmOEFy7IpVNCyWHn1ZIP74KQ4Zx1Nj5QmqLI/ZFhbjPgpIxLUlTeZB5cDfctv
 rFpEAdasI9n94MPKo35h6fbZLOIuVbfGI4CCtII0X1MTJAVTcA5PqpdvcVjN1dFiEb29
 +rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992575; x=1794597375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QeCg+05yaRksDnPqLW0reSjL1nOZPrnbXMtsY8TnLbA=;
 b=FADRtGWl1ql2wNn3i9k2tkdFj2xyeQS+rkSxsFX3BSzYXuynGxskXVB9ogfyFwOwpy
 yGuCSnpADiaRHTRnWlTBDWdLSL6AVt+nbLidSy7LcW1qz0nk7AqqxtlajX2lRrex/Iv0
 Iqhw3jstpj7a2Y8aOyC3EClFxc9/jw7RDYYqsfwLvVA8k5Ot7FSnPSPo9Akp3PInIIg/
 MHvWqdDfTPl9k3uDTmYxHllvldpcfoDi1UObsq4ofsOJ9T5v3yzjS5hsiU+sOfks/N1h
 GeaKsVr6dS7E25fXdNXfQHKRf0jhZL4tERjTW6yIcghnY0Z+XnAa/2kCZsgdLA8Jiv01
 hucg==
X-Gm-Message-State: APuU4Z8gDEzEiqs7QlX7+nAqnZOOmrcUBD1sxY7AGdPb1ChgL7aruZNd
 Z4Zp3xUxtTXcShgaqWQV5SKipR+d8RjVOYRL6Phy/KSjAGHbn+PVl6oQDc8K0w==
X-Gm-Gg: AYBFou1DDibZIKFKEWTdI1+frfEJHHwlDTblCWfF2hBS+E8tZQJ6cZ6XFB1zRzFa1js
 Q8LB/8VC1lVfhc9AgW4o1onYRq/st8mE5LrNUXKBlob4XEzOLBP+svFeYGL328q/OQLpzzfRnTu
 xH9Pf5ZwNXJ8/RZYc1sSDGhWzRT7h6jrjPtKRSYBCcUmnK5g4MoS1qDLAWwtXNkfmjnDxEMq9EI
 A37logLBhP+7NFxg+XFOa0juk4Hk2F6bkpqmRcok8KcNw+HfWjmj6YjRjSTRxQx4W0EOhv4xVGK
 dh1ZI8ovCu1z67Kf7mR47xnsGBwAvYSFE1D9zy3ynMH6PTYRt4XYFL2vIm0xA+OrClMqansj9UI
 +hOAhR6WiKNeZpqF/yTSc2wzIfLKauGiQQzfLqnxcAoWcWVAb5JOAiakTmByLaM+vx5zqdK2jgr
 fx7qLi7Xx07Jjr89RrmA81ntwkswVab6nSSBa6nFjqO4B/TDvL6sHu3wv3wtQoa9zDPiLfrCAHE
 E2zZJi/vrINNqUZX0f2QYwE+r8iTAA08+aBOoNhKGSA3CpICToL04gSnZkaD9rLg4zd6+ZgKqsL
 TbKAsz9VoxcgSquHzdgz3xVhQDXEXbrTIHDe0Bzu9S+Wo401cK9deBNyXPFFAwY4+jUwTYGAEKX
 kIYGezlb2eCA23OL4z2JMAD2Afl0IjA/SMTDyLRdotw2akqO8GeYmnbNeGY07ekEJ74+v5PvO3g
 0aDGZJMe8A5Nt3p0yu3QCsls5L3Vyuys/MXwft+bkMN7BYzjKCo1toso31mJ1uoWV/EqufxcBvF
 g==
X-Received: by 2002:a05:6830:927:b0:822:527e:f653 with SMTP id
 46e09a7af769-85f1cf54f12mr4327025a34.13.1793992575551; 
 Fri, 06 Nov 2026 11:16:15 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:44 -0700
Message-ID: <20261106191536.2120153-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-paho-mqtt: bump to version 2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Davide Viti <zinosat@gmail.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-paho-mqtt/python-paho-mqtt.hash | 2 +-
 package/python-paho-mqtt/python-paho-mqtt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index 5fe91c5c54..d3c369f2df 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  3602ce9d1ada58b063f2052ff013ff8cdd06d66cef918d5f6d048b6f68ccf049  python-paho-mqtt-2.1.0.tar.gz
+sha256  2e45676494172611c9ed55dd015577f02beb6c013798d93ea93907683edaf51b  python-paho-mqtt-2.2.0.tar.gz
 sha256  66408b049249c3bdb0ba1ed285f5422ce67e371d40151bebd4d806af454ffe7c  LICENSE.txt
 sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
 sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index 5e1d2fe32d..8857517ea2 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 2.1.0
+PYTHON_PAHO_MQTT_VERSION = 2.2.0
 PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
 # LICENSE.txt, EDLv1.0 is a BSD-3-Clause license
 PYTHON_PAHO_MQTT_LICENSE = EPL-2.0 or BSD-3-Clause
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
