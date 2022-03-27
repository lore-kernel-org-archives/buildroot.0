Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C717C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06FBA60BA1;
	Sun, 27 Mar 2022 16:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEPOOaGB9Qh1; Sun, 27 Mar 2022 16:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE8260BB2;
	Sun, 27 Mar 2022 16:09:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 564DA1BF9A4
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54075813C6
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0chmnzSTlEA for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:08:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 589878138F
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:08:58 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g22so3293723edz.2
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yszAsFqc28QlgSl+c1wF9p9bK0da0irdtwyIa0C0vMs=;
 b=azQaPUgfUlc+kxEQPEDNG/K2wM62IcgOUWdkxzGaCKIs2YpPuc6sHpF8yfLYfE6kqr
 r4gfcqeqrPKShTlZlh5AD4brgo0ZqmsSUTHKy1IyfMA50n90DKQyKMvMsCQTMLQntHBH
 QfIvlPiTKrAcXidjWP/ISmxQf+RsJQ2DVCWhNad/w5BEbwcyc3ipgNTf6s7uUPtKNZv3
 zj2rqCFkMuhaY3+7YsuGDxv3HYaJl9Mo/ej5RhERi+sliFJ6g/T0M9w+3e6KHIsDamtS
 v+CMC7DCQQ6QfENGHUFnLT1tImNB57oRcykwUJq68ghhUU1SgqWBz94l8dgVPmcO4yya
 /rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yszAsFqc28QlgSl+c1wF9p9bK0da0irdtwyIa0C0vMs=;
 b=5cy/LcTCDRmfM1/aUBWEMkA4m0rznrcHuUz5/PXlj1RmTJ00ml0NtSdKDzJ8adk82T
 z7C48XahUgIncvRYAPn4rIcTvji6FR56XomizV+04EpJsGWPnT8g8VbX7FeU6/pkOzOT
 j9T2UAKrCI0yphDq0e/1l/UDLVceDT57MWroNWRNAJqlV/Llr+D+kWylT+AFKT9mj2lI
 GEv+NhnGGS2IByeLLI5TqpeAXwRtH+WdyNk8qT3Wrcf08TUiAReWC5XFzV/dnkcFrFgs
 C3NcMoviItdtJLM/Z/yHEcF8lr4eItJz8g3YDDpYx+uKoPaDLhWXwlOE6PV1Kwthe9Bk
 fofQ==
X-Gm-Message-State: AOAM530f/hOi8lBVdS6E0WEygBjlTQi/Tn2eBs9RhTk4zzdHFXxdJGPg
 GZ+U7/c6EfjpTiiwoGB6xuThWA==
X-Google-Smtp-Source: ABdhPJxG3P97ChGddb9L9mt0VWWg+eVx1ewohCsU7gHem8avcgh+f0E1fVYN/N1y5dUgW+iHcre9nA==
X-Received: by 2002:aa7:d751:0:b0:419:2558:a78b with SMTP id
 a17-20020aa7d751000000b004192558a78bmr11132115eds.6.1648397336341; 
 Sun, 27 Mar 2022 09:08:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g2-20020aa7c842000000b0041314b98872sm5785602edt.22.2022.03.27.09.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:08:55 -0700 (PDT)
Message-ID: <946cbedd-3b59-97d0-888d-6f974bdab57f@mind.be>
Date: Sun, 27 Mar 2022 18:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220322174839.2189015-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220322174839.2189015-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/jack2: fix build with
 libexecinfo
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/03/2022 18:48, Fabrice Fontaine wrote:
> Fix the following build failure raised on uclibc and musl since the
> addition of libexecinfo package in commit
> eea8ba446c10701a273432552108d80fb2224ef4:
> 
> /home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: dbus/sigsegv.c.17.o: in function `signal_segv':
> sigsegv.c:(.text+0x98): undefined reference to `backtrace'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dca49cb9b3e66fac921601560e9358bcce9acffc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/jack2/jack2.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> index 2e55169984..127c99eed1 100644
> --- a/package/jack2/jack2.mk
> +++ b/package/jack2/jack2.mk
> @@ -14,6 +14,11 @@ JACK2_INSTALL_STAGING = YES
>   
>   JACK2_CONF_OPTS = --alsa
>   
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +JACK2_DEPENDENCIES += libexecinfo
> +JACK2_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
> +endif
> +
>   ifeq ($(BR2_PACKAGE_OPUS),y)
>   JACK2_DEPENDENCIES += opus
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
