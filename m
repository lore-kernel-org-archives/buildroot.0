Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AD3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65F8E40131;
	Sun, 12 Dec 2021 14:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0zrXa376r_m; Sun, 12 Dec 2021 14:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86D0D4014E;
	Sun, 12 Dec 2021 14:50:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B138C1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A046142042
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSAkGDvY057a for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:50:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08CD441C1E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:50:53 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r25so43978967edq.7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ses4OxwAMVSM4UpVFmNnihF5HnnYH2BDAKN/lDvoQqY=;
 b=Vg7SvEKELqCKLPWCnwoZhWe/9Wrjx+3eoaSCShuxEZkgmughA3oQauoCaSSVx5kkFA
 hpTCe3RdUDJK3mdd74Gd/67iGvP+hI7QcxNGAOwOzEZlhPfSoD0rGjn6efxYUsOKyoF2
 7X7HhrPUr0x8jxyCpfJkuX1OA/euACRvGiL4HMgtFolA8ZnjWOooAVRfWX+eFI8zIpcE
 8DuxYU/jeNb6kGOTF3DpmnZphQ2ikiC3LosVmdhPC36dntvM7/8+mGjOU3HplVzjGWY/
 r9u8uABnWi9ohRWx04cVk/pQklyY5nbD8nsM9+z2xMWWbDySfmQ7pvB1TalQi9E3L9Zp
 I8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ses4OxwAMVSM4UpVFmNnihF5HnnYH2BDAKN/lDvoQqY=;
 b=xD9+jZD4maKgdcyS++TnKQyPJv1iezyeuSGnQvhgiMh0AVkb55m0CFj870uoKG77e2
 twhx5oU/qlzzQOIc7JR+j9mYJh7UluI0zT0RRlB4IiEgA9Ns//kzmqIuf09tF/zEGELk
 TlprDr5XognX7Ttw65D0a8Ejlem4HafhyDI4YCJeRLNMLh/dV9rIWIn0KLPowmGbeHjC
 f4iSNtsfCwQPskkzJuS7OvArixhiUgTgfR2FedHHNn/IJYV0Hkx2jNc+8or+ZnZ814D8
 y/nbux9FrNI3aK1hUd/r+RlT7okDMhGVnoJh/mCkS2twn+NB36IPtF+1YLriOn5V4SsI
 Wv+g==
X-Gm-Message-State: AOAM532vEvYARQ6lY+AMP5yT7AGTgpHrvrGvNCQHsWbwadlxi7w13rIb
 nadZiTC+G51md+RYQHhX/bw19FY2nhEaow==
X-Google-Smtp-Source: ABdhPJw0RLL+t3AP0QoTb8HiI9VpCtctmLfURlPPi/zA5AEryWT6gdacx6XusNAQR8FshhNR7zPNcg==
X-Received: by 2002:a50:c35b:: with SMTP id q27mr55399405edb.154.1639320652241; 
 Sun, 12 Dec 2021 06:50:52 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id nd36sm4676278ejc.17.2021.12.12.06.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:50:51 -0800 (PST)
Message-ID: <5f185682-3e17-9bee-ec31-5825faf0647c@mind.be>
Date: Sun, 12 Dec 2021 15:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Khoa Hoang <admin@khoahoang.com>, buildroot@buildroot.org
References: <20211211025034.800367-1-admin@khoahoang.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211025034.800367-1-admin@khoahoang.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: fix install rule
 for alsactl
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



On 11/12/2021 03:50, Khoa Hoang wrote:
> The copy command for /usr/share/alsa missing an asterisk cause it to copy to
> /usr/share/alsa/alsa instead of /usr/share/alsa where it should be.
> 
> Signed-off-by: Khoa Hoang <admin@khoahoang.com>
> ---
>   package/alsa-utils/alsa-utils.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 427280c1e6..2603e52f18 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -77,7 +77,7 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
>   	fi
>   	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
>   		mkdir -p $(TARGET_DIR)/usr/share/; \
> -		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
> +		cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/; \

  I was going to suggest to use -t instead. However, this pattern is already 
used for two other copies above, so I guess it's OK.

  Applied to master, thanks.

  Regards,
  Arnout


>   	fi
>   endef
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
