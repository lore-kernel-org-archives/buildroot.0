Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E017606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 22:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I+QoGKfY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dyoJpBpd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E700180F92;
	Tue, 20 Oct 2026 22:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohzXNrXUNbms; Tue, 20 Oct 2026 22:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D431780F50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792536424;
	b=FZXuWtGafTgjkKoUpAf2a3gqTT7IQuNS5IBqEYyvVeY+7hxVNxJPsZBYleEdXugMrule
	 4nCiBW9j51Kn6dcftK5b/gMe0DoLJRKRIL6RBvGqpR/oKsg8xmfVwfUfY/hAAiboez9Yw
	 +dg9a4hj8xtX+4OSXClsmrJ1C69VEFYN+lA19rfkwVbxJJflYb+2xrkeEFwJ0ayR4Zbj2
	 VsOQhlh9cF+/JQWhoet8bsfW9fHEpoD58QUrQoSajOGvVaGXa4HwYitrvm/8z8hff3hFP
	 pEaPfouXV8wM+JnDUZckuHU5vs+S45ZwBVQ8Y11aAq9GTDwAz3RaYdQdMZHydR110sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792536424;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=INXjBGJyfoKVQ7uztrxmSPg29Zflry1mn5oi7QtX3Eg=;
	b=UXbnsJ0logLEweVlnBqgGD1YvVZK+iWczh1rrHfgJsYc3CtjSInrDz61qyO8m9+rvWqw
	 gqIjPTGeh6w+Z6ZbMjuG6oycKmFHPRGMc8bTFC5X+bC2gjijlmc3RCtpHNz4EIU5Xp6gV
	 r54hBcRNr37EeRbkWLb+YxISofaZphlD5NDGWgnxsx5aS7P4snj9Bs34OaiYFZ+gQg5Fi
	 LnCgLY0Dz488AnwSRYzlbEoDIZJkFb2x/irunJd5X+tM/YwSL2dUBB79As/1zpJRjyAzb
	 +HL6y5AHNtS/NSD3O+7zPgyr/qorh2/9RZuSRJkBpljSem0iZdyWiTUp9oTWz8PCGZw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792536423;
	bh=INXjBGJyfoKVQ7uztrxmSPg29Zflry1mn5oi7QtX3Eg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I+QoGKfYYTJQbohosO2DJoP8bUaM9PgGToqxTXWyQevEpzv1NsDbiXjMb9bmPJeho
	 EEb3bh83cRUz7ycusY0hTpCaTzp/kaV5Z0F4UIsVjved3k0VVDzeXr2oViIn70ZGIv
	 CcOgSeANwrCu5xKEZqC/KrZBS+r7OjAjkUoTET82QGorndu2f/9+Z6Bs3qGBEXBk2+
	 c+x9cF56UD3CF+gdmlJTIh6mHu7H0mvMDefIoRYZsXgoz6Z60T3mDpKbVSXug1XubO
	 Cgi5tFGYN+qP8Gi/vNtTE7fwPrCP1MaWAXWJWQVKZ6Q+rzNM2p3ajil+eRxS2UbEUn
	 kEnQtGUtnPumQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D431780F50;
	Tue, 20 Oct 2026 22:47:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 148FA1AB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 062C860728
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qIaPmv_viXB for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 22:47:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A037C6071C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792536420;
 b=LIjWpVv4E51Dg9hnOiqTJvXdu3hqvlwDZWUFXXfxk7TyehPTrEx0NhIhJ53hb3A2eFgZ
 xR4V0VBaC2MfR29uQSDh8e0hjEr9bKP/A1DkH0DXkLxaEGsedUgM1xFmH/hvT9UZk7gIg
 E2xz5KONpR/aY0s2T47dT4WFFNGNLIdmbNOW+SjAW3ou2d28BIzNsF86upr0WfMmeal31
 VyfwfCOSjvE/rH5csTYpuVLYDhclV6t3mt0acKu2eyhwTrNcOwRLbrhgPTnDCOQtEdLWl
 HhIT3OsAaQH8t9VljTdw30FJjtlfg5+kfiYEF/y555zuF+oUrkKdSNh0qqouSPE4eXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792536420;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=O9Jn5jMVS2eCaptOgc3FpuQhGOTDxWA0i2Kt1YHCGG0=;
 b=eMU7SRp4xbuqZXInmzeoESub+2Jk8FWKtOSoZ3jI7ytGCo5BntDcehostzPP3UF869bT
 iq/U0AgckyNqEw0Rt3TDpLoYK/Y07tg7j2UueB/mVThX8phbHA+abpAXKY0zuKc83WDqm
 SPY6WgiB3JkD0ILtGrbGC8M5jLlpg3FH592p3drV0py3291Tp3fzKpgaZHQySXlGukGNh
 Gu9yOb1FEMjR4da6sftUBLB9mZSDi+hcNaBWAOLmA8fD2Kmx0skzhGBc7wkAN8f+uG7DH
 cZtvmyIiWGHlsKV5l1Z4BoDgS0r98LeItQ3fikZ4+Plfkq1swXfrLVMgS3vM6VEKAzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dyoJpBpd; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dyoJpBpd
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A037C6071C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:47:00 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-6b8e2d8df4fso41060eaf.1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792536419; x=1793141219; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=O9Jn5jMVS2eCaptOgc3FpuQhGOTDxWA0i2Kt1YHCGG0=;
 b=dyoJpBpdypSZOwXFppBimTR7wKGRrqQba8MfZYqDpCyq1JQF7yN6AWvqeNQ/WTgoMp
 RP8WgqRdIBa4dXBSmTPjxdhatOde5P+CpQ4Fl32aak1Nw6DR/0nV5Xp2h2U6aOcqFvmy
 JQ4dymYBHUUkfbQW1p1TkKoRKG5apzHHwFb8xl0kgst7Nq7Qk4x2JOW7z/6LF944Mp2P
 BcbNd4KuxrvM4BEN/zmXcxmNBmWC4eKSqs+luPQP0EP6+Uu7BkQiqP9JVg628BK8dcXp
 RshwZudzmlmKNgYkjNfgmfyEao0h8+G1qtTc9MaeCcn8zCqsDuuJ3s+Li0cPpV+FD0yN
 13hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792536419; x=1793141219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O9Jn5jMVS2eCaptOgc3FpuQhGOTDxWA0i2Kt1YHCGG0=;
 b=1W/qT77NFAX2lBCGtOUTLyCU8XTd9yGvflp2Falpde/5j4yAhrRV9PpfBdGuIstJRX
 Miw+Wpr3hi1qLqiixl7sBCsEt9s0t7iAo6Fg8vibMCXbPdaVfJ56fiI549aPAryr7geq
 BYNc2raWUQILPa1eEfbJ17jxnbLvJU887VYoqtrTYvVql6/I3uyPgS3erxqFiWAiTfAo
 etSAX9UZAQil85tFjU1+VZ376Q9fthoNON0TgA5zTUsBjSU+lzUICPAdeXDQY5X8o5Z8
 BrYmIhumdHux5eCUWW6duJxmLrsrMBqfOQV5v74Q4RNcvHYWZGfrNi/tyOTxog1hLGG9
 mgjA==
