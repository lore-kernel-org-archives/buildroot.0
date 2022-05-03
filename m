Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40554C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 06:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A5C60FD9;
	Tue,  3 May 2022 06:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEmO1H30EXAm; Tue,  3 May 2022 06:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA70960FCB;
	Tue,  3 May 2022 06:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5B11BF2F7
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 06:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5006241527
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 06:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbPccFP-d9AG for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 06:41:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 167584151E
 for <buildroot@buildroot.org>; Tue,  3 May 2022 06:41:16 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id a1so18822477edt.3
 for <buildroot@buildroot.org>; Mon, 02 May 2022 23:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=4S9OQvnJxiof8hmjTMT34GJrK7FRyfzPfjRYWExgT/c=;
 b=JNPpMRIR1AGIFhYjQPmw99RS9w/w41b8QIjvjyNIszllk/giFhAIYESyX8dF9ypEEp
 uXUt5jQITS7iPD0wGXY/OIJJQxUW7UIujR5CHlbnuz6zMqupdvMAHpTFc0nn0cZHjmUS
 YuARyi65VvWevCbY/8qGKel9/bZrxRpsU4cXkMwf5KDIQ/afGM+ETJsbX1VEbdlgUKZ3
 PNSUtAbnuJTcMpe0H6eHEdVvpVkRgMszp+IRUW1Va8Y8224+OPQ+rb4ogilz0tkF5KBN
 0XiDDhJPNFjJuE2DaLL6UG33C1FUSWBpDMpVR5APevCA4q3GYHsuwTI9oFFRwd6pSIAm
 C7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4S9OQvnJxiof8hmjTMT34GJrK7FRyfzPfjRYWExgT/c=;
 b=vv1C31Ayf6F+jDS7LXp9/ksUxLzHwhhixP2TzP1avIr0k73yCdcpyCvPRyXmDZlaNv
 c14ntgBgL6dW3TY4G2CvvxKjGXTKL05jIgnLSCr5boDAcYJ0YHs9G50ze9CA5SKCv0hj
 q5mf3u5DMxImlJOie+NaHNftblvOvnG7sHkLlzlVOt3SxwvYNk/AmSO+DBd2w9O7rstv
 B4RuAcS5j0VmjGAP0XxrcNdrkYAaRxVIndxovlhOjy9WZc/Rmkkke0rOXKL206FsRSbx
 TcIFqF2loWICoMlLSy36bRuqALnpQEZeSRgYQ3NckyXreY6+cUlJEuunQnJkVNazj1I5
 0OOg==
X-Gm-Message-State: AOAM532eMUVBlOiv/CFtzh2NijXsvgCAQ6V7XBOCN9gsVnYtw4qKPKmV
 X0wZ2vRg2vS2/2P1kSphvbrukGJkBgV01w==
X-Google-Smtp-Source: ABdhPJyw6dtzloUaYpImKfZgqMGpDDtoOIKEOD7+aCN+RIQ8zLCKENdTxIdyU3PonpMRyaBZrt8WZw==
X-Received: by 2002:a50:8a96:0:b0:425:e046:76d9 with SMTP id
 j22-20020a508a96000000b00425e04676d9mr16589902edj.115.1651560075023; 
 Mon, 02 May 2022 23:41:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a05640212cd00b0042617ba63d6sm7478434edx.96.2022.05.02.23.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 23:41:14 -0700 (PDT)
Message-ID: <82d1991b-48c4-c767-dfe3-b28264eca4d0@mind.be>
Date: Tue, 3 May 2022 08:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220503023117.266256-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220503023117.266256-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add DTS cuimage
 fixup
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



On 03/05/2022 04:31, James Hilliard wrote:
> If we don't have a DTS name or path we need to also disable cuimage
> to disable DTS support as BR2_LINUX_KERNEL_CUIMAGE requires DTS
> support.
> 
> Fixes:
> linux/linux.mk:591: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings.  Stop.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   utils/genrandconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 70af84f002..b821e60114 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -381,6 +381,9 @@ def fixup_config(sysinfo, configfile):
>           if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
>               configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
>               configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
> +        if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines:

  Similar to the previous patch (only fixup host uboot tools ...), should this 
be done only if no DTS is given? I.e.:

if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines and \
     ('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines or \
      'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines):


  Regards,
  Arnout

> +            configlines.remove('BR2_LINUX_KERNEL_CUIMAGE=y\n')
> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
>           if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
>               configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
>               configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
