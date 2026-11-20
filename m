Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E78606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BC0V6U6D
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B3260E4E;
	Fri, 20 Nov 2026 09:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUra-6efGAfF; Fri, 20 Nov 2026 09:59:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 920E860E3E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168777;
	b=iOPC45rzwdcy+xxs665xTmmxesByngyKSAtX4Ua186vEIi1OSgbv9KmUWg3JY/lvqm/H
	 r0NrpAwM5Ex9ROEukwCXy6da9SIDIvGZlKPIcHBKSxze+VxhLag3j0TtYJtpa42hi15V7
	 yNZgPbwJfBhjZRxoZXpPoZJ7dBexohHkhHIdOpyE/s5Hdo/juGjQZckrsl5Szhn675wyR
	 AvNJ9s7mC5u268vYBeAdw0d+lfBwqfvfrFe9GYo6Qh48NAs7uhAHBdw5KG9eCr8EOopRJ
	 4P/QeUXUzcGYnTSCue/vNrtkQPnFXKRfJ3d5hIT4Dy2V6CCd1C//B89tTirKkB4DXpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gNJuDlRv6ntBjxPabE1Ogyr0ed/hKEIfEbCxQfc4sJE=;
	b=ssyA53GChHBvTNzzJgQt+PKerYTGwpbpYWQy/Z5Uo8OVZUX/O3XA6rw0g6Cd/XW3LxS3
	 6VNnfSp8DPPKxIeAz/ok/iy16ucI2SHTcMCx50cEGEVYcu4QozIoGz44CrkyylKzX/a1I
	 /8HbbK5Mo/2SniDcQK1ecU4YNEzxX22sX98zBS2aFb2t2J6AWMTVZ2Pks3RLXv9+S2cZe
	 JwziruevjvBphmappT4UKoDVw0ZOrcdgOi8rbVKvuAlgDI64z5B1YX5Uq4Znx/fteotrC
	 LMXwPzUg3CmpzLFYEZKSnwCdaRXOoMLxkABYRt/mTvKA0X3Yj3N9miN3YGYmbG38FrQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168777;
	bh=gNJuDlRv6ntBjxPabE1Ogyr0ed/hKEIfEbCxQfc4sJE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BC0V6U6DdNsLD7xGjpxey1HZLtt9dQ7PVvihIPhu3NeHkegjnNOhqasqBUumg/kDQ
	 4jfvrT6q9F5KF+6Ul1D6b7vjnEHhX+u0mtVID8mm/j8zLMehSw0ZepHS7n4WLgHDSd
	 4mKSn2CshC0hBr7TRkiqpEQoOpa93ScR8rigDyJNa0O8MmuWl0SXILaK0lTH6gezzA
	 rGRUpk/AG1c2Kxk9ogsu2jGIpGXBTbWDu2NcEUxTHULt4N+A5gQ3vBQZOKrsPcpiJi
	 TR0GM+zmwSUJJcFz661IdQQeF1VCV4EZe2xrwt4fYgjaXKz2UsICH5ANEy0F2jvqcJ
	 aURcX1xnU9/lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 920E860E3E;
	Fri, 20 Nov 2026 09:59:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3338169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C53C54020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2Sjpz2cBAKz for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B02D24016D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B02D24016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so7633245e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168773; x=1795773573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FFD9DdgY+e8vfkEwJgYFJD8LIh/oVCvp0tZ9daFD974=;
 b=etrZvSeJGZgIZRfZkgTVdKlcLucsFCVSwM4FuK314NNVpDPV12sI+qAS2pYxA71q2+
 5jwlFeLepiJktqdQjivxdJ0E+9FVgLTJWkrLdVIvRsTiEOzbYGJXX9lGXQEJh4HKi/o7
 fHaNgGhMl8XU9yiOSZclVszFBm+NL5RFJeqBhTcg+zP6JfFv8fFWA09OSvzxS4o/5Oc1
 HAmHaHat0COZ4yJ/pxbDaPGQuPcfJDi5xIgKwbdeWbiIegfxe/bI74x64Vo5jNai1tBy
 Whonu7iGdEb2qgwpTxq0MNl2miwEFvXc6vMqzb3gbeWsuK0/ORwaXcCrfIejzSS3fyg7
 BhWw==
