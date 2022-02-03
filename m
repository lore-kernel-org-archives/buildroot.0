Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CEAC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FFA84008;
	Thu,  3 Feb 2022 20:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJuhYgS11OFS; Thu,  3 Feb 2022 20:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5E683FFD;
	Thu,  3 Feb 2022 20:41:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD411BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C6B5408D2
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzNYRhmYnirU for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:41:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3BE4408BB
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:41:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m4so12429635ejb.9
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Y4yOWtfDq0nnnGwO12Vrmql5uGFa7yVMsty+G3yC7gY=;
 b=Owzg/ebRg2IPbvIM2UJsxMM8p5NggUKsXHALO7P6+h5KJLwNDA8+0VUxY9Zi/Qm8FP
 GPBXdrtIh7rGJnv7055lVGB0nRVShhCasOGqdkwx+7N0tbrYv/Irz6XFB7cb6f2v5mMA
 ONFacXOnmJRlNdFu8/b/CTyIFdDF4TRuukLM7dtYZ7TonP//aoWGI/7GocAHKPkGJuiS
 7K9dBkaldIBuXIf8nNp4LSF3wby83NcYQgnauHKIV96BtV+qkaAoWI4o05Q4DCZr6gvS
 xg5F0Gx6uiVpMmxhCMk5L4PGCyh/6S5iNTWU8V9misBS2yrRHg14hsMzYmDPhGqTf1wi
 qeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y4yOWtfDq0nnnGwO12Vrmql5uGFa7yVMsty+G3yC7gY=;
 b=MgfhZKbExpYi6EG92I4wRUoj9eRWRjWxm4xr7e7b8DLnawywMNONdMuiT9ERChNTU9
 Anu52J+Ik4mhIsZRmFABVaH00eiuuDnQ1J3t+vHzWXo9Q1N9HXPJ3GEmgHfdqyoSn6rC
 U8Ja5YhxD7HRwFwsqvW8qLYPn8J7aZ8MCFzZ1K+8EWshf/tMco/I3chBi/H9Ui3BNypU
 g4ay3IReaw8MtyrsKx1Lc8yolBW7FcSht56IZ8BSDWB26wBJoY/Vm9lBJofpxmxkS7TK
 fVT/SFLDOGAph6KLIN00E1Jfv3NC9DuTJyMrr/X8z6bR2+9cnt79R8ZjduU3sajaOk5p
 PJqA==
X-Gm-Message-State: AOAM533RUa4NFVJJPCBP4Gwm0gUGh6ZsXSSQGq+X2NB8+7SKO07jeuss
 BlObevMlZV3+CUpxVar1DuSk/Q==
X-Google-Smtp-Source: ABdhPJyDmNzf/N2YjZ+eZSWJZmB8+Df/wYzR++6lgsqPkJpf+QvzmvH9O76XywiP3yKrqrdofS7nvA==
X-Received: by 2002:a17:907:d0f:: with SMTP id
 gn15mr30623341ejc.43.1643920873130; 
 Thu, 03 Feb 2022 12:41:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id co19sm22958590edb.7.2022.02.03.12.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 12:41:12 -0800 (PST)
Message-ID: <49ef11ab-7227-6a71-13d2-58da7d05aff2@mind.be>
Date: Thu, 3 Feb 2022 21:41:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Doug Brown <doug@schmorgal.com>, buildroot@buildroot.org,
 Peter Korsgaard <peter@korsgaard.com>
References: <20220114050734.497034-1-doug@schmorgal.com>
 <20220114050734.497034-2-doug@schmorgal.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220114050734.497034-2-doug@schmorgal.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/rtl8723bu: fix firmware install
 path
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



On 14/01/2022 06:07, Doug Brown via buildroot wrote:
> The rtl8723b_fw.bin file installed by this package is not actually used
> by this driver at all. It is used by the btrtl Bluetooth driver in the
> mainline kernel. The mainline btrtl driver looks for the file in
> /lib/firmware/rtl_bt rather than /lib/firmware/rtlwifi. This driver's
> Makefile has an install target that confirms the correct destination
> firmware directory.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>

  Applied to master, thanks.

  I also double-checked that this was indeed wrong from the very first version 
that was added to Buildroot.

  @Peter this is for stable.

  Regards,
  Arnout

> ---
>   package/rtl8723bu/rtl8723bu.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index e490bddf09..838bbedb74 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -13,7 +13,7 @@ RTL8723BU_MODULE_MAKE_OPTS = \
>   	KSRC=$(LINUX_DIR)
>   
>   define RTL8723BU_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtlwifi/rtl8723b_fw.bin
> +	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin
>   endef
>   
>   $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
