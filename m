Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB98AEB28E4
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD56612A9;
	Fri,  6 Feb 2026 08:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNesJX--LQvo; Fri,  6 Feb 2026 08:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3305B61282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365542;
	bh=Hp1I34HIZUhs2flIQW8a8Q/yzkcRb96RhL2X9F9GGEs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=poEaSYWV2Ceq++iKq1coVeB6EVXEe7BetlBX5IB1ZtV5oT5F61xJeeLTPTW4OKM8V
	 gzwHWfbQTnU+p3LldZVCnu/jPt5h/71hXl2970595H3XbQX/GxM14QUjfLxGCWkjxR
	 zrcpzo25NFIJabrEVm4nraPAFC57C8G6j1tvAgu8A3ntEMstT2u4fYuyJGjLZO59kI
	 DlF13RSa3899oIXebeC2XLdBLNP9V1s9AfmO+3RGKZiZKk2MF7oyxJYSVwLrqbQ0Sh
	 0ODXNAleIQQtZxECvgh8Gr6yJFSGnpP1lJmdYmYJGsonv9hYFcqLp9hzxRx1OTZWRt
	 EP/yagU41mSWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3305B61282;
	Fri,  6 Feb 2026 08:12:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F85173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 485F66120F
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpjVUzf7vf6D for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB51E61219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB51E61219
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB51E61219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso4452435e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365525; x=1770970325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NXlxTaPhLfZsXQ2Yo8/qj1GW9dYCayf4c16GB23u9SY=;
 b=b6ViDoirucC7Msc0Vi8PETie0lTVD4FROEf30ZLwzk8YhPUjHZyzhbD6YSIKGSjlmD
 iGSwAMH01SxRhQwT8xavrzqD1B7JpelT70PLsCQJD7xXkHc3G1Qs5crwMRMtR2fVgo7q
 U0sJ6YvkQQ+ctukvUnNlKUerH3ZIcSPbuS5vpMekOKEpZQhcC49PvKH3AwrIgC6+07Fx
 kpZsP682SoxYkMdqDaTw8szg7au/NX2kSz0aWCtiNgtFCFw2+vGqDJNeZluzjxZqXlxX
 xypIIy99W6j4yqeX6QDle0VrWuDDNGmdO/ZTBuseWntjccYp0gMJfj22uX1SDfzxy0IJ
 tKzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo0SlDRWHkCx/IhgHwJk/m1+34pYqurB0OEO2zcOchjaw6WcU1VnNcMybhWWLRww46oCh1Xj9CWQ4=@buildroot.org
X-Gm-Message-State: AOJu0Yy0y1pTwBD8ftCZlLS53sEmp7g/YPshROTfDyQoU1dm6aTkwv34
 x8n6MIGofoNBzv4iH32s657S4/bckXYE0guiF2cZHvk8SushbJ7bD7IAChQCKICExyw=
X-Gm-Gg: AZuq6aKQNNDPH65MvjdVwoKchmc2rMhgtvxBTBQLefw4+Xv+rmdXsPX/MKVmJDekukI
 aOH3Z2kCvpP7VByl+UI1GOZMZVPcVh4t8KdyXYJbWFfU2xoxqu42wXo3ZZWcaNbaSCpBN624aLt
 os5owVbAEbkHE45WSfth/IrAI1tQA1e5p6M3PYov+n5b81zruY3bEeopLMwz24YmFQA3Aci+bqA
 4BTcur3qk9j56/Vh6Dle0z69I7nINnAJnU7AKPYjheIkYkC5t1iM1XxvbJy0+FTc95ai97I1o0x
 B3EW47mW7lkI8YseklecZns93eB5BUyXvUYqJAE4oKIwfHnozUwNwlulxGMaNk0ncvUwh0SUr0s
 p+ZYIQgxYaBfgxdIPCiR9bVNzDfWdzcrVtJZrVHTHWGXb06TBvYQvbPbrCayMKmq/3R7J2W+rDt
 mRz9BYKkE/nyeSzg==
X-Received: by 2002:a05:600c:444f:b0:477:a219:cdb7 with SMTP id
 5b1f17b1804b1-48320181c15mr27649275e9.0.1770365524817; 
 Fri, 06 Feb 2026 00:12:04 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483228ed4f8sm20543905e9.0.2026.02.06.00.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:04 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:04 +0100
Message-ID: <20260206081204.32966-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124152941.902168-1-dario.binacchi@amarulasolutions.com>
References: <20260124152941.902168-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365525; x=1770970325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXlxTaPhLfZsXQ2Yo8/qj1GW9dYCayf4c16GB23u9SY=;
 b=F75nmp/SOpHAK51JG2sGUT9C/cj4P2Y7FBiDVlAA6ve+GZG/TR2VhH+G6nS2D+/pgX
 xx9mdHDYyDzkLSHJfCUp+YUpQiHZ64nS0QQT6bBcKqWMJ+FnDP6PZAEkw0abaplNyFAQ
 zFxJyCnwQDkdmQtzrPQulPqerZbPghBND1MGPEm4nsGAWbRBUTX1DXj1paPEPCeD5bt9
 yHkbr+ULWTlEiDJKygjfp8zzkkLgzy+0bQl5tmjRbkUTsMVxKOZJt5AjsYHY+SR7jWgv
 gjvkzek7wFpjSPOW5nGSCINqFSJC66wQRQBEZYg/pxk26RL0ofCYe4TqEGBp9xh4Wo4n
 9bCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F75nmp/S
Subject: Re: [Buildroot] [PATCH 1/2] board/ti/common/am6xx: remove debug
 flag from post-build script
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
> Remove the '-x' option from the shebang, which was a leftover from the
> debugging phase and not intended for the final submission.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/ti/common/am6xx/post-build.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/ti/common/am6xx/post-build.sh b/board/ti/common/am6xx/post-build.sh
> index d066e28fd0d5..e3ff4d7f12ce 100755
> --- a/board/ti/common/am6xx/post-build.sh
> +++ b/board/ti/common/am6xx/post-build.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh -x
> +#!/bin/sh
>  
>  # genimage will need to find the extlinux.conf
>  # in the binaries directory
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
