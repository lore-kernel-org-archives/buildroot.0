Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A17C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42A1360FBE;
	Wed, 23 Feb 2022 20:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulHBI6HZ4yHI; Wed, 23 Feb 2022 20:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BBC160FCC;
	Wed, 23 Feb 2022 20:28:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED9861BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8C74403B3
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ki4KyfMNkXe for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:28:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA6CD40273
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:28:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id vz16so54989874ejb.0
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8gJa42VIBadfB3x9vy/yUBskv2WXhpRtH9K9C79Nrd0=;
 b=F0H7K9wNGQBY+UNE9PpyyCli3JE+IAh4BbHJq+qGOec6l7sz6rYMmrYhEr+AmuhWZa
 fhXs/vhJ9Q2nRGAe9/g7EbdeGOb1CJBRKj0/GlVtGrMsbhIe2t70wmphjOu6h3mw3AEB
 na2ltp8Z27vbHnUv1dld718GpZhWFf4yz9RLwxei9WcOO90EPBXNwXeggBTle/Dr9IxO
 UJnxfEsQVXlxp70jK3hRix+PcGGeAP9zwpCgX2hUiN/dP4pOh1/Hhgnz0ztp5jqqXe57
 sdNWM7VeP0smVMdrRpXnwDpihNLh/qWZIWsjlK05w+E7h142e9ZWRUrH6xvPwRNHWeAI
 EBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8gJa42VIBadfB3x9vy/yUBskv2WXhpRtH9K9C79Nrd0=;
 b=wplcZIcn8+V+vQurUkKA1ADEPwPw6bxRHa3NxT1HTeVcR5FIz17NLTURDfvrl45wMN
 a6vDSNslBYBkMEMtWWRGmgbskXRqxKMLUo4cUBmw1GN30eiDsfDWHcXvSFn5sOTZyVKw
 RTnVLaaCuHvhDHIAFO7kCryv32iz4y2ayr/smnnoywFSPYacYUooLiSRj2q5W65GkvMY
 fA46+A0i6Z7XyG1I4R0b05dyY9U4fqLwn9vaNCvvHPUiqbacMzG4q1v8LRYJxnIggabO
 z9uJ5vSD85Jqzz6hLPV+ddF7cZaHxs/0Y6+eeF9ZvOrAPhvfh2dIornJ0Fe6a3Zx/y8n
 A6bw==
X-Gm-Message-State: AOAM531n5e+67Lqtm23b7XHhLwf6/L/p+RxTp/oqSCQ/5BPvTDhkNBTE
 IIO5UsovQvAUBS8TN1secb/C4A==
X-Google-Smtp-Source: ABdhPJzympxh6SOYDD0xUXZEAHz/AVudav0MM6bjl/hSafffLUH2xywNd5GUIcjSMsBq0Xy88Cc0NA==
X-Received: by 2002:a17:906:edb5:b0:6b8:1a5a:f3a0 with SMTP id
 sa21-20020a170906edb500b006b81a5af3a0mr1114229ejb.501.1645648112761; 
 Wed, 23 Feb 2022 12:28:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qo24sm286535ejb.92.2022.02.23.12.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:28:32 -0800 (PST)
Message-ID: <9ecde339-7f79-adb9-bac1-dfbdd5bb4e24@mind.be>
Date: Wed, 23 Feb 2022 21:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Andrei Gherghescu <andrei.gherghescu@protonmail.com>,
 buildroot@buildroot.org
References: <20220221160549.20554-1-andrei.gherghescu@protonmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220221160549.20554-1-andrei.gherghescu@protonmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dialog: bump to version
 1.3-20220117
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



On 21/02/2022 17:06, Andrei Gherghescu via buildroot wrote:
> Signed-off-by: Andrei Gherghescu <andrei.gherghescu@protonmail.com>

  Fabrice already submitted an identical patch the week before, so I applied 
that one instead.

  Regards,
  Arnout

> ---
>   package/dialog/dialog.hash | 2 +-
>   package/dialog/dialog.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
> index 2286590b66..3136d18b2b 100644
> --- a/package/dialog/dialog.hash
> +++ b/package/dialog/dialog.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -sha256  466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99  dialog-1.3-20200327.tgz
> +sha256  754cb6bf7dc6a9ac5c1f80c13caa4d976e30a5a6e8b46f17b3bb9b080c31041f  dialog-1.3-20220117.tgz
>   # Locally computed
>   sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
> diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
> index 1c98d354e3..681f8ec9fe 100644
> --- a/package/dialog/dialog.mk
> +++ b/package/dialog/dialog.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
> 
> -DIALOG_VERSION = 1.3-20200327
> +DIALOG_VERSION = 1.3-20220117
>   DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
>   DIALOG_SITE = https://invisible-mirror.net/archives/dialog
>   DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
> --
> 2.35.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
