Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20314C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C991260F95;
	Mon,  2 May 2022 21:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ArMKt_SFIkNR; Mon,  2 May 2022 21:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB1960E2A;
	Mon,  2 May 2022 21:58:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 147C61BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1121B8301F
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gv9bGau8kwwD for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:58:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 124B180B54
 for <buildroot@busybox.net>; Mon,  2 May 2022 21:58:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bv19so30171769ejb.6
 for <buildroot@busybox.net>; Mon, 02 May 2022 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=EP6+3z07UWi66i4v48XFuZd6PWx76KDyrYsxD9UfIFs=;
 b=PKBzY15JW9LuJuJyL586AKd62js6sbHRnIL5fPeBtUTgSSZ9L3vvncKytgPwEM4c6p
 Ao5zNaxd+8rJALgQ23U3jsGC3fxKzK455rB5bwGDy2/5C+CJRPAB01mHxD5+zKN4P+cM
 LRMxYQ2MXbKyNmaa9R6qhrbH1cZ4zfbGo7a+5FSfOci/awY4LbLJ2OBqZv7/e1timc+I
 K4NmFmkZeBQUbkZwjBxmtqPD6ZMfZ2BI/tgfHvfbSKxzJOtpqvpAR6Lhy8cm6646Y+Ss
 VOMdW25E48V3jeKQGly4Jpxh4ubMAMTtAWvcI29ZA8qcPyDYWhX77ZtMTVDWN5q1UMLS
 XYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EP6+3z07UWi66i4v48XFuZd6PWx76KDyrYsxD9UfIFs=;
 b=ZnW7hFcPK4dLuoyFgMUITPdGRS8GYWR0t2U26hX0wLUwuUy4wIF7ESCI3ahQ2O4nIi
 U7+TqtXp7/pqzw6l5gI/DIWZTVGj8p70QPoTviz6M9zIbhE3IP7bdGw2YyEaqNKVhSYF
 dayEe6mxbnpULn8DtPa5uW4ltR/ybqmcVzblcnB75gB8tTMAIL3kqSpfkDA5kblCHQpB
 Hd5D0GOc7SBqo0yxjGa8LFXDCoUAvqoGTA1QhRK7EY2hz7ZILB3EPUpQgsGJhZcmxZxg
 4E5pmAx5bQk7of/cWuZ+PvUwqhtoJT+XuC+GxbHLgfqexjuU2vr/dGe6EK42OaMfJ175
 6awA==
X-Gm-Message-State: AOAM5311B0dtY/8w7nBDBohRNWgKkuWjlazlnAWYhfUuieVpfoVhcHzO
 EcQy2xnfG4uOzEfP2W+fyDo2eQ==
X-Google-Smtp-Source: ABdhPJx4R03ncKATFi2a7V0zI8d517bh9k8iLClSOxE3rffZaTDSB4XG/lhNh8kRT+sZKyLvkcuXMA==
X-Received: by 2002:a17:907:1623:b0:6e8:8678:640d with SMTP id
 hb35-20020a170907162300b006e88678640dmr12793304ejc.189.1651528702385; 
 Mon, 02 May 2022 14:58:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a056402149900b0042617ba63d5sm7083572edv.95.2022.05.02.14.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:21 -0700 (PDT)
Message-ID: <fb6d36d8-d2d1-b5be-533e-ac331582dae2@mind.be>
Date: Mon, 2 May 2022 23:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220502201209.92316-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502201209.92316-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/sqlite: bump to version 3.38.3
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



On 02/05/2022 22:12, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sqlite/sqlite.hash | 2 +-
>   package/sqlite/sqlite.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
> index 882cf8564..12a543f00 100644
> --- a/package/sqlite/sqlite.hash
> +++ b/package/sqlite/sqlite.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e7974aa1430bad690a5e9f79a6ee5c8492ada8269dc675875ad0fb747d7cada4  sqlite-autoconf-3380200.tar.gz
> +sha256  61f2dd93a2e38c33468b7125967c3218bf9f4dd8365def6025e314f905dc942e  sqlite-autoconf-3380300.tar.gz
>   sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index 9f88af7ae..3ba120df8 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -SQLITE_VERSION = 3.38.2
> -SQLITE_TAR_VERSION = 3380200
> +SQLITE_VERSION = 3.38.3
> +SQLITE_TAR_VERSION = 3380300
>   SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
>   SQLITE_SITE = https://www.sqlite.org/2022
>   SQLITE_LICENSE = Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
