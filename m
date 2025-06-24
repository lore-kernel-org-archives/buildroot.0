Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BB7C77B7C
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 10:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A076682086;
	Tue, 24 Jun 2025 10:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2He16PkWDCAZ; Tue, 24 Jun 2025 10:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E46C882087
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E46C882087;
	Tue, 24 Jun 2025 10:57:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8CDF12C
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 10:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A5E782087
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 10:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bf0LoR16yC62 for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 10:57:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00C6482086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C6482086
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00C6482086
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 10:57:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so59052466b.0
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 03:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750762636; x=1751367436;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PHLM4ehf2xVXlRZTAcPnhOsTKsmzo2OO+eovTBIpJDQ=;
 b=R0FxO+IgbzIxSK2Rl4GQ820tTBrbFWMMHTccIrNmV7UZ9y9osoWMLp6UMUqb3pwNN5
 1faxmpuRNqOvqAFV39uyGX+m6JokdhVnGtWDjFj1z3muOOOH+R4edlxnOAoP3O5GBp12
 9wO3cZeLfhKp3d+YNIIw728WveYw85y44WLmbuEJqQPqmWgu0uSoVGlNllY3AkMdH9Fo
 GdwvDVAM9fz/12eLcBQb7b9MZJb/LSmO1ZWgzRQBKOpoSRvhq5JBwzmRKvHAKs1rHOyO
 BL3Qf/AGDhxWxz42llhNweIQw/DMbcOmmmb0T7wqbqTznALA2K38agd0dxwk4i1Rr9+H
 vuGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+5+LPXpDOPwNev5gVEaakta0DjgcNBwh6QqvxW6VYMF94jKa6taCzNit5BbNY1YsucD8lvB0eOwQ=@buildroot.org
X-Gm-Message-State: AOJu0Ywe7vjRGjCG1JvzHHJPUjzoFr4pH5yDUSXS7z0g//RukqsyQFrD
 J+XthwjXreNiD5UewijzY8eNNeDXS/8HVrOPLi+i2emztrZcxAUDfAPiM20j6g==
X-Gm-Gg: ASbGncvGUsPgph2oX32U9rrjwSNA3q2UFsFV+vqgzUJSr91fAwe/t8FyJP5oRK2/kyO
 MhnSGLTJ+61rDAGRsU+DhmQJwknr6hmYWt288GMXWRYxDmSfQHiKVmdavEQ8Kwc9uXKRsqjEzVl
 b6UUJ2Z+PXIhrWjBIeAQ7U8XC2gTGHsCr0RTDleMS0zGj2QxYqwcyXsCTnZgewMFOcXWcSq80qI
 +gkHkC16psYcWjAepjGX0WPhWLSkEcVRD99JBCeX3jOnex72oNOgjsncZAT0abNWrDsFv+uSMup
 7R30mCSeZVMIWg6i+MBJ7rnyeMwuMhh6fWUV+sJpvafoCb/StrqU5Ibg9lcMfjzHsVN6lgKb2e2
 nWAEhzdr2u08//es5R5kHFujQ63SUGMHByyU=
X-Google-Smtp-Source: AGHT+IEdqIRq4T//DrlFfq9a9tZc8hFnMu53qaXmeq616aB+iycPo6wY9+KSe1nzEIF8hvZfn9dHvA==
X-Received: by 2002:a17:907:1c8d:b0:ad8:8ac5:c75e with SMTP id
 a640c23a62f3a-ae057c709dcmr1440691966b.60.1750762635703; 
 Tue, 24 Jun 2025 03:57:15 -0700 (PDT)
Received: from [172.31.21.208] (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ecbd9esm858992066b.38.2025.06.24.03.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 03:57:15 -0700 (PDT)
Message-ID: <8e616b1150dcf8d40ceca68a20704d517ed8cc51.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com
In-Reply-To: <20250624051736.2859733-1-maxime.chevallier@bootlin.com>
References: <20250624051736.2859733-1-maxime.chevallier@bootlin.com>
Organization: wires.se
Date: Tue, 24 Jun 2025 12:57:14 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750762636; x=1751367436; darn=buildroot.org;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHLM4ehf2xVXlRZTAcPnhOsTKsmzo2OO+eovTBIpJDQ=;
 b=UeyKyed8k7eOrKhHkqLgO0dEMgAnfmG87NJ8IDsay6dGiOmqxscEWxPDJX4yx7opI0
 M4Mj1S4BLTNoXM+1hIEKeWfFos7TuHk8Tl+JJDBOLmSwe5g6tKAYPfdk1uMxjfUIVCrx
 gONBrvbPg9rT2XELMjIqD5fKacpnwrw7t0xCfLLkyUZPVEfMTBgVMIYRojGfNhIGEpUm
 l2Ft0iCpNz+5OaZt5iQiOVBXe1WIfsuSsnG19NlRNh4sdLYEv85jksqv5kbYHG210GxS
 gIlv95mjIZD97GxoWs5n1LCid7yJ4O1hQJ5HTlFuH4YuPAxhb/ID+5lEAeIR1ca4NNs9
 IXSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UeyKyed8
Subject: Re: [Buildroot] [PATCH] board/espressobin: Bump linux to v6.12.34
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 2025-06-24 at 07:17 +0200, Maxime Chevallier wrote:
> Bump from v5.15.1 to the latest LTS, v6.12.34.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
