Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB4BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C0860FB6;
	Tue,  1 Feb 2022 22:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOPWB4lFdVRy; Tue,  1 Feb 2022 22:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE2A560B3A;
	Tue,  1 Feb 2022 22:04:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA2D1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A01C41631
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOkWeOcGv59h for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:04:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6949441624
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:04:05 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ah7so58343096ejc.4
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yXkaqpIDgFYVx7KdU0NAACob08qgkvWjinGOapNgP6k=;
 b=HDwmbgeN+D1xUD/LnpVDyjR060T7tR7Xy5uqM7SVhXLd8WjYFm8q9egu177Cv/Z3PM
 R2yLW92N2G1CwlyUAxTWkMqEh4ozUoRbYGZX07rUSXXzARVZEK4+1gHIqZNUfHeLHu7Q
 d0pXRYvBMa8c06u4l7YSMsJcSPMQh8gq+m0j1F93zDD9vDz61br2QK0SYNyzqjVJeYl0
 rGbDkS/wGhMvh/N9fY8+v0czqdPsLedd1xabzAufagP8tFEuAe0s3EbkKRR67zytoY70
 1SS5C55Ev8zYbtnlAUpKgjVXjssq9YVQa/ngpJ3sGqi2Q0AWuahTB4dx9/hCofN83iIC
 o2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yXkaqpIDgFYVx7KdU0NAACob08qgkvWjinGOapNgP6k=;
 b=AMlSqkGWLrmHhlomLfS8Id3rQM3sqXIgSztDPhG5wUE2S+v3iQCoTVaWwLaBvc7EDq
 uthBDXS5WMU8XgNGFrZBLTKzKfNfwLnpWfczgGquHzTg+FJssLvNXz/FBncAAgSe65cx
 h3qCM//z11Wsu2UmbGKY6TKFc+fa1a9RPnsQU7Zs0x48C7PsOBSVPnVlYffln+TfpvGc
 1IolIbgBsQYB49X61wjjPIBml6K4+ClsEcYDm/FS0AqlmZ4u3UPWCQRqC7hr09QiPWo2
 Whqbm40MgA00s6mNdrq0ohPRl5yY6MMAW8Iq4UomlUfWEYtBx3ZoITs/80l7q7+ffm6y
 39Rg==
X-Gm-Message-State: AOAM5322sskZp0t16B8RD2V/nNE5m9VjORhos4p+FJvaf+aon/pzlId+
 EnuJgW9iItwrFXheUPO/7mLDsID9qMS+6Q==
X-Google-Smtp-Source: ABdhPJxSotitmpzRhwSdHKBG782OqZotjIvpun1vznMI6CJXs6J2LttPU+PDbB135up+INypzCHENw==
X-Received: by 2002:a17:907:96a7:: with SMTP id
 hd39mr22799373ejc.130.1643753043677; 
 Tue, 01 Feb 2022 14:04:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ku10sm14853731ejc.67.2022.02.01.14.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 14:04:03 -0800 (PST)
Message-ID: <9a932f1f-83b7-c10e-5e5f-4e0f13306340@mind.be>
Date: Tue, 1 Feb 2022 23:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220126210039.1535791-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220126210039.1535791-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/umtprd: bump to version 1.6.2
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/01/2022 22:00, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/viveris/uMTP-Responder/blob/umtprd-1.6.2/Release-notes.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/umtprd/umtprd.hash | 4 ++--
>   package/umtprd/umtprd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
> index 170837d84b..7cd75619ab 100644
> --- a/package/umtprd/umtprd.hash
> +++ b/package/umtprd/umtprd.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256	cce45c7d3df0022fc013c79de21b1f11b1027d090aeb628669f08b0c20d2afdd	umtprd-1.3.10.tar.gz
> -sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE
> +sha256  1de40511c1dd4618719cff2058dfe68a595f1b9284c80afa89d6d1a1c80aec29  umtprd-1.6.2.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
> index f1a4e66cff..c5e0ee512e 100644
> --- a/package/umtprd/umtprd.mk
> +++ b/package/umtprd/umtprd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UMTPRD_VERSION = 1.3.10
> +UMTPRD_VERSION = 1.6.2
>   UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
>   UMTPRD_LICENSE = GPL-3.0+
>   UMTPRD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
