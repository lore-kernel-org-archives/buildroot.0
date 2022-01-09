Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08097C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7C678198D;
	Sun,  9 Jan 2022 14:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTAuexd1_dIk; Sun,  9 Jan 2022 14:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0174F8191E;
	Sun,  9 Jan 2022 14:50:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6981BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B48B40302
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E884zYW7nlSs for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:49:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53475402FE
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:49:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a5so17924950wrh.5
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 06:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9JaKgfoAY+10MT/7I73fxSoSvl/MPyIUxc8IfeZYYR0=;
 b=eGSFC5LG58ia9srH12IqSi2irCTnOYY3FX4J2v3S8lipsrRtyFbkoqh/4WnzGYSrCR
 nchcdzPsuT4Msz4uGzOtptDMFkdd0uhX7l14RQ0oVhnlu1N77yVSGVpY9foULIOpELZD
 vUTy5npRB6wH+UFa4A9fkFsJmWRLor1HQxRYF8pm+u8RPt8qERJGRvFYQyQGitGUkisU
 ZU3ivsTOd9mK8azh4ncKNlrziDWt2il6KTEdxfS2atBv0raCdFhljGgC93mfcTusg3LK
 b8XkT3VoWcMrbhX7EgyAWJ7n6BfnwZvbITKCOEzHifCfRNjoGR3Mzk0dEOoLqgVz96Ff
 IDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9JaKgfoAY+10MT/7I73fxSoSvl/MPyIUxc8IfeZYYR0=;
 b=EG7E+PA7PnniKI9yiCriBQPPu0anAs/KHN2lM0hqApfnSPy/grhSSopeJ5FYSASt7S
 4Yze+97rbmgMiBvVOQxgpSiYlhAcnlRk3kSAiZ4zykRb49fl40YzltLMwgaL55UDspiF
 LUXj5y/9V2j7C4vRDV4kzdcyssAyte1aqSofrYsk98xTnh0KzppV0lWMGbYWAhetswJ3
 uIvSwYylfBMfjLKv23HQwon4hSiz4Jit8bzROJ372gNKjUgCNmGeHN3bNc7k1+OVjnG8
 SiLNdCiPu7cHWsOmZm3TESHRUbb/DRItB48Fyvz4NfTTlm3RL5SANjZsCQL1vjSTBxeH
 warA==
X-Gm-Message-State: AOAM533N4dbjm8oGRB8N6kGzXYPL2w+9bSp/EKvH8MJVPgHa4K7bZ9P6
 +5l91Jkg3rdD/bXxbAmZ5DLJgWmFsrj+mMKF
X-Google-Smtp-Source: ABdhPJxRjAcm9GXkkioTj10UrJ6XlQfhu1HklOOvrsUse+kycWxjH9NerXM+efitfqRDlhCSx41F3Q==
X-Received: by 2002:adf:dc12:: with SMTP id t18mr63288684wri.566.1641739765646; 
 Sun, 09 Jan 2022 06:49:25 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id p13sm5026059wrs.54.2022.01.09.06.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 06:49:25 -0800 (PST)
Message-ID: <7fb03a8b-f75f-8318-ce76-0ad5a96e6bc5@mind.be>
Date: Sun, 9 Jan 2022 15:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220109110555.3789-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109110555.3789-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/openrc: add patch to create
 /run/lock/subsys
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
Cc: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 12:05, Norbert Lange wrote:
> Together with changes to sysv/busybox init, this directory
> will already exist on all init systems before any service
> scripts are run.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v1->v2:
> *   refresh patch
> ---
>   ...lso-create-run-lock-subsys-directory.patch | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 package/openrc/0006-Also-create-run-lock-subsys-directory.patch
> 
> diff --git a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
> new file mode 100644
> index 0000000000..cf592a88b0
> --- /dev/null
> +++ b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
> @@ -0,0 +1,29 @@
> +From 49e5929b468f604d80a0c04a6ce78eb96ca36090 Mon Sep 17 00:00:00 2001
> +From: Norbert Lange <nolange79@gmail.com>
> +Date: Sun, 9 Jan 2022 00:22:40 +0100
> +Subject: [PATCH] Also create /run/lock/subsys directory
> +
> +Buildroot service scripts regularly use this directory, so
> +create it in the most appropriate spot.
> +
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>
> +---
> + sh/init.sh.Linux.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
> +index e8afc1fb..662ab223 100644
> +--- a/sh/init.sh.Linux.in
> ++++ b/sh/init.sh.Linux.in
> +@@ -82,7 +82,7 @@ elif ! mountinfo -q /run; then
> + fi
> +
> + checkpath -d "$RC_SVCDIR"
> +-checkpath -d -m 0775 -o root:daemon /run/lock
> ++checkpath -d -m 0775 -o root:daemon /run/lock /run/lock/subsys
> +
> + # Try to mount xenfs as early as possible, otherwise rc_sys() will always
> + # return RC_SYS_XENU and will think that we are in a domU while it's not.
> +--
> +2.34.1
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
