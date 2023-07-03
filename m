Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07CEC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8D060AAD;
	Mon,  3 Jul 2023 18:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E8D060AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLbjGYzL3lnd; Mon,  3 Jul 2023 18:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9FA760A9B;
	Mon,  3 Jul 2023 18:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9FA760A9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AE1F1BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 210F260A7E
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 210F260A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5pZqXMRxRH-H for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:29:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC29607DE
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EC29607DE
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:29:18 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b698371937so77542211fa.3
 for <buildroot@buildroot.org>; Mon, 03 Jul 2023 11:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688408957; x=1691000957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6UOBrZZhc5EHVtrijfqBkunhl67deDNhA5gvxlLgPPo=;
 b=Jd+rhVO8XZat4kj7rX5Kn/FQ12nqmdqy16+UVyQxVtuYuw+eq5D2a+qS/AhWR/FM7J
 NPgp6aUZ2MpDtqn23im4QJNM/fSVKPPzXmpGJDx+R09pdY5TPFqKGUfqwUxd/fRtthkt
 dlNmuIzbqeaEXEwlNEBZETkmUE9c1ITyP5WfzxlQwAfAWx86Yfd4uIt5kj2zvzPLpM/1
 xBzqtpjKrp/7Mk/GdKepC8vY7OA026oEMw37VJTmMzh2HThsiHL8+IqDaNkezVe+RE99
 D6i7JCJ8oqcxNdqPv1y4rQda9/MseqeyrMczNwXy+fpx9ArmFHkihaPHDxBmZwtpyX+k
 SG2w==
X-Gm-Message-State: ABy/qLaGV4jM6qXHyi/soXPZS2+gv4Uzw/KkU6Xk7EG+aV4qLoWT0BhC
 CsEFdLbm6skKbp7bczydSl3PEg==
X-Google-Smtp-Source: APBJJlHKh8qLTzn4fMmvSm3eSYez9DaiUFbA8O0WIkawMV7X5HjlluPNZIbsj+eVBgPZ1aPpqxO3Vg==
X-Received: by 2002:ac2:5e68:0:b0:4fb:8939:d95c with SMTP id
 a8-20020ac25e68000000b004fb8939d95cmr6804675lfr.30.1688408956829; 
 Mon, 03 Jul 2023 11:29:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa7cd05000000b0051da8fd7570sm5512942edw.41.2023.07.03.11.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 11:29:16 -0700 (PDT)
Message-ID: <73fbda73-52ad-f828-3a1a-537cadeb574b@mind.be>
Date: Mon, 3 Jul 2023 20:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20230626202901.346078-1-romain.naour@gmail.com>
In-Reply-To: <20230626202901.346078-1-romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688408957; x=1691000957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6UOBrZZhc5EHVtrijfqBkunhl67deDNhA5gvxlLgPPo=;
 b=YDlf4LJaFUgjmEwU1nsjOuuNHx3XX06brD78Mt91EHEVwUkZC1SuikLf9eKSi+Kjb9
 +K4hyeLXFLPbCkGZKOKuRjU3P767dzaOVIy4/dz5lJ0YXw76bzp41dx2KxyIpFfA3iT0
 KBLis1J+TzayX3fmzbQL8bZElxFZZAvvLlh71ANViPxZFiyPAWS/mNi0yB8OqTj7zhxu
 4UE9aWqbJKJNozXARgmoFHlrrX5hpBYHBM0Smbv1Ern1zBGWB8bs9tcsOdLpQv1SVAkl
 27UNva9D5eKWBSBIc9jCIb3LgupBvsj3rlXryZPVpLUcpOYE7utnSfvOxprhlucz/2RI
 OHdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YDlf4LJa
Subject: Re: [Buildroot] [PATCH] package/python-setuptools: add missing
 dependency on host-python-wheel
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/06/2023 22:29, Romain Naour wrote:
> While migrating to pep517 build backend the host-python-wheel
> dependency has been added to host-python-setuptools but
> not to python-setuptools.

  What is really going on here is that setuptools' setup.py checks at build time 
if the wheel dependency is present. Since it uses host-python to check that, we 
need host-python-wheel as a build dependency. I extended the commit message to 
explain this better.

  However, this implies that target python-wheel should also be present at 
runtime. The Z3 in the fixes line doesn't trigger the wheel dependency, but in 
general it should be there. I've therefore also added a runtime dependency in 
the Config.in.

  I think we'll see more of these issues with PEP517 setup types, because PEP517 
tools will generally check dependencies at build time, but they use the host 
directory for that. So I do think that we should find a more generic solution 
for this.

  For now, though, I've just applied this to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4537951715
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-setuptools/python-setuptools.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index d957930455..39ead10f55 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -12,6 +12,7 @@ PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
>   PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
>   PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
> +PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
>   HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
