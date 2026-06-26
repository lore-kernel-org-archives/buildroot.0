Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC30C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BA68238D;
	Fri, 26 Jun 2026 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mq9htjjOzs95; Fri, 26 Jun 2026 14:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 670E9822E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485764;
	bh=79gef77D4gCvEvsVeWKxMIp02yEyOsVjGGss9VTBLC8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qykg7bhdtHVJSCg/jS5Vd3htZeVKhUqti6g/KRocBS4OwSa4gORt6gyZgB5Q5r9ey
	 voIP7ajsUALwCTDDwpXFlIGj9r9VVJPjQdgskbnn6YloIRkEZRQdenE/tEv4ulqner
	 Yy1unlPL2SoFDpT/0dzogOGpZyak35ACEfrZCT13M9IMrvE6RR5ArvGWN3r/e8Pb40
	 YnOJFJA/IdRd3B92hmGpwUP0MCT8VBk8ox6UE1NHymQwKIMs6djmxqmITRhDpU/02A
	 Y6LaihofjYSMN4j0Nrxw1AxBLKDdPTphBxC0FH6UgaopfZaWi7cl4oxZbF0Sdq6nIr
	 skRc0zVXJUP6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670E9822E5;
	Fri, 26 Jun 2026 14:56:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93721231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D3481314
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqPiWXa2uIQy for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B50482355
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B50482355
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B50482355
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:00 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4629051c9d1so572116f8f.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485758; x=1783090558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ippL4EhbCp3EK+X3iGkJ1zID3TCIc7jyt/TR4bbMIYc=;
 b=tRhw+AbAqp94rc5MnasjFpwHRi4t3YzH4ENQ43OyZBPgmcpunN/xRD+yYDGl97X+v5
 ASuii3zRKM7RmXyRTc+ScSZ3GNbta81MH50EBMVtQ+zOaBpJ98OTSZt6LLZA3E0f69pj
 HLUKqp4BnW2p2C7VdSH6ebWF6sjCjjCb0J/lyjbLcX9hMcW6qL5Y0aBMMQk2lG/YkBqj
 G8aCl/AuTjKv6fCBiJI9AvfLtnHh/5fX1Wf589HTnaCofAIrZ7s2H7r0zIMPQj8M460G
 1/Unz//0iBbWXAggPaCosYKaCscKmMtJRAEHTlRTJogESTG0L0zBe/b1cAQc1vhAk9ZR
 BxQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/FqGxI/xODryVxdmUwNCpBHaa3+0qimGGLgBNBQ6nCwfiWH+AEdkVqGDkkGvTi8bFdJhp3OT/hCyQ=@buildroot.org
X-Gm-Message-State: AOJu0Ywpmzdh/ClyJhaQlP39jAiVi7fCQCMY0Gx4etsutwi4E8bo+tCA
 K40xn0sXugjno1O9kQCMYq4mlY3vde80/koBaqU7xS9lOg1ODcRzwjTlnF7jzdFvrqA=
X-Gm-Gg: AfdE7clei49RhDLk2lae720UqDSyGaCENQ0O+5be3JS6e9LLfSo5/qr1cmLz4yM5I24
 QDZEwabuMHUcztGisPxMmTqad8TYSV7e9ixou3ca2MSRZiyEujfrWw3FiYcassBjsfHSUpdxLPG
 ytSHdv4ciFVIn6loGRoDKLwX6kICbPMpXG+QOuMlWAgWTL8iMRd4cafWkqAlbEVVoN8OCevo/LT
 Md6MkBiiBTwBZw/2A+K3CkJhlu5lAP1vFCBuTa2j64Lc/iQN5a5x57OaDUhepwcYdsaGGl2Q7XY
 UtTEhoU7zBugMPfMt4jyRHDHuSt3IE4eFgWCbaGYs5gI7ZV4uXGNCxbt6/iB8KIy1UyEzTN8rVN
 gJxVzMWrLmQCcGG5Z4Wwp4C3ZZVXJFlzqdV7RGSGLsRNyyUshwsKuxs4dtL7gM/1kA37pDmcYru
 HuHvyS
X-Received: by 2002:a05:600c:8518:b0:492:62d8:2da8 with SMTP id
 5b1f17b1804b1-49266884adfmr110460705e9.29.1782485758163; 
 Fri, 26 Jun 2026 07:55:58 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46e95f3d71fsm9172686f8f.12.2026.06.26.07.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:57 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:57 +0200
Message-ID: <20260626145557.343377-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606182032.3803327-2-fiona.klute@gmx.de>
References: <20260606182032.3803327-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485758; x=1783090558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ippL4EhbCp3EK+X3iGkJ1zID3TCIc7jyt/TR4bbMIYc=;
 b=gjx7Qt2TahG7BniA4DWcIp7O1QGayGLA7oEaPaWz2x/c42h91ce/YZGBvwIxHuMnnu
 DCyMM/7i3lqRtJQfFc+JNKR7jPURf3eyHIQ/1LDMNBtxF6oilwIkR7vWQPQTL4SGJv2x
 K0c0mzN3y7FbFD57q1PgOBABU8ExO/niGg+J6amzRTxFKwDYgvpv2r9n1yiC4ykTmQMF
 kXTC6O4drzfTamwI44DUJZknqG12VEaykO5qmU/cryQfo/naTWwB1C4to+IB3Wb1Qers
 YjgSZM+Vq4i3ikXG1Rn6Fy3QKeOFZt671i9po5AnCPduGQUAlWlo+3dfgBKNjmkEMR5m
 7+kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gjx7Qt2T
Subject: Re: [Buildroot] [PATCH 1/4] package/mpd/S95mpd: avoid unnecessary
 exit
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The exit status of the last command automatically becomes the exit
> status of the script. And if there is no explicit exit shellcheck
> accepts unused functions (here: start/stop/... called via variable).
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/mpd/S95mpd | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
> index ac971e04a2..e33654a501 100644
> --- a/package/mpd/S95mpd
> +++ b/package/mpd/S95mpd
> @@ -2,7 +2,6 @@
>  #
>  # S95mpd	Starts Music Player daemon.
>  #
> -# shellcheck disable=SC2317 # functions are called via variable
>  
>  DAEMON="mpd"
>  PIDFILE="/var/run/$DAEMON.pid"
> @@ -57,5 +56,3 @@ case "$1" in
>  		echo "Usage: $0 {start|stop|reload|restart}"
>  		exit 1
>  esac
> -
> -exit $?
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
