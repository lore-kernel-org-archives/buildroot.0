Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96522C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 14:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5496D40533;
	Wed, 26 Aug 2026 14:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUz45lkVVpq0; Wed, 26 Aug 2026 14:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787754927;
	bh=vawxQ9ERYbrXcJF5tiCBRqgWLyJWo6Yq9NK+mwDP4vQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NF1siuEKZxQbZdDU6IK6INnwDeOeLfcb7GVMpcuKrrfT6dMpf3JJG9/uhlj0livAf
	 8CQ/7kjpWz+fl4qsCLO61whjWcH/Bzc8nHhTc/kgsTuTt6LFm1OlHGDgMtL7WKRCpT
	 QmB7/kCVbA6hrGmW5ikJd0OJaqxox+p4iO7MXrKpyOVy3dpdRChCC2nHNWOLY17VdG
	 rkOOtQWRy+P4LzfCS/Cu6C0QkUFumo+/wnO6VYhw+A7Fb0c5LyvQ9lV1kuAeKezidx
	 wL9A+NVjUDkXbbCA40k1hQNxEeIcq+NhcCj/rEdge+zQm8XgvhHDUuprY7MndhIHp7
	 U9pF6Cp3pbKzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A43B240501;
	Wed, 26 Aug 2026 14:35:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2065396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8828F40501
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2a1Gbklaa-Ft for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 14:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 494FF404E8
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:35:22 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:b3e6:a057:7cc:5484] (unknown
 [IPv6:2a01:e0a:1164:dba0:b3e6:a057:7cc:5484])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 48EB8184A59;
 Wed, 26 Aug 2026 16:35:20 +0200 (CEST)
Message-ID: <7458079d-fecc-4bf1-94ed-e428e4d1bf82@grenoble.cnrs.fr>
Date: Wed, 26 Aug 2026 16:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
References: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US, fr
In-Reply-To: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/qt6/qt6declarative: move
 comment where it belongs
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, all,

On 2026-08-26, Thomas Petazzoni wrote:
> The commit "Enable host test module to ensure that qmltestrunner is

s/commit/comment/

Regards,

Edgar.

> built" in qt6declarative's Config.in feels lonely under
> BR2_PACKAGE_QT6DECLARATIVE. It's because it's actually related to a
> select done in the sub-option BR2_PACKAGE_QT6DECLARATIVE_QUICK, so
> move it there.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/qt6/qt6declarative/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
> index 0a977ed808..a57b203071 100644
> --- a/package/qt6/qt6declarative/Config.in
> +++ b/package/qt6/qt6declarative/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_QT6DECLARATIVE
>  	bool "qt6declarative"
> -	# Enable host test module to ensure that qmltestrunner is built
>  	help
>  	  Qt is a cross-platform application and UI framework for
>  	  developers using C++.
> @@ -13,6 +12,7 @@ if BR2_PACKAGE_QT6DECLARATIVE
>  
>  config BR2_PACKAGE_QT6DECLARATIVE_QUICK
>  	bool "quick module"
> +	# Enable host test module to ensure that qmltestrunner is built
>  	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
>  	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
>  	select BR2_PACKAGE_QT6BASE_GUI

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