X-Gm-Message-State: APuU4Z9yZgLefM2t4UuCvlx639g+2z4VkyeVvxIkRcjzcY6TjVxLkCPI
 TJ29WsSMI3v0IIqn7f1062JiXe073DqMvRQPpCkp7JntPo21bX4nSuaBVD1HPGp3cnczxl4i5Of
 n5/lL6/rUZQ==
X-Gm-Gg: AYBFou3xqtEDMivhkvS2KOjCv4u6edFY1WEtkN5INZa9qvFsoT6eGF5TLy4EM1sev5b
 CBWarUEmm4MF39QxFt8Tx6pJ0iB50QIj6j14M83E36cwMjbm2hvstUv7n/ypbEJWfaxigJ5pDzn
 GBGumsJtP0ONw58jU9BMRecrZksN1v3Gt2CRYIpjuBZLe7wl6E1muXnSPAgXQcu0SLsRsHNJgTA
 wK4mbTn/RwZqE39vx5XXuhCuhGJN3lWV+jUfJ6jNA2trd52j7cBnfxpf8k0qc/yMlDF/MSgvY0/
 WU1FEr4PDE2CcAHD0M5ho5NGGQb+9/qpj8yizjRvUcrytWIAgzmjsvSK61DScwzo6tvPx+KlmM7
 QTZR82YWC6bBDdNPhOgHQ19i4ODcj1LGkAJojvnz0vxZh2eIf800/xpbm2k/Q7EFFveSHyz37F1
 EntFXOKO5tle6j/QAh7irN0PWdTlnDT2sPG9w1XUEzmjhVavhfHbx6zfb3VM59ZTjOGLbha/To1
 osdNU9Hbn6/ji3wm510Y6klZ0+CoEDduVkddRfKnwLaD+RvVIyxUyYhluQd7jNtWjQ4ST/pUJXv
 fam0Z2nohRhLbeQ0kVwx3ZAydUn13qiIWPKcnIEnCLON
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id
 5b1f17b1804b1-4bb8880fe46mr56221605e9.11.1795168772694; 
 Fri, 20 Nov 2026 01:59:32 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b09bsm163407865e9.4.2026.11.20.01.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:32 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:27 +0100
Message-ID: <20261120095931.540102-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112100822.3298943-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/prboom: fix build with GCC 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since autoconf 2.73, AC_PROG_CC enables C23 with -std=gnu23 when the
> compiler accepts it, which GCC 14 does. As prboom is autoreconfigured,
> it is then built in C23 mode, where false and true are keywords:
> 
> ../../src/doomtype.h:48:15: error: expected identifier before 'false'
>    48 | typedef enum {false, true} boolean;
>       |               ^~~~~
> 
> Commit 2eb72e7666 ("package/prboom: fix build w/ gcc-15") already
> forces -std=gnu18 to avoid this, but only for GCC >= 15, where C23 is
> the default. Apply it from GCC 14 on. With -std=gnu18 in CFLAGS, the
> configure C23 check fails and -std=gnu23 is no longer added.
> 
> This issue has been present since commit a6e8c07a330a
> ("package/autoconf: bump version to 2.73"), as autoconf 2.72 never
> selected C23. It therefore affects 2026.08 and later. The 2026.05.x and
> older maintenance branches still use autoconf 2.72 and are not
> affected.
> 
> Fixes:
> https://autobuild.buildroot.org/results/7d5050c54ba8319f0fd58336851121f5e127b1aa
> 
> Fixes: a6e8c07a330a389e9578d8f1110e41becac264d2 ("package/autoconf: bump version to 2.73")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/prboom/prboom.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
> index ab9ab09913..28a55badf6 100644
> --- a/package/prboom/prboom.mk
> +++ b/package/prboom/prboom.mk
> @@ -18,7 +18,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  PRBOOM_CFLAGS += -O0
>  endif
>  
> -ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_14),y)
>  PRBOOM_CFLAGS += -std=gnu18
>  endif
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
