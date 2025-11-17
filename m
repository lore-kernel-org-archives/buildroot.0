Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A47CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D5D6118B;
	Mon, 17 Nov 2025 19:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBNlefqUCwnO; Mon, 17 Nov 2025 19:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED8C60FBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED8C60FBE;
	Mon, 17 Nov 2025 19:56:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C02011BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A662A81761
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yn2S3sZV3QKx for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:56:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A72DE81701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A72DE81701
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A72DE81701
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:56:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF518B979430; Mon, 17 Nov 2025 20:56:53 +0100 (CET)
Message-ID: <784a8733-7e61-4805-9497-14bb47f97e2e@rnout.be>
Date: Mon, 17 Nov 2025 20:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251030214156.1307743-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251030214156.1307743-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409413; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1o2IesaArTa6t9zVaKH1mBgxBVnDC7m95TWOLyJ2cOM=;
 b=RspNomDju3ofG/bhIpY1kSfVblLMuItkFNd57on2CKO4O8Z7y31zI49xjFiBNP9iqAOxUl
 VikOHevdPfOTbCNdE8oLVt8Bx7+OMv4RtS9ZP47Eu+d4uevUSMdGeRd9ikeYoX2zKUEN1N
 XUjvBwTeWR0f/LLfLcOZsMe/ZbS+jHeoUW7V+XoCuSM7/zCowOTG3+TuOGC1IKIBMZcFnh
 JXd0nkwucN3rpUXQt8Jc+XJK4BoLMsMk/JsdlotYxvHR+BM0VuwaqXNjqaCub6OBxg9lC0
 xAWoNTnhefPRoWz8/8RZkb7NsU7JCL9n8po3ZPkZd2AljwENt0bZmPHyB+FD2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=RspNomDj
Subject: Re: [Buildroot] [PATCH 1/5] package/bind: drop unrecognized option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/10/2025 22:41, Bernd Kuhls wrote:
> Buildroot commits 7b43e248180ad3b3dd1804687bc4457f29a88137 and
> 8adeaec8afacbc680edebae91524f6144926ac92 removed the possibility for
> static builds but forgot to remove some related _CONF_OPTS.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied all 5 to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/bind/bind.mk | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 350f6c6fbe..11730b6e7e 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -109,16 +109,6 @@ else
>   BIND_CONF_OPTS += --with-readline=no
>   endif
>   
> -ifeq ($(BR2_STATIC_LIBS),y)
> -BIND_CONF_OPTS += \
> -	--without-dlopen \
> -	--without-libtool
> -else
> -BIND_CONF_OPTS += \
> -	--with-dlopen \
> -	--with-libtool
> -endif
> -
>   define BIND_TARGET_REMOVE_SERVER
>   	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/, $(BIND_TARGET_SERVER_SBIN))
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
