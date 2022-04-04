Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD0FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 07:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21B40404C7;
	Mon,  4 Apr 2022 07:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuFeF4Ma0SpA; Mon,  4 Apr 2022 07:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 423C740291;
	Mon,  4 Apr 2022 07:34:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA8261BF306
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 07:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB3840291
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 07:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQ3ffZZ4cjPe for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 07:34:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05C0940186
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 07:34:35 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ot30so8079981ejb.12
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Jrhf4CuLnpCI824WLmPGUwPxr6yDrrjpurB+BhAq5gc=;
 b=gl9hLliNfcEYZowsUtZc6bfQhrTvmF0NtxdPlOg5kWpeoIP5WKlX2s1z3PEjyw4oar
 XZK9XutI2bE7ty4aj5KIgUeN5C1FOq/TiHHW2GG+KBkLGhQ4NyxfaTlCKgE8Ihk8mVfm
 CcdPgu9IM7Qq7zBT6cTctHr8xH3OUyFkls/39KnZXw7nphJkOxpSPDrh9xvU7YOFPb3u
 NSgV4WwVhR+jUzU0uh3n0zOHWhGB0MiMDlOskeR9c1E2rJBzj5Nm9g+PLnxk4E49eZWJ
 5UnYiaAVgaWQmTtxxJisV7M631/u07wgaikmeHyBiBnsZxWXzI5VLMQqPJ5uv+TEKCKo
 WwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Jrhf4CuLnpCI824WLmPGUwPxr6yDrrjpurB+BhAq5gc=;
 b=x+u5bbT7qEr1MATcnOAzAcVsveSKuNj8JhC6KW3i/OunqEmh0fzvkrBK/Mip7rQ4He
 gBlCnUIMA2uJ77xb/aizW6XG4sYwd4nI8kLbecENkZiiIV4b0vUlFRHIYxKIrBS+eyth
 unEuHDjqVXgYB1RKu5KJ3H4dXiZOrULy5ODA6g82c0TLtE+PCYUPhVMyl4XTdHdD+qm4
 A6EGWW6US7+XwT2Euu5Df+IrP0PCI1jPhpyl1K6G3rryKCqHb0Ha2uogJU3evcNiAEx4
 KmoX2gt8BfDJsZX8WJIQHU8Cb4ovzRP3+1YrWViYMpAi6qOws3c6TdH1gKRAkmRLWOKz
 l7NQ==
X-Gm-Message-State: AOAM530wbTxwl8MiFep5JyV7spK5zHVYZVYSp3artOIC+yF3rucRLqR9
 br/TT1DTFrBSe4vfrTejnL9RCA==
X-Google-Smtp-Source: ABdhPJwbXtY55JsQVn8SC4lFx6oWBmuuKzHkItRLYO6x2fDs/91ywScQcQuN7InCOzcJs56L2JoRxw==
X-Received: by 2002:a17:906:2bc1:b0:6cf:d009:7f6b with SMTP id
 n1-20020a1709062bc100b006cfd0097f6bmr9351317ejg.17.1649057674150; 
 Mon, 04 Apr 2022 00:34:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170906520400b006e0b798a0b8sm4033106ejm.94.2022.04.04.00.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 00:34:32 -0700 (PDT)
Message-ID: <01a5ba2d-a511-5322-5406-d1bc9bc95347@mind.be>
Date: Mon, 4 Apr 2022 09:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220403185306.928833-1-fontaine.fabrice@gmail.com>
 <20220403201530.GB2354230@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403201530.GB2354230@scaer>
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: fix build with
 libressl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/04/2022 22:15, Yann E. MORIN wrote:
> Fabrice, All,
> 
> On 2022-04-03 20:53 +0200, Fabrice Fontaine spake thusly:
>> Fix the following build failure with libressl raised since bump to
>> version 6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31 and
>> https://gitlab.com/fetchmail/fetchmail/-/commit/340d00bf9910ed55163be26435f70baf65a64f9d:
>>
>> configure: error: fetchmail cannot legally be linked against LibreSSL for lack of GPL2 clause 2b exception. See COPYING.
> 
> This sentence is incorrect. It is legally not possible to *distribute*
> fetchmail when linked against LibreSSL, as the GPL conditions in that
> case only trigger at the moment of distribution.
> 
> So, there should be no issue with linking fetchmail to LibreSSL for
> private use without redistribution.

  It would be nice though if this could be mentioned in legal-info.

  Regards,
  Arnout

> 
> But: IANAL, TINLA, TTYL...
> 
>> Fixes:
>>   - http://autobuild.buildroot.org/results/95ca66091efa0dafb7c4e8e8c7da1f929ef32d76
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>   package/fetchmail/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
>> index a4bf5a7c20..1017df34b2 100644
>> --- a/package/fetchmail/Config.in
>> +++ b/package/fetchmail/Config.in
>> @@ -3,6 +3,7 @@ config BR2_PACKAGE_FETCHMAIL
>>   	depends on BR2_USE_MMU # fork()
>>   	select BR2_PACKAGE_CA_CERTIFICATES
>>   	select BR2_PACKAGE_OPENSSL
>> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>>   	help
>>   	  Fetchmail - the mail-retrieval daemon
>>   	  Client daemon to move mail from POP and IMAP to your local
>> -- 
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
