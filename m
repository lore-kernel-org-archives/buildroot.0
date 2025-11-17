Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD71CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3566612D5;
	Mon, 17 Nov 2025 20:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mI4HI4RSQD39; Mon, 17 Nov 2025 20:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECB2160ECB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECB2160ECB;
	Mon, 17 Nov 2025 20:00:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EACEC158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCD4C82F87
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAfzOAq9foBS for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAEA982332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAEA982332
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAEA982332
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:00:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE55BB979430; Mon, 17 Nov 2025 21:00:33 +0100 (CET)
Message-ID: <aa746a3c-a6ce-4113-ac90-cf425a630233@rnout.be>
Date: Mon, 17 Nov 2025 21:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <20251102084414.241614-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251102084414.241614-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=CNLZoOwUx1leBs2rqI9r8a/hcf7qU3N934Eiey7Ba4w=;
 b=B4SlVkx5vzjvWNgu3RMZ7sn20uub6jXs2TZY22aMOSSuqPHPuvczCHRJ5dQbIYNQWAKk0W
 lBlqn6hJaYpEO0jyzpBAQbdvo7KxFN2oUcF74oVnddWOOr8pSSbo/lnH9RP7as5YlhnDIP
 Epv+srdxQRn0Ahg2D6msFJsItjMnryz65HnI2waN6SsG7dTMbZmbcWMxZOsSED/9P+Vmfr
 3ZGp3xWmm3zMmUfOj2uaLHpQoIOT9dK8Asv045rOz+woQPO/BifWVrI7Q9Noc0GupYQs7c
 ZhmgO021wwJy2cT2rvpvNVjrUycy3GgREJjsYeYckWLlDdkmVwPImDjNyz+QMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=B4SlVkx5
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: link with libatomic if
 needed
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



On 02/11/2025 09:44, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/f4f/f4fb970f8d4f2f7966fcbd542768a607ea7ababf/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/crun/crun.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/crun/crun.mk b/package/crun/crun.mk
> index b4db276602..02d0b3d62f 100644
> --- a/package/crun/crun.mk
> +++ b/package/crun/crun.mk
> @@ -15,6 +15,10 @@ CRUN_CPE_ID_VALID = YES
>   CRUN_AUTORECONF = YES
>   CRUN_CONF_OPTS = --disable-embedded-yajl
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +CRUN_CONF_ENV += LIBS=-latomic
> +endif
> +
>   ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
>   CRUN_DEPENDENCIES += argp-standalone
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
