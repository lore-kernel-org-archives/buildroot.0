Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4436C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E4484008;
	Thu,  3 Feb 2022 20:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67OjQRmlsDsA; Thu,  3 Feb 2022 20:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F4283FBC;
	Thu,  3 Feb 2022 20:42:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 412FF1BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F25F4048D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:42:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXqVYcn_PDnb for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:42:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A482401CA
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:42:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a8so12371989ejc.8
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MKfdatu9R8w1HcRF1gpn7TcEJhv2QNfNVj2o2HV/nHE=;
 b=Lfv731RFowjYR53XCZDQdF4Xn+DpCYm2eiOSK9Cg8BwjboE8k6L40xH+IcUfuovPwo
 np5NLLa18BYtFz2Oq/rHssjVkZa+ZItR0EPGZ/qaqAMON8978l+OCnJPuU3OqX3DKndy
 A9sW+6JFv/MOgoJvn3niZnQzdlDFh2rOgufEXxy5NpRN7EHEtv5AMWVTc+ckifUAMr+C
 84/XxIGW0iT8BVNUnUn7T68nyL3SI9WY8mpigNbzQ3pabO46OynT91KAE8SGU0NsAQ5t
 ZKgerBfDBSKfcvqCBLuJOqIV0wFa09GZ7rsvz4lmMW+7NkNRjbdeg2we40ha4e2ry2E3
 KkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MKfdatu9R8w1HcRF1gpn7TcEJhv2QNfNVj2o2HV/nHE=;
 b=mreNgr7sJkop1bzhNZAtozfpHlPomo3QBi4fVw6c8CvFsTzjGxsYcUj87QGss330zm
 IhL90dLa4y+ilJnpXfNxcsbVA+4C+t2AB4jGgZmCrJ3CZtOP6iawypXdvT74TeGxp0/9
 JqLCNUj4jJYx0xfYZVs3NQQ0FONwKDQddyaQq21MhFyqGiQl92lVOZfEsBfnW1LfxSd7
 srtXVtArXF4iNPdDvlwX7YbVjysZh7EVCt/Bc0ay8jeB0AV6J0WLNy5qomapWa1CsTSm
 G6oMDxyW2wnHcfftCftrtP7FTt+W9QBGGbGawsAzyONOHLfK68oLvattfKIsxjhDlCMG
 b9sw==
X-Gm-Message-State: AOAM533ZpsBDh/gkVZ25Vv3nt4dw0OQk9afFjqUskNYDs0SatHVcFGJH
 Fy1gS9td0WSH1xg0msOP00mV/pww/R5Gfw==
X-Google-Smtp-Source: ABdhPJxwGjN7DQR4zcomoWgvFJMOotIdBOnSAM8Sk7N6qnnTAcAQjz8IywiBxA1SFmOs05iHyt1Uog==
X-Received: by 2002:a17:907:728b:: with SMTP id
 dt11mr30431350ejc.70.1643920924337; 
 Thu, 03 Feb 2022 12:42:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v23sm17417712ejy.177.2022.02.03.12.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 12:42:03 -0800 (PST)
Message-ID: <79c74b43-e0c3-e25e-c64a-3ea36bc7cf85@mind.be>
Date: Thu, 3 Feb 2022 21:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220114084506.776644-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220114084506.776644-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/poppler: fix build failure due to
 gcc bug 68485
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/01/2022 09:45, Giulio Benetti wrote:
> The bullet package exhibits gcc bug 68485 when built for the Microblaze
> architecture with optimization enabled, which causes a build failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y like we
> already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/96e77ddba5042ba4dacb16b328fc298a4f00f49a/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/poppler/poppler.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index 9e9bfc9cba..18c044a9f6 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -131,4 +131,12 @@ else
>   POPPLER_CONF_OPTS += -DUSE_FLOAT=ON
>   endif
>   
> +POPPLER_CXXFLAGS = $(TARGET_CXXCFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +POPPLER_CXXFLAGS += -O0
> +endif
> +
> +POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(POPPLER_CXXFLAGS)"
> +
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
