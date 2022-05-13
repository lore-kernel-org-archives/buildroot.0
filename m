Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75B7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A54814099B;
	Fri, 13 May 2022 22:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rN9eYkh9I6J; Fri, 13 May 2022 22:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50A244095F;
	Fri, 13 May 2022 22:11:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67F271BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64F3583F7C
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eg96kIL8sgg8 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 534DC827C9
 for <buildroot@busybox.net>; Fri, 13 May 2022 22:11:20 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s11so7672554edy.6
 for <buildroot@busybox.net>; Fri, 13 May 2022 15:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=QJdh48yEeXwMGDp6WrZpuSBdEw7+x/5LBGUra7pKUts=;
 b=SOR1Pt1Jjh+HjhEc0Bsk+uimAnt72jUHDo1oqopnly0oBs3wbaS5uWpaCDCz8sSBmv
 Bv9ZbqgXHf3lFNvZrVyBMLUwLnhpo/9aeUiQXpGF6KZwtWmR4lqgETfT2Bwh27AMkz20
 5xADWg71nWGlbOnSaYvERM6G1tv/54BTQDfs2rOYWeeYd9zINUvV/wKxO3rVzR6fabif
 kbsWY95+HdPs+8BBzXXFOVtA8j4QA1YOTL6nT+rGxdxcYWIKbszsm/74uAOvIqqg3NkF
 akHZIZH7du5+8rcUnyVQ2OqN/713tj8CvXJgMpXRt7HM7IHnvKjtNJ8IEf4z2MIYBKFF
 s/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QJdh48yEeXwMGDp6WrZpuSBdEw7+x/5LBGUra7pKUts=;
 b=3yTTkJ2ba/T8S2EN+vuk1X3c9Lwv5z9GKOzq2Yig/L7Il3ZYy6ipbXqA6+BWKq38y7
 /Rt8xWa+qvNZOlt3Dy8ALt2k/l5z+dF8oNtAPciZ3d+CVLdk2fSdvTSiF4BDRL//Pfv2
 vf0rsn35IEPPyQiWzAgG8azmfRGBV6tyzg9Owzg6/EhqeSy36CH24D+BvGeqfIQA7SP6
 xAtPk4PNHP+l1C7UhO3onXMZLpdvBVy+9OjQHE+VyNltIu3kdcoGRGu+HGuxt+OxBB5n
 ROxpacqrwnSrQ21KnuBHDC2B48eHUSD+rX24TffqLLZERCQacIzdsNWMlz/xTnxJpPCP
 rXiQ==
X-Gm-Message-State: AOAM532PWMGKLn14tIuYvwO05LwrqTX05juQ/Wt4PmAVFUTCxfwFT8m9
 r9jr6sumxZkoefdckNqZ21dlHw==
X-Google-Smtp-Source: ABdhPJyoMyv3/Jyxyd9ntqg+cuWnK+5ynSgkYfo7ZAmGSgvb6+uvK6EvkOATSmlrWuj6wFkSNeUeJw==
X-Received: by 2002:a50:9b43:0:b0:42a:34e4:3339 with SMTP id
 a3-20020a509b43000000b0042a34e43339mr752518edj.381.1652479878157; 
 Fri, 13 May 2022 15:11:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a50a6d3000000b0042617ba6392sm1412891edc.28.2022.05.13.15.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:11:17 -0700 (PDT)
Message-ID: <6025713a-36a3-9fd0-7567-3fab47ff1f8f@mind.be>
Date: Sat, 14 May 2022 00:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220508133612.150132-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220508133612.150132-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.2.4
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



On 08/05/2022 15:36, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch         | 8 ++++----
>   package/open62541/Config.in                               | 2 +-
>   package/open62541/open62541.hash                          | 2 +-
>   package/open62541/open62541.mk                            | 2 +-
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
> index f912445b7..9e6dda26e 100644
> --- a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
> +++ b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
> @@ -29,16 +29,16 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
>   index bc839f27..963460d0 100644
>   --- a/CMakeLists.txt
>   +++ b/CMakeLists.txt
> -@@ -292,6 +292,8 @@ if(UA_FORCE_CPP)
> +@@ -257,6 +257,8 @@ if(UA_FORCE_CPP)
>        add_definitions(-D__STDC_CONSTANT_MACROS) # We need the UINT32_C define
>    endif()
>    
>   +option(UA_FORCE_WERROR "Force compilation with -Werror" ON)
>   +
>    #General PubSub setup
> - option(UA_ENABLE_PUBSUB "Enable the PubSub protocol" OFF)
> -
> -@@ -589,7 +591,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
> + option(UA_ENABLE_PUBSUB "Enable publish/subscribe" OFF)
> + mark_as_advanced(UA_ENABLE_PUBSUB)
> +@@ -526,7 +528,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
>        check_add_cc_flag("-Wall")      # Warnings
>        check_add_cc_flag("-Wextra")    # More warnings
>        check_add_cc_flag("-Wpedantic") # Standard compliance
> diff --git a/package/open62541/Config.in b/package/open62541/Config.in
> index a835595e8..220fb3dfa 100644
> --- a/package/open62541/Config.in
> +++ b/package/open62541/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_OPEN62541
>   	help
>   	  open62541 is an open source and free implementation of OPC UA.
>   
> -	  http://open62541.org
> +	  https://open62541.org/
>   
>   if BR2_PACKAGE_OPEN62541
>   
> diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
> index 5aa340ac1..3257bfe47 100644
> --- a/package/open62541/open62541.hash
> +++ b/package/open62541/open62541.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  c59c85b519a18350f5014b6e7b7545ee144ceeb15094e75b0b7ecec7dce43dd0  open62541-v1.2.2-br1.tar.gz
> +sha256  e2e1b8e6285c4fd6d8e07f37d61a8728376d525e169fadb3d61918fa6a7c271a  open62541-v1.2.4-br1.tar.gz
>   sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 627c29e95..87bd3449b 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPEN62541_VERSION = v1.2.2
> +OPEN62541_VERSION = v1.2.4
>   OPEN62541_SITE_METHOD = git
>   OPEN62541_SITE = https://github.com/open62541/open62541.git
>   OPEN62541_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
