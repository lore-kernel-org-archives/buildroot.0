Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A30C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E7F060DC2;
	Mon,  2 May 2022 21:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbsooM7jgU_L; Mon,  2 May 2022 21:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 948CB60B70;
	Mon,  2 May 2022 21:57:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44CCB1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41F9360B70
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Qk4sG4sjgc1 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:57:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77A5360804
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:57:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id kq17so30176817ejb.4
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S7PafyzxpZYVEmcqGhAMJ+zuip1oZLZjbqAbUKujuac=;
 b=E5Gw25eqSfPuQV6cfTNJ5SgZYRk9byLZCruJ9PUUaKseu7rmxADvJswva/lEylWvoz
 l4d54TpAm3Ed6CZX8OcWV/aDI43sLds1Jn5ruq8BacqKzW7p97GLF38OcgcvEttodnLh
 P1RhcAK4X7iov5Cu7XoOoS5+JYIz7M0Hqw8B48idqxj7yKnj18cD9Y2p4vMpwiaILnBz
 Uds+BBKr43kSEpyqNHur0LV2dFl0/FN4kbYpTVmAukpfJ8/Me2+KdcwRRi8WPR/H+VTU
 ci1A60eGMw7Retv3GopcNCSAltDSC74ldxtsgj1TDmqWK4t7R4DjJItfJiSoxmDJiDPm
 rW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S7PafyzxpZYVEmcqGhAMJ+zuip1oZLZjbqAbUKujuac=;
 b=BXQN0xWsFh1BDRBWgOvTMswXyQyQnnYFUtA3pR5QlUJjYv/wd+qIdPIXK/Pr4BB2CS
 ToMqNAlTjWinjoJGxF3Xg09Jhe28QqqOyzNMhzxxrEH/lJCLl3JnXTGTe9kRlqpWZ+xt
 IJft/GfIQxfrGVhFlzapMMjDJiu5xq1p3a0eUfitjna2JeSh1NuK08daGlxpTjWd5eWm
 0ru/IY1tJDE83qd0AcSqsoImizBmWHyyY7Upm4oTKo73NH4bAjMLudCbTQq2ee+z/IDb
 ZKh32VBNNjasykNbkoaRVvY5JybvX7i81IB3Bxzwz0FMvJFRgEIVaAM9I2ZyUOcydm9C
 CyWw==
X-Gm-Message-State: AOAM530DBCJLTx5KktzP1uuNGiM1HdsKSRzCCdqet0/UPh1YaWcWwcIO
 d8MGQgKbH/emP9kvMqjO700z6A==
X-Google-Smtp-Source: ABdhPJxqmbtOpB9rErUyS5VvATGcEfPJtFGcPdMfW0Z4E7cLbPHf+oDLLWl+uIKycyB72ReosKkePg==
X-Received: by 2002:a17:907:a0c9:b0:6f3:996b:3333 with SMTP id
 hw9-20020a170907a0c900b006f3996b3333mr13191477ejc.224.1651528628732; 
 Mon, 02 May 2022 14:57:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa7db19000000b0042617ba63besm7046855eds.72.2022.05.02.14.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:57:08 -0700 (PDT)
Message-ID: <c92b8fa4-dc82-edff-e1fd-c068698dc9af@mind.be>
Date: Mon, 2 May 2022 23:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20220502135340.27665-1-yegorslists@googlemail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502135340.27665-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/python-aenum: fix pyc compilation
 error
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
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/05/2022 15:53, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> _py2.py uses syntax not compatible with Python3. Remove _py2.py
> to avoid the following compilation error:
> 
> error:   File "/usr/lib/python3.10/site-packages/aenum/_py2.py", line 5
>      raise exc, None, tb
>               ^
> SyntaxError: invalid syntax
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>   package/python-aenum/python-aenum.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
> index 9a30211bb6..6d90a59c84 100644
> --- a/package/python-aenum/python-aenum.mk
> +++ b/package/python-aenum/python-aenum.mk
> @@ -11,4 +11,12 @@ PYTHON_AENUM_SETUP_TYPE = setuptools
>   PYTHON_AENUM_LICENSE = BSD-3-Clause
>   PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
>   
> +# _py2.py uses syntax not compatible with Python3.
> +# Remove _py2.py to avoid compilation error.
> +define PYTHON_AENUM_REMOVE_PY2_PY
> +rm $(@D)/aenum/_py2.py

  Within define, indent with (at least) one tab.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> +endef
> +
> +PYTHON_AENUM_POST_EXTRACT_HOOKS = PYTHON_AENUM_REMOVE_PY2_PY
> +
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
