Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388F9C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E146683367;
	Tue, 14 Jun 2022 16:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3didW_CSiQnb; Tue, 14 Jun 2022 16:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B7783312;
	Tue, 14 Jun 2022 16:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD2B1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18B0760B02
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvR2S3bu_COi for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:56:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2470660AAD
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:56:23 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id y19so18366056ejq.6
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+wXF1YoF3hYTRxVl8sVyVTD3Uat8Frx5mXAGd5OCEXA=;
 b=an77iuqqHKkgjQGX/JtTxkhAKXf+akYWtC7V7morn77Pb2TjtZo2oKHRPmngUS+x1l
 gDU0uWVGIN+LO8AVDagAuCM8DnAeUGPA0LdvYNRQiG2WPj0FNdSE3yZfBJ3rzy1lgS+/
 IszGbUN3ywaD7RLRGA1/QOI/CQkZurC4QpcA9uUJrZKoX9jzcQ42eWkKEuqcAhLEC/LQ
 As6/bCkD6UJShGLsukQf0d6yUuXhQrrUQQK2VVkgXUuM8TD5xmmX0cpWoTmi6Tu3s3/v
 FFYG5bzBrZE68VLWj6ix8lImuJAVhPrMpTnzFOKxiBTJySD+4pxGQr6w57RHmKxaqQkA
 Ol6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+wXF1YoF3hYTRxVl8sVyVTD3Uat8Frx5mXAGd5OCEXA=;
 b=YwxhmnP1WQ0dD2rfW5UMCf6ye6kkL5tzjiXL7Oex+hGaltVejeL8gbUiJyyeO2deLb
 lUx96bJP+jOD9uCheZLo3k5+EtM3GmJF2ssNBHpnmR244PRaZWNf9dc99Sis8hiBI2b+
 NSRyJhRoCQ+ZV89rDt/ekCot7Dow1grP3ZddF8RoDg90f59pc0OOvM0msTiLRv057b8/
 jq3bgZX6fzu6ODUtzOVQQHh7W1rB/MU0N96V08MqV2pXPFtm0OkUfAimccIlB8Xml5mq
 ek6/tjvgUvUdguPvd+OAjvdjbE/7vc1cUcyv3xr7xjvkwNYTqH8MiqEoARiW0NXn12t2
 2jIQ==
X-Gm-Message-State: AOAM531LpyFHoowha6s6iR5UyDlZaX69z9DPrfWE9ugNUL4vK0VbC7RE
 QBZAH3YYI6OzGIRp4P6B0UHO/w==
X-Google-Smtp-Source: AGRyM1s474atqwnY3SPc7uwkHGVRA6k2xWXhxhnq3uxUOdKF+1f8jO6ufvBiqxsflOeSU5GWdQL8YQ==
X-Received: by 2002:a17:907:7811:b0:6ef:a896:b407 with SMTP id
 la17-20020a170907781100b006efa896b407mr4896363ejc.645.1655225781377; 
 Tue, 14 Jun 2022 09:56:21 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 w17-20020a056402269100b0042de3d661d2sm7675741edd.1.2022.06.14.09.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:56:20 -0700 (PDT)
Message-ID: <450d6d32-d279-1d7c-574d-05af03fbf846@mind.be>
Date: Tue, 14 Jun 2022 18:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220610210820.3645527-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610210820.3645527-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/logrotate: security bump to
 version 3.20.1
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/06/2022 23:08, Fabrice Fontaine wrote:
> Fix CVE-2022-1348: A vulnerability was found in logrotate in how the
> state file is created. The state file is used to prevent parallel
> executions of multiple instances of logrotate by acquiring and releasing
> a file lock. When the state file does not exist, it is created with
> world-readable permission, allowing an unprivileged user to lock the
> state file, stopping any rotation. This flaw affects logrotate versions
> before 3.20.
> 
> https://github.com/logrotate/logrotate/blob/3.20.1/ChangeLog.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/logrotate/logrotate.hash | 2 +-
>   package/logrotate/logrotate.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
> index 2af46d60b7..9c8e73f738 100644
> --- a/package/logrotate/logrotate.hash
> +++ b/package/logrotate/logrotate.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5  logrotate-3.18.0.tar.xz
> +sha256  742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094  logrotate-3.20.1.tar.xz
> diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
> index 4d1344c2cd..453dbe477a 100644
> --- a/package/logrotate/logrotate.mk
> +++ b/package/logrotate/logrotate.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LOGROTATE_VERSION = 3.18.0
> -LOGROTATE_SOURCE = logrotate-3.18.0.tar.xz
> +LOGROTATE_VERSION = 3.20.1
> +LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.xz
>   LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
>   LOGROTATE_LICENSE = GPL-2.0+
>   LOGROTATE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
