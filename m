Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE57C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 04:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 144F281E65;
	Sun, 21 May 2023 04:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 144F281E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpDU2O3OxCsP; Sun, 21 May 2023 04:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3954D81E0B;
	Sun, 21 May 2023 04:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3954D81E0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA731BF3DD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 04:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25BB460A95
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 04:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25BB460A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bh5E-ULEqL8X for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 04:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E92FF60A8D
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E92FF60A8D
 for <buildroot@buildroot.org>; Sun, 21 May 2023 04:13:49 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64d5b4c3ffeso273595b3a.2
 for <buildroot@buildroot.org>; Sat, 20 May 2023 21:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684642429; x=1687234429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vvUdbB6m1twcojOXNx5BruuLkP1OJPSXjw5g8qgtyA4=;
 b=AV5l1xyLdw8FulDI0v8QwwdW4EnwyelapwsihJJDsb4hcYt9wRJbe+YzLy0qZZUr9h
 t4e04ADezEaWzEQWQ3FSpy2bPmTYAf01Nhrp6+m5lHKy/e0zFs1FY3wL3KjwWuTelJ4g
 bkOPFg4WDoAXp256OotCupwg0wiBuc28GEdnrzUyi8vAhz3O/Plp9hFIBEdkTZ9TTXDj
 n/ji82rp6GLUSNpezbGXs9PwMyL9fXCIEDzO9Pz+fmQOJEeXPqnT2Qty5IZ+vcx/qSm0
 htC2qCLRRK6+wyiPHP2SRVNSNwa2nrj0b/a5/XnFgfSHU+8WWBW7EtO0cnvbqNKgPZ4b
 89UQ==
X-Gm-Message-State: AC+VfDwLvamZRD1hXV7Y1dfpcdTzGwk8HzManH93u27tC7iHK6LiOcYB
 rCe9x8rw/R2C9MDYZuSw8IIEIn9DnOA=
X-Google-Smtp-Source: ACHHUZ6MvHg0zJdpIgxLrYHMdUvXKNKQGR5dOZIgUQE7uo00svRjeZg4VDCmu8RlOCMnJU9Ul+0caQ==
X-Received: by 2002:a05:6a00:13a2:b0:64d:2487:5b20 with SMTP id
 t34-20020a056a0013a200b0064d24875b20mr9505938pfg.9.1684642428861; 
 Sat, 20 May 2023 21:13:48 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-73.three.co.id. [180.214.233.73])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7904e000000b006470a6ef529sm1917838pfo.88.2023.05.20.21.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 21:13:48 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 5258C106274; Sun, 21 May 2023 11:13:43 +0700 (WIB)
Date: Sun, 21 May 2023 11:13:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Message-ID: <ZGmad1hb8MQ6uyOh@debian.me>
References: <20230516135107.238343-1-romain.naour@gmail.com>
 <20230516135107.238343-3-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230516135107.238343-3-romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684642429; x=1687234429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vvUdbB6m1twcojOXNx5BruuLkP1OJPSXjw5g8qgtyA4=;
 b=Cbg0AL6cZxo2Tj0orUhTlIg+k6vtUjqfSE/9NFrgtal59TOyzZ/VHQolVZ2nWqG446
 7tsNm63ijKFKsjvDk+WqFFtwXWTWDwEN2vV8Q/+CbHHzU9nb9R8KbM1/kulCkh3y6r8r
 vuqhEVZh8vvcqjhpA0y0zEjfcydOALicKSOaWjmAN6ujoV+24OkAIiSTwIqU/u0PABME
 +dfQDCIyQumYUH0k2xca8Ng2Fx6qkg9vRXNFzUFu0VESNggnbpB2afglKDIhRJtGQVGq
 obezmjOHBag/Ffu4WUk6M/Wh2lmMAcVE7vVkpk/Hvkxg9/T1zkA03d68AVIU/rXx9uqA
 S8sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Cbg0AL6c
Subject: Re: [Buildroot] [PATCH 3/6] package/gcc: add support for gcc 13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

On Tue, May 16, 2023 at 03:51:04PM +0200, Romain Naour wrote:
> https://gcc.gnu.org/gcc-13/changes.html
> https://gcc.gnu.org/gcc-13/porting_to.html
> 
> Backport upstream patch to gcc 13.1 for RISC-V build issue with gcc 4.9.x:
> 
> GCC should still build with GCC 4.8.3 or newer [1]
> using C++03 by default. But a recent change in
> RISC-V port introduced a C++11 feature "std::log2" [2].
> 
> Use log2 from the C header, without the namespace [3].
> 
> [1] https://gcc.gnu.org/install/prerequisites.html
> [2] https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e3f19d4f4304dc
> [3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-member-of-std
> 
> Rebase patch 0001-disable-split-stack-for-non-thread-builds.patch
> required for uClibc-ng without threads support.
> 
> Fixes:
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589

Carrying my tag from Bernd's series [1]:

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

[1]: https://lore.kernel.org/buildroot/ZGR4JPCvobetfREP@debian.me/

-- 
An old man doll... just what I always wanted! - Clara
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
