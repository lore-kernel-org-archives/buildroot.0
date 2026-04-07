Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0091CFF5135
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 19:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFB760E06;
	Tue,  7 Apr 2026 19:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B164ddQjTZun; Tue,  7 Apr 2026 19:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2BE360E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775591291;
	bh=ITCc82Tgi+y2nAzP3wVrX4cfM4M2QMjcqSgWAvtECzk=;
	h=Date:To:From:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GGJja3MYqyTK3P0VzceoQhCPnxJHgGneiu+wdwn2ZpVbTsXMFue6VY14pPyiYGWRR
	 WH6TnykR4IbK2twvbjUJ4ovOgHOOfTkcuUUpoz+lj2epqTkPzZvQbDarrJXUesO1bR
	 inNmEDlcr+rtEj0I3Px6sRxP8ohMM1pLp166dtkvgvVPtNAPMWNsbQZNl/OpcRW/A7
	 ZLoMmyzsa4Ez8nPDBcul36PrQx1cl266DFr/VrVOXKOnVRJmf0MoLwj+IbHVfMy0/L
	 dhWnzPlKLqfV9x5Q4eNfhjkKMtDjM1u5JvCoVzcUKzXMSFxjkf6NrF+Et39ThpSNjT
	 lCFumF7F8YyQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BE360E09;
	Tue,  7 Apr 2026 19:48:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 841392C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 694768156C
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6NL6XbJktAv for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 19:48:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B66E8131F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B66E8131F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B66E8131F
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:48:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso40981595e9.2
 for <buildroot@buildroot.org>; Tue, 07 Apr 2026 12:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591287; x=1776196087;
 h=in-reply-to:references:mime-version:content-transfer-encoding:from
 :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5FVlG740Cvhx0LJWBKhNhrVs5a7q18GocAuprOjMZQ=;
 b=oEXBgrLGzjS7RvQgXU6rqpZX/c3Vpp7VmaHeEpkfzsK8019mmAzpbffQRqWIZUeGIA
 0bNC1amh2UleaABINxdM3yuHcU1YskK1+C8/NLZYNTl+FRHjfvoXSaR4ievt2jcAUwLR
 o4Aeac/ocBbpF3WiUB+bIpng4SrK97dOE+lv3fIaMLYXcC5iQuYqlRE5NJywJzwlkoBK
 f0uTk1BrswBI1odV/WrGY/7c+EcUeTo0huIj1upp2YcgYy1IVbpBeWhSLOBNRwZ5y9RY
 6PnDyJ73AO4eG7MwHiD/Sf/6IBuy+2slNjn45nJizdx1UMhPX+ysFPdDgvHoeBlgZNkk
 uCjA==
X-Gm-Message-State: AOJu0YzZ4EZcVxOmRCAIHsGEmy1ID4YYm5q9DzaziYVJ7Svg38c5LzP0
 4T2qTPnsph2kT3UmoD+uz/IS4EivcjY00QDXXGuW6sqNhAMp5LKG/m8y
X-Gm-Gg: AeBDiesZPWL0EtKljzaUWVBuNlnMy1ighV5uKtgnF/dPun3kTL/OR5+N6yeAlj3EweA
 oBvBH/1+rFtshdUXWQpbpGRlA1D/xS9OjheiNzyMPQ0QyJyO0qpqmmF+mKw5OTzEu6e8HdSd+Bg
 b03hfIF6jlJgJWo03KD6UNSCvZ9cyLSxlhSzLaBqDBgRbG8SugF4P3kqixT16yH0sKtvou8Iq/l
 3G3CJ/GSXVDd8ucm9fgiyA2HI1amtoDWdocp9sUywz1eWPYNencRfGYLJ8TSvoQbvTuOon2kaXo
 6XoZpghxtyIni0pFXiltQjEcQKI+65ifMnnIS9jjBgJ41e5dSn1h8KH5vOQSYcmRFFj989evrhU
 /MNpRdNj5ZG3tdSRqIUWqJK+QlKEKNxjTPjIs8jeKzWIzGsjnoD8pCn77Nmn1Sjeql1ylSoRTJj
 XW3ercGty3BmEST6e+CztzHXqTk9F8T3sz+fmciJ4d0+FUyR3E3xT2GTwYTc5aSYzEGAwnMwmav
 NoihQhzaMqB3lW4dZll/RXlWprbP7F2ZqZ+Aw==
X-Received: by 2002:a5d:5f87:0:b0:43c:f4df:923c with SMTP id
 ffacd0b85a97d-43d293060edmr27531272f8f.49.1775591286731; 
 Tue, 07 Apr 2026 12:48:06 -0700 (PDT)
