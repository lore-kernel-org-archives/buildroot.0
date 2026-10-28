Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8A0606A322
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 11:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F06180E21;
	Wed, 28 Oct 2026 11:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kk0aSuj57Yy9; Wed, 28 Oct 2026 11:33:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA0E580D7C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793187223;
	b=QUSOwGT5fG/x6Mqcj3Ho+Erq6xqkXY2JcFYHDFR7BRAZ4Z/vKfF85/jhr8he4Y2F4DyT
	 sXNc0d+IpST6cSH4GAcuzhiOndanfIoejGl91GC2WjwxXdwlqrvQZVvhEi/wyK7AgvDYA
	 17kMbdY37tCFe1dl85eIdJxehIMAR5OZus1CUK39YI2mzXDf/YE0mcYFzSWshJIrSDsbu
	 YGlZAFnryEAjXtRSOaV3GMJ8bFHongD0WhWxPRWPKyXuzLrMSPGlQvybQkH02hF2nb8TU
	 QZK0KcbYpCMMir6X4SHBqLmjDY6ob1IEi2lUrXdvyxgLP5GorxYAxxe2iYbQJzhzrMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793187223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=aBAeUfTqVDs7ctpDfwxITs0aX4y/6K6hYm3Lbg29jmY=;
	b=gsE3j+C3/vUkEci3VWSREHi9ilBPXppAm6nq9xtbjJxAxL9VcDr+p77TCY8+SsaKDihz
	 3xxLDPKGSGvVbU4iQG0/1Bcnmk72NxXZnRJuSfdZGQV3nKD3+lUShJPk7fVCHir25KS/m
	 zibwgQ7WepRizxmhfHS/mOxkTumUZ6N3GNwpe3MEKrv+zMkPJM5mha8ofWG3xNRZcfZ9r
	 oVmCvTKTMoLmGpyZ11mo1UQVFRXhUEaeX2H5hp5ACO4UdjPwQnHVusDhxYqp8VpycVvar
	 slclUBr2CoPTWe5/TgfbUU7/hW377daX3p0cj7uq6zutuA0xWS4pj1UlxqLPqRxR/7w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793187223;
	bh=aBAeUfTqVDs7ctpDfwxITs0aX4y/6K6hYm3Lbg29jmY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Pncy13yzVA8iUcnOHlUSCbL84wGXutOa9HqR8QWAcS04WvHePx1qakHuoWiBRu7L3
	 f95N2FBp6s74IhZnxy/3UhtP9QIHjI/wnQm0ek6oHlJ38a8+u+ksagZPeNh7BOeZbB
	 RMp3S7lhBCWkafo+7mFYrlti6F8bMwJeESDMAFm9zLx2lK9nxPmlK3vUtHkbwaE/Ti
	 TGLUEPLYtMHnfs1nWjHH3wWYwLEJzHhL/7VCQem0umCTzln3YvydWzd9wBpvVid2vG
	 m0gyBr+w2D3DqqEo6qKn8t7YxmoIBe0nDVQfORivLbxTah+9SiMhbbPN1dDbKUy2mR
	 I2Q8eLbn+SWLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA0E580D7C;
	Wed, 28 Oct 2026 11:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20AB29C6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 131DD405E8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6MADPqe2zc8 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 11:33:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 237A7405B6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793187218;
 b=RDI1LmgTm62y1dkYk+c+h2TFqRJ/iHlZRuMKqHrJnAJs9bMuCCaM1b0MjFbNmtse94Us
 OC97KPqqWgJEYPexTk6nUJRK+sw5InwlGGjPgO7EqL1VZNb5SRuXB11veNia38EpQ7WkA
 8Od41WVEH2jJwqV24HBAHHUwRTJczDG+Tuov10PNAomPZjff1Ywp8F9D5fCVXamZSva+A
 1Ym8fPUwPtpqcH90oSbVaNaHg1JtWTg8J70gZwiIH+ca+0PK+/eiElp+p+KzZ0eS0gCai
 k+9cCRgXyrL4plT6r7rlNnz2aUQ1W/62U2t5oZMgp7bzMzbyHtE0sGJtt+5u8l/5mdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793187218;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GJmmUTEP0pbkdBtlGWjnm7EG5rxnCumwj41oB49z14A=;
 b=YV8s+5QTUPCGbowjOOPH3y0l6TkPIncPVDNKlCcSDrstn4yB25GuvCzDyPInpxeucXzX
 0nI3KME90LHASK4Fs/51z8QZfjrDHslveQmjuNA3gI9e1fdHN2lFaY5DvQ9FX2X6bpLnO
 VJ+HFPoP1owXuULYkLI5GfQ1Qm1th4D6xwYXP7064HN+zgU/9kcfvqdhvR/jeUlzjSRve
 X540ONjSMyxtEQ4bDqq95iiz6R3WHlDIGMJDXsognBwfoDSDTXjqfjg3AIMyA/oJ3/ZDv
 U8hZlHEE9+Or1oXCCNdizoCm7t4+JIl/sZdcumtPoZFduMTvP/6EcS8DpjHt+9aNWvQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=k+zycLfH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=k+zycLfH
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 237A7405B6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:37 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c41d20c016fso7612066b.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793187215; x=1793792015;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GJmmUTEP0pbkdBtlGWjnm7EG5rxnCumwj41oB49z14A=;
 b=k+zycLfHk327Kw1zB96SJA2CcO9XG86Q3DfwrBaj/LOvclYIHhkhFx6B45tZrEHH3k
 TbqdJXJL74KLLgmAeBzuKs5/EZfM3sg+Q8985FzmCutwOxxIObbMuesSV2/11XH1tXFN
 0IRkaoOTbI36dFEm5OvBbHTbG9ii72vCL0uUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793187215; x=1793792015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GJmmUTEP0pbkdBtlGWjnm7EG5rxnCumwj41oB49z14A=;
 b=lC3HcDo7WQAzuUaT0GglTS7Paai1G4tQ2Q9OgFNinsPRuOt1voZVvfMCsOtvIZ3tqN
 23txe4UFCX6sWMQ0scEubNN6iirQSWVkBRGZE1qHu5zPAmP+Qx1q30LH2Yvtm1t6Tv0R
 UEQ02r/R0A+MQZeAsFCOpcB/G1qETdj5UPY5O9lMsJG8Jw1tMTNF4zRjtN4hwdhh8fhl
 cAVLSqvnDN5AOPOrzSrQd+N2NWAOjnTDNmJTJ6eWdpOqMFaKuoTjjHgafuE7UO00PtUh
 DbYTyVayBKcKl+f2JlwrmGr4SrFcLfsCqxOQE8r1WVaxpWjwvA+8cEtHB8AdZJvOd0Z2
 LCXA==
