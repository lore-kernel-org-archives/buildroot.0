Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D69FC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DEF611CA;
	Tue,  6 Feb 2024 14:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DEF611CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHsrnw_txQRT; Tue,  6 Feb 2024 14:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94A4A60B9F;
	Tue,  6 Feb 2024 14:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A4A60B9F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1381BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8F0360B9F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F0360B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7ZLXl2ytghE for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:09:36 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1C81606FF
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1C81606FF
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fe282b8adso5283235e9.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 06:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707228573; x=1707833373;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv0Cso+gR3iSkiriKS6bgi0OhxVB9D124A+5wKqNzns=;
 b=IPamNe40GInJJNC++szLiFcFieVyOJJ1WHb5ptaNQNfc6zsgLUmf9zDjf1Xbd+ccF/
 pGn/bErH/bo/MKZ9R22RQW3ioFMbmmjhhHUHA0uKAXgtNcdb+Hu/eQ1IxWEhQ8wValEB
 Zpwz6yLuIBwXc7ewdCe2Ept8JV3Qsw09KLcYbFEqkF93+JnSLS0OlboIrAu7i90evCuv
 YX6w2P91CSpd9DJlVsz6sV5RSdqpvwU9w9YJXItKWUuEuWlntUyEFfCzGj9AuT1IHBQK
 9DC8/7y+0mPMJcdZ0jDzGVu92mwEOIGlRM1ChrkdxLTCFB+XKjQNfawlDByD+BoLrf6K
 YrbA==
X-Gm-Message-State: AOJu0YyIhisjtfdhjBuetSbltZWGtAbeP+QVeVZq3yBwL8zO7XBKpFRb
 7YMziF+nEdR+GZ5P0kKJ/2mdKWOEK6EbS8M2KlMT8Z9S+0zIARzatjHKEYfal+XAe63hEnZnYxH
 w
X-Google-Smtp-Source: AGHT+IGTP81FRnljPW/gLMhIO4xdbpKXWwBuD2oefmHN9qie1dWLL5ukpSXvcdyQDxkUy5f2zOeD1Q==
X-Received: by 2002:a05:600c:4fc5:b0:40e:5523:e6dd with SMTP id
 o5-20020a05600c4fc500b0040e5523e6ddmr2025050wmq.30.1707228572872; 
 Tue, 06 Feb 2024 06:09:32 -0800 (PST)
Received: from [192.168.68.114] (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr.
 [90.12.67.126]) by smtp.gmail.com with ESMTPSA id
 bg40-20020a05600c3ca800b0040fb783ad93sm2160084wmb.48.2024.02.06.06.09.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 06:09:32 -0800 (PST)
Message-ID: <1dd4afa6-e225-4e79-bb3a-21d0e04c7571@smile.fr>
Date: Tue, 6 Feb 2024 15:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240111051726.2918732-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <20240111051726.2918732-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707228573; x=1707833373;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fv0Cso+gR3iSkiriKS6bgi0OhxVB9D124A+5wKqNzns=;
 b=KAtMOF1ttK+9NL9pl1fwV3XOfXKMqMRrIrrSF35vRa0T+LRD3NskUMzMymuwxnp014
 2h9H7dA5eVVgHGY3QSGrFM66tvmTAFrfF1EX8tFpQF/S7g7sv/xBUd0c1ul5HnOfZQC6
 5dx7J6XQeUb8kCPS8XSO4NFBPv3br27n9VEXYTWV0vsYsDIWPelEk2AEiHUwS46K/oU3
 DTWzns7Ry2/k9X3Noa+LhDrC8JDYOBsWWCvWcLd7lxvhlU87Utx86VbB9PhvpTlzlU3Y
 5CQnLLoWBcMywYr5Ku/BR/I430GeaE4ApEJa8OGRZte6pVhPXNray/QjooRpDCFmWxD0
 dJmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=KAtMOF1t
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.16.2
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

James, All,

On 11/01/2024 06:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-rpds-py/python-rpds-py.hash | 2 +-
>   package/python-rpds-py/python-rpds-py.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
> index b04aa210d3..8c4b6181d0 100644
> --- a/package/python-rpds-py/python-rpds-py.hash
> +++ b/package/python-rpds-py/python-rpds-py.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
> +sha256  861b1fa8c37819b2e2cebbde6dea66ac2fa1247e4a7c3933dbf4c89244d7fecb  rpds_py-0.16.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
> diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
> index 6f71d02047..5f0d30d002 100644
> --- a/package/python-rpds-py/python-rpds-py.mk
> +++ b/package/python-rpds-py/python-rpds-py.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_RPDS_PY_VERSION = 0.12.0
> +PYTHON_RPDS_PY_VERSION = 0.16.2
>   PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
> -PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
> +PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/c2/63/94a1e9406b34888bdf8506e91d654f1cd84365a5edafa5f8ff0c97d4d9e1
>   PYTHON_RPDS_PY_SETUP_TYPE = maturin
>   PYTHON_RPDS_PY_LICENSE = MIT
>   PYTHON_RPDS_PY_LICENSE_FILES = LICENSE

rpds depends on the crate pyo3. This crate uses

"std::sync::atomic::AtomicI64" which doesn't exist for 32 bits

targets. That leads to an error [1].


An issue have been opened on pyo3's github [2]. A fix have been accepted [3]

but it isn't in the last release. Thus, this version bump doesn't

fix this problem.


[1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854842

[2]: https://github.com/PyO3/pyo3/issues/3614

[3]: https://github.com/PyO3/pyo3/pull/3619


regards,

Antoine Coutant


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
