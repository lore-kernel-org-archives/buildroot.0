Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4476BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBEB1826D5;
	Mon,  4 Apr 2022 19:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcpdjoHUtDgR; Mon,  4 Apr 2022 19:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B078268F;
	Mon,  4 Apr 2022 19:29:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7855E1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 669D7402F9
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6YIDkOT-A3J for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:29:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4825C402B5
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:29:22 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r10so6624036eda.1
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2g7fvqJDvHJ0GlVoTMLrLPbT0U1qB2zCL3pNTyS+ohI=;
 b=eJeu+I9VVmbqFpsOqIc1f9Ft+06liMGlrr7O0EydtvMv5cSETEzhQz8b9w4lFpICN3
 Oxa2pEETxc3WKLNoTxUO/yDK4GiMLoEBb9Fel1iY5Q1/Mq/rwJXwMNkgD5c3ecJmA++0
 3LkxVnbLiRlJPo/QMdFEx+j2uqiIgjMvHNFeKYKmqASmYeYRAcpBTgAkJ1mfeV0PZCSC
 t0tFqSQSJ2AYbicFBbysNpIXl0jpQJCJBHUAhQDzcwLn323hXWxRKCrZbLyDrfHcgVyI
 3h+kFKPBNlTcV19hGmf1H6GE3Pki/J8Z2BaW7uKE5qm+PpQCqgVcgzbME/p0dAkS+6lw
 RttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2g7fvqJDvHJ0GlVoTMLrLPbT0U1qB2zCL3pNTyS+ohI=;
 b=6uPz6DXaSU8SAZ7wp1fPQjHt4G+RW5UPO74fzGCgtChxUmtpkhDOaMIAhLrD/W5nqm
 oIowIZo8d2IAybfgzsKP+cNy1ghNTlfRQzb8uKSeG0kN64WPMj962ErqsePvh4f5H529
 5IihY+0exikt5sWHBv27J7L00wIIbHVDKuXx5WxxYC692JYL+Mv5MSOyY/jg+Ilah0f/
 rfD9CfFuSnrTlQPYtXjVomKukHJgytKUOKenpGm2PpQT+AYY59XQ2ewgQHCTAWq22x7M
 g5///u2ilyyUG0NMsTsHWu+uZCSoTiKBLgXw5M5CwwlydtFU+Q6nKsUMFztZwj5kv5Fj
 Qcnw==
X-Gm-Message-State: AOAM531fVwuzpXc8xvKiawiMixN73PE7FBHczLt/S1TEFAdgayjYQ9RT
 jZK/9PK6+cxIpdEOXcgNFS6ykw==
X-Google-Smtp-Source: ABdhPJzZiIfJWUmGBifSNcrEj9LnKzCrKNzyjI/RMUGRT9t1d3zmzToGmIa3v6s5WkFuUhyaFIDBzw==
X-Received: by 2002:a50:8707:0:b0:41a:68df:1a6e with SMTP id
 i7-20020a508707000000b0041a68df1a6emr1787726edb.31.1649100560466; 
 Mon, 04 Apr 2022 12:29:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a170906550100b006e116636338sm4736223ejp.2.2022.04.04.12.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:29:20 -0700 (PDT)
Message-ID: <6f698442-f6c6-69ef-81a9-5904a258db4a@mind.be>
Date: Mon, 4 Apr 2022 21:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220403090340.2319112-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403090340.2319112-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cloop: fix build with gcc >= 9
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/04/2022 11:03, Fabrice Fontaine wrote:
> Fix the following build failure with gcc >= 9 (and -std=c++17):
> 
> ./file.h:70:43: error: ISO C++17 does not allow dynamic exception specifications
>     70 | bool file_exists(const std::string& file) throw (error);
>        |                                           ^~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8320edd448cd1f7c14a65734f63a2df5d4b0d442
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cloop/cloop.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
> index f3c4954ead..6f6d5fe6a8 100644
> --- a/package/cloop/cloop.mk
> +++ b/package/cloop/cloop.mk
> @@ -14,7 +14,7 @@ HOST_CLOOP_DEPENDENCIES = host-zlib
>   
>   define HOST_CLOOP_BUILD_CMDS
>   	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes \
> -		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE"
> +		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE" CPPFLAGS="-std=c++14"
>   endef
>   
>   define HOST_CLOOP_INSTALL_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
