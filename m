Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C0BC7618E
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 17:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FCA283C0C;
	Wed, 26 Apr 2023 17:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FCA283C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPDjB2o84jR0; Wed, 26 Apr 2023 17:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C395883C0A;
	Wed, 26 Apr 2023 17:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C395883C0A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 925BA1BF30D
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 17:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7526041E1E
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 17:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7526041E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upwTqzaldx6Y for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 17:21:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8515541E0D
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8515541E0D
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 17:21:19 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-506b8c6bc07so12442374a12.2
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 10:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682529677; x=1685121677;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BfsN4guyjVXfLWFS5PTysCj3brL/ycqthq/QL3ff5Cs=;
 b=ZE4f2iP2D0WLOHtysWAvU5f15PSUuWj3OvyN1+CnslmotGZp/dk0IIiCXnrDIFUGra
 GsxakC2sYBn99q6azf0OcPIgHq4F6+9VXSUCUWBjt57Xlo0KXG85EAOrughDErawdC6I
 +/1rXptfFHp4+bw+DDC8weYf/2KAGxbP4CesMcdsBgliDTigkjfMMbe3gKeLjAutwuFv
 xVHpByNgZjHlSJ9Uhwq6ULg0aGtrVbdvEzMuBiEf8wdYoDTrrhngRyf65vLblGATsfaY
 Mu8Gzvpqh4lSmG+3NYqQGaEOX0qTAxOWt8fr6jTPu5TTaSSP3i3SPJsC0k5yUC0PtYjq
 40Sg==
X-Gm-Message-State: AAQBX9fOvm1EBr4XjWLlJaz+Pg1whqCZc/tUXIGFkuROmyWX8XAUdReP
 SuLGqn98top6WziT8YdFtFs=
X-Google-Smtp-Source: AKy350bxgj7/CcbTrxNLMZXUrwOexiysNiRXBXNXdr71pFoPgagwPsWta44xb8Mz2CAV0F+HrbIfhQ==
X-Received: by 2002:aa7:d4d0:0:b0:506:c2d7:503c with SMTP id
 t16-20020aa7d4d0000000b00506c2d7503cmr17379511edr.41.1682529677214; 
 Wed, 26 Apr 2023 10:21:17 -0700 (PDT)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05640207cf00b004f9e6495f94sm7058608edy.50.2023.04.26.10.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 10:21:16 -0700 (PDT)
Message-ID: <2fd1acce-9795-aa38-44e7-7f7cbdd1a57a@gmail.com>
Date: Wed, 26 Apr 2023 19:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
References: <SN4P221MB0682FB7AA70635712FC71C57A0649@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <SN4P221MB0682FB7AA70635712FC71C57A0649@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682529677; x=1685121677;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BfsN4guyjVXfLWFS5PTysCj3brL/ycqthq/QL3ff5Cs=;
 b=Jy/asLq7Ww7erReFqGIphViRBKhvA4JO6mOgFItCxy0FeiuG4t8ccEJzt90iPx1iwV
 YHyF3FkWYadsFWHCD26/OhfdCY6Cpf991znYy7wMdH3pjrFeWHl8eTSI7z93hWcNWQpz
 l7VdeSf7q1BW8VnZlcgTtJDbN/OBaC9+RAt2Sb44OgORP367D2bGU8zSSTwp6jwOZ9rH
 QE5GqML4ZAXJ2Zc1ar3D5AnSAB2Xl9xqoNlyvD+d2WmLgfqyIBEpz7noO3l1zM8uvmCw
 VrARLXkiWdnZNkX6kO0k1wY6Ady9zbpNdM4B8CchFtccqXYQct2gqsom38eAHkJWqGOL
 eICA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Jy/asLq7
Subject: Re: [Buildroot] [PATCH] package/sway: add runtime dependency on
 xkeyboard-data
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 25.04.23 21:47, James Knight wrote:
> The following change automatically selected the xkeyboard-data package
> when sway package is activated. Sway relies on libxkbcommon package to
> provide support for keyboard keymaps. The libxkbcommon package does not
> provide any default keymap data to use. In an environment where no
> keymap data is provided, Sway will fail to run (at this time, the
> program will SEGFLT; but even if Sway is updated to handle this error,
> the runtime state would not have any keyboard support):

If this is caused by libxkbcommon, would it then be better to add this 
runtime dependency to wlroots, because libxkbcommon is a dependency of 
wlroots not sway. Maybe, the same problem occurs on cage (also a wlroots 
based compositor), too.

[SNIP]

Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