X-Gm-Message-State: AFq9FYILVUXlAJMm9ZFG0tsg9UhRNPPd/AmKxID0afE4eqDBehJFnoFg
 iPUuOctZskPPa7UcqJ1odJ1uc6WPaM49u89P8Lh4W5CX/ve29orzsXhIzeltw+UQIyoCJkt1Dlv
 ZRx+wmLA=
X-Gm-Gg: AYBFou3+s7Cw5r3aPe0YPdN4vRnSv3JLScpSEXPI0bgrYr+xdSYrYRM/6EFeu18A3P4
 mod7bmH7FNq8UntERd8iuNJYJ/9jCHscKF1zfROcsuv5HgsW9jGMkptSD8LzbJpz5YpwkJ7X904
 BZOmF4Do2r48m9ZkWeLJlSs4QLwTpAjRma9+rt9rIlFNsqmko7WNZLXEip2uOHkd3eu6oRhHGm8
 P8y3BL0wdh73VuIyuDZi7zn1gbo7LzpMC9qChOpW+xATPoSn712BpO0t4zbuyyyZfrHzSAiAtLk
 7R/jryQnd117G1yb+CZ0uiK6B1yyw6KBadAEzCPJ2gBKtQDUVk1+Vt5MsYbY0g3QM9Axv8Rf6kt
 Pvf5elNIL8HKZSbVM4keuLp2Z1cjB3ha6uqEZ/9A4lAlxSK0SVUd2tJq0z0NIRUag9Arpiiq8MJ
 kklU27ilvSIEBnkSTeHHauVp6x9g6/DFHLESYot1rbgaM096dP5xneDAI8oynfqAXZzNnlVubbB
 lNOfrkRUxNzgJ4AohoSE9olfftfu2/8aNJET265LrXF9366a5QJ/oiAPD7k4hfzaA/q1nb/M+lq
 AxXsf5/w4DOT2Bz4oh2q5g6nbS6U7LSG94Prct5s6sNfCdFVqaaBsS7HMiQxD61wYHYYYeYTHKI
 3MrylMaZh/X85PTrOzD6TWpGcpds3YwamB21J7DHBYf1tlMMoGClyrMmExVxW3TiJOoAg1Ew9xA
 apq7OP1Ti0+kZ2fwM9RHz8CUsHUhY0mc5QO0E3
X-Received: by 2002:a17:906:fd0:b0:c40:b180:db3b with SMTP id
 a640c23a62f3a-c49bdf8d67fmr190009166b.3.1793187214935; 
 Wed, 28 Oct 2026 04:33:34 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6f7sm592468866b.63.2026.10.28.04.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 04:33:34 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 12:33:27 +0100
Message-ID: <20261028113331.2960539-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
References: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/6] board/mender/x86_64/readme.txt: fix
 documentation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting with commit 073c81c8cd233fa6e3a7067e3542ef0f56f28621, the
${COMPATIBLE_TYPES} variable is no longer prepended to the artifact
name. Update the documentation accordingly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Added to the series
 board/mender/x86_64/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/mender/x86_64/readme.txt b/board/mender/x86_64/readme.txt
index 01a0254511..01cf4077b7 100644
--- a/board/mender/x86_64/readme.txt
+++ b/board/mender/x86_64/readme.txt
@@ -53,12 +53,12 @@ Optional arguments:
 
 The login prompt will appear in the serial window.
 
-Tested with QEMU 4.1.1 on Fedora 31
+Tested with QEMU 10.2.2 on Fedora 44
 
 Creating a mender-artifact
 ========================
 
-The mender artifact is created in output/images/buildroot-x86_64-1.0.mender
+The mender artifact is created in output/images/1.0.mender
 
 You may wish to change --artifact-name=1.0 to a name that best suits your
 particular needs, as this option changes the mender artifact name.
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