X-Gm-Message-State: AFq9FYKEGRmPoNJaqJQuNqvzVGBovgBWLC/qx/2cbQ5PRUPT+iQksSxH
 O9Gw153QfCE6mxa51zvB7G+Ks9XxBUEYQIgO0C8GzZioLR5PVH+Q3ankMnx5Ag==
X-Gm-Gg: AYBFou0MUJVXLvFp5DzYxgPdg5HPQe/qH2ZS3CR6YDxSkcQmKabrEqXaxO7dmwWvWzP
 phEMMxcNNMJWY59p9VZAhW0ICXxOmD2DwEbDG4AwLxWnFRbGjsptiYcCs/1BPL/GAaxX8677XKi
 LSU9/toGGX2CUcaufeVWZZoRV87nwDsK/YPOjvwp1Ahw2MiujE2TPhmjbPMQlxFEHDk7EXz26iD
 MI4ajlNCpomrleMKpTAN9tItHJuIN929pHrxwAxZp3s2HF09AfzxhvYUeSyyZp2jSINJpQkubpC
 kc9n60ezD+lKfXGb9vlJ2KfeepHAj/wQ+weViIpM9icrmGKd2E+rbJwnwWT6jhL9VdTSGnIldcu
 M96yClVrMBdccmAMDl6ivEUmo36WjHFh73jNqS/sNGgRNx/P1K+T1bWiOjVbOmaupdSp62cN0Fv
 CdooR5YqwrFG7WDkZxa68eAa+6WA1fma3+xZkVosYCBaEHqtpCO6d8QE6xuZpcJAF/U/ShVhgq0
 jKGEL9lgJbnqIYJBTMmRn7JRqJKB1K+oxtMkir5m17YHYeSh4qMyn1whMYNarIXtuu1S2CPpAZq
 a+/qHhhHCdVmLYjgz17xqXhNyov8MktQkhgdEyy9Qx4QUXeJPm0BexO2fy7pQuJVaTU2zgPnRl9
 WwR2F+S4NQZkRJuh081kLQL2ua6GqqkRzShymxjVPvQ==
X-Received: by 2002:a4a:ee14:0:b0:6da:453d:7cd4 with SMTP id
 006d021491bc7-7093fbba3d0mr198204eaf.23.1792536419050; 
 Tue, 20 Oct 2026 15:46:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-84cbc7d991esm717024a34.5.2026.10.20.15.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 15:46:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Oct 2026 16:46:56 -0600
Message-ID: <20261020224656.1714095-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2026.10.2
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index 89110ffe3f..b963d57aec 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c3619a29cc529a5bc43ba99e1b298483ac0b8d8c412f69575c089a6bd4a7867d  cloudflared-2026.6.1-go2.tar.gz
+sha256  8e1f95a4e4b11cf545dccafbc49c1b251b3b4625b1986ab8384203d6738c9cc5  cloudflared-2026.10.2-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 44ddc82226..5003515ab4 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2026.6.1
+CLOUDFLARED_VERSION = 2026.10.2
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
