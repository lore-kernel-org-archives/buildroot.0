Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09806C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B705661008;
	Mon,  4 Apr 2022 17:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwT0aVnO1hkq; Mon,  4 Apr 2022 17:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B11AA60FF5;
	Mon,  4 Apr 2022 17:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9E9C1BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A766860FF5
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F29V-IipwWU9 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A0A760FF0
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:40:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id i27so14404059ejd.9
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=diKwUKUvtnbd611CxWI+UrBdrnM228z8ZNLpCIMAnI0=;
 b=FtZ4J9EFjCueue+qyliqLG0yQ5/ZJL/md672rVgyHO7y/rSVQru3vaUs5umUtDjQ+7
 VHtUDBT2fcx0jGy6FNVogG7byfihTI0D1IwxMgbEbxHtQS16inNA1NHuazr885RbNSM+
 SSpknoS7PLGAvLhjMmSLnieJOcZxmCe2TXVeBO6EXG5lIaSjcS7ZSSTRqYJ+19QTngMH
 7P3FamKbz5raTKJ/w24jEXLkTEiTh0s8qj9rd/O6cwFrMsXGf7QrC+vd44xYm/sb35gi
 W8uB9SiA1cXXLFoUlcn7CMruyx2F4377hTfnB8CaCl5JN43la8fJ1xjCyRZrFhVwNfbs
 ZE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=diKwUKUvtnbd611CxWI+UrBdrnM228z8ZNLpCIMAnI0=;
 b=HnE1y/LA1eAu1eDuayHcr44R5LgIDvs/gqOKMbgt/eF/zAwch8VuVbUOODg13GAuXa
 jquY0tBMxQKi5a0StMHaGRbZ2qfaGEOFO7uPOIFYAfNreGpSMcDavRuMpECuLJRZA724
 YxhQW4dygZPK9DFfOvh3Cx08EDtUCo6C8s4Gd1ZFbeq6wUeTYjn8kqNCO2Tm95GhqIIP
 ONi6zUnuAdGMLN05cRcr146Yy0478VfvC0jf2i7A18E3s0qTdcBWG/U3huvjXCPn+AWe
 Sb/pOi5ILc4p3bC7v5ICskUkr58W8JrNc6hxuoc+4FFqzqJWh8QCCm7clMTZb+PhcYVU
 KneQ==
X-Gm-Message-State: AOAM533L/rho0iq51CQXe9XTa7Ms6gEGxbcdQ2dbqWnUHULyEax7N2Vv
 oFHMJoXhYUhvsuBt8+zy+nD44+Z0xsrUYA==
X-Google-Smtp-Source: ABdhPJxJH7xCd+P5a7Nv65tE8x9lMHqOMyn8hd1Gq0SDbT2G3eWEKlCY+py6/XZ8AwL6u685B0l2Gw==
X-Received: by 2002:a17:907:160d:b0:6df:c9da:a6a6 with SMTP id
 hb13-20020a170907160d00b006dfc9daa6a6mr1219410ejc.200.1649094014759; 
 Mon, 04 Apr 2022 10:40:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170906708700b006da8440d642sm4695168ejk.113.2022.04.04.10.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:40:14 -0700 (PDT)
Message-ID: <aec8eaaf-1c4d-08d5-9ea6-fdc7d2ad9ec7@mind.be>
Date: Mon, 4 Apr 2022 19:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220331210046.35887-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220331210046.35887-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/apr: fix CVE-2021-35940
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2022 23:00, Fabrice Fontaine wrote:
> An out-of-bounds array read in the apr_time_exp*() functions was fixed
> in the Apache Portable Runtime 1.6.3 release (CVE-2017-12613). The fix
> for this issue was not carried forward to the APR 1.7.x branch, and
> hence version 1.7.0 regressed compared to 1.6.3 and is vulnerable to the
> same issue.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../apr/0004-apr-1.7.0-CVE-2021-35940.patch   | 57 +++++++++++++++++++
>   package/apr/apr.mk                            |  3 +
>   2 files changed, 60 insertions(+)
>   create mode 100644 package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
> 
> diff --git a/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch b/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
> new file mode 100644
> index 0000000000..b065a3330a
> --- /dev/null
> +++ b/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
> @@ -0,0 +1,57 @@
> +
> +SECURITY: CVE-2021-35940 (cve.mitre.org)
> +
> +Restore fix for CVE-2017-12613 which was missing in 1.7.x branch, though
> +was addressed in 1.6.x in 1.6.3 and later via r1807976.
> +
> +The fix was merged back to 1.7.x in r1891198.
> +
> +Since this was a regression in 1.7.0, a new CVE name has been assigned
> +to track this, CVE-2021-35940.
> +
> +Thanks to Iveta Cesalova <icesalov redhat.com> for reporting this issue.
> +
> +https://svn.apache.org/viewvc?view=revision&revision=1891198
> +
> +[Retrieved from:
> +https://dist.apache.org/repos/dist/release/apr/patches/apr-1.7.0-CVE-2021-35940.patch]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +Index: ./time/unix/time.c
> +===================================================================
> +--- ./time/unix/time.c	(revision 1891197)
> ++++ ./time/unix/time.c	(revision 1891198)
> +@@ -142,6 +142,9 @@
> +     static const int dayoffset[12] =
> +     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
> +
> ++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
> ++        return APR_EBADDATE;
> ++
> +     /* shift new year to 1st March in order to make leap year calc easy */
> +
> +     if (xt->tm_mon < 2)
> +Index: ./time/win32/time.c
> +===================================================================
> +--- ./time/win32/time.c	(revision 1891197)
> ++++ ./time/win32/time.c	(revision 1891198)
> +@@ -54,6 +54,9 @@
> +     static const int dayoffset[12] =
> +     {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
> +
> ++    if (tm->wMonth < 1 || tm->wMonth > 12)
> ++        return APR_EBADDATE;
> ++
> +     /* Note; the caller is responsible for filling in detailed tm_usec,
> +      * tm_gmtoff and tm_isdst data when applicable.
> +      */
> +@@ -228,6 +231,9 @@
> +     static const int dayoffset[12] =
> +     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
> +
> ++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
> ++        return APR_EBADDATE;
> ++
> +     /* shift new year to 1st March in order to make leap year calc easy */
> +
> +     if (xt->tm_mon < 2)
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index c45829aacc..74129ed77e 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -16,6 +16,9 @@ APR_INSTALL_STAGING = YES
>   # so we need to autoreconf:
>   APR_AUTORECONF = YES
>   
> +# 0004-apr-1.7.0-CVE-2021-35940.patch
> +APR_IGNORE_CVES += CVE-2021-35940
> +
>   # avoid apr_hints.m4 by setting apr_preload_done=yes and set
>   # the needed CFLAGS on our own (avoids '-D_REENTRANT' in case
>   # not supported by toolchain and subsequent configure failure)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