Received: from localhost (83.4.93.130.neoplus.adsl.tpnet.pl. [83.4.93.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d473b8c1esm11913337f8f.12.2026.04.07.12.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:48:06 -0700 (PDT)
Date: Tue, 07 Apr 2026 21:48:05 +0200
Message-Id: <DHN6KVOUL3M2.1GNDLMFXNVZ0M@gmail.com>
To: "Julien Olivain" <ju.o@free.fr>, "Franciszek Stachura"
 <fbstachura@gmail.com>
From: "Franciszek Stachura" <fbstachura@gmail.com>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260406184858.1335459-2-fbstachura@gmail.com>
 <ff9ad5a1e9daa6153e416c1e931a4db8@free.fr>
In-Reply-To: <ff9ad5a1e9daa6153e416c1e931a4db8@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775591287; x=1776196087; darn=buildroot.org;
 h=in-reply-to:references:mime-version:content-transfer-encoding:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g5FVlG740Cvhx0LJWBKhNhrVs5a7q18GocAuprOjMZQ=;
 b=BBXhNkdEoS+YuCN0nnuHsjKEvfMuYwh/zao8TQUjG/hqF5BND5yK+iKXH0RHZrUO+P
 EUBRB0EV5Hye4qRWuFT/s9LFkXF4+W7DR2LjlJNgaNkaQEXz/8DQ6yTFr3gp3qqUhvOG
 VHM1eLZc5C3Mml04jyCfMHt49LwWVJez/SrH19IW1vrX1mmKCL1nn1unRb4DfaFTDhGI
 YmOqs4LHm/2QQQToXEIZpqmgOnQF8GUpbD+tDHv8c21iGrmLeV+lF65SX4K/fqZu6e/0
 HZXThsbTgyHUu/lLyY/4J2lDOMwTo3M5+dh8exiX77KsRZBtt4HMNmgEZYVXwf1u6cbb
 8qug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BBXhNkdE
Subject: Re: [Buildroot] [PATCH] package/libphidget: bump to version
 1.24.20260127
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien, All,

On Tue Apr 7, 2026 at 7:39 PM CEST, Julien Olivain wrote:
> Applied to master, thanks.

This patch has also been reviewed by Bernd Kuhls, who pointed out that
it breaks phidgetwebservice. I have indeed forgotten to check if packages
that depend on libphidget still build. Sorry for the confusion.

It looks like the review did not make it to the mailing list, or at
least I don't see it on lore, so I don't know if you have seen it:

On Mon Apr 6, 2026 at 11:31 PM CEST, Bernd Kuhls wrote:
> Hi Franciszek,
>
> Am Mon,  6 Apr 2026 20:48:59 +0200 schrieb Franciszek Stachura:
>
>> This is also a backward-incompatible upgrade from version 21 to 22 [1].
>
> correct, building phidgetwebservice breaks with this bump:
>
> configure: error: Missing libphidget21; make sure the Phidget21 library is 
> installed.
>
>> As an alternative, I would propose removing this package from Buildroot.
>> Version 21 was deprecated some time ago and the package has been causing
>> the same errors in autobuild, almost daily, for more than a year already
>> (see 2024-07-06).
>
> I also tried sometime ago to fix the packages but stopped due to 
> complexity and lack of interest.
>
> @Jonathan: You are listed as maintainer for both packages.
> What is your opinion about it?
>
> Regards, Bernd

Jonathan wrote the following in response:

On Tue Apr 7, 2026 at 2:52 PM CEST, Jonathan Ben Avraham wrote:
> Hi Bernd, Franciszek,
> After giving this further thought...
>
> 1. The current libphidget version in HEAD of the buildroot master is 
> 2.1.9.20190409.
>
> 2. The current libphidget version at 
> https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/ is 
> libphidget22-1.24.20260127.
>
> 3. Between the two versions listed above there were about 64 intervening 
> releases on https://www.phidgets.com/downloads/phidget22/libraries/linux/
> which indicates a significant level of activity (by at least one person ;-).
>
> 4. ArchLinux supports libphidget 2:1.17.20231004-1 - someone was interested, but 
> not enough demand to continue support since the end of 2023.
>
> 5. AFAIK removing the current 2.1.9.20190409 from Buildroot will not break 
> anyone's project/product.
>
> 6. https://www.phidgets.com/ appears to be an active company, although I am no 
> longer involved in supporting their devices. This company is in the business of 
> rapid prototyping and design of sensing and control devices. Their customers 
> are probably mostly makers and students. The customer I worked for was using 
> Phidget devices in test jigs to test consumer microwave ovens. This customer 
> eventually sold their product portfolio to Miele and closed its local operations 
> where I live.
>
> There are currently 184 active products in the Phidgets catalog as of early 2026 
> [Gemini].
>
> 7. https://www.linkedin.com/company/phidgets-inc/ shows eight employees.
>
> 8. A history of the idea behind phidgets is available at 
> https://en.wikipedia.org/wiki/Phidget.
>
> 9. I wrote to support@phidgets.com just now to ask if they think there is 
> interest in Buildroot support.
>
>
> In summary:
>
> 1, Through negligence I did not remove myself as maintainer for this project. I 
> apologize to the community.
>
> 2. I recommend removing the current libphidgets and phidgetwebservice packages 
> and not trying to update the packages without a maintainer.
>
> 3. I recommend conditioning re-adding updated versions of these packages on 
> finding a maintainer:
>
>   - who can in good faith commit to fixing issues for at least two years
>   - who has the infrastructure to test fitness for use of these packages on a 
> Buildroot target system, not just fix build errors
>
> I agree to reposting this email on Buildroot-related forums.
>
> BR,
>
>   - yba
>

@Julien, @Bernd
What would be the best way to move forward in this case?
The previous version of libphidget does not build on sensible configs,
so that's already suboptimal.
Would you like me to provide a patch that replaces phidgetwebservice with
phidget22networkserver? As I pointed out, I cannot test it, so maybe
attempting to bump libphidget was already a bad idea.
Should we wait for response from Phidgets?
Or maybe it would actually be better to just remove these packages?

Regards,
Franciszek Stachura
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
