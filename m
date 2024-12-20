Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF40E7718B
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96EB681492;
	Fri, 20 Dec 2024 22:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pb3SaeEZNOG; Fri, 20 Dec 2024 22:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8978681440
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8978681440;
	Fri, 20 Dec 2024 22:05:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B62B920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 22:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BF03407AD
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 22:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0khqHkW5C7T for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 22:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A42C1407A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42C1407A8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A42C1407A8
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 22:05:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F178D19F57B;
 Fri, 20 Dec 2024 23:05:11 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53742])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 23:05:11 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 23:05:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Cc: buildroot@buildroot.org
In-Reply-To: <a2ad6326ce72106f3d6c3397116e089f@zgyarmati.de>
References: <20241109175509.1364647-1-ju.o@free.fr>
 <a2ad6326ce72106f3d6c3397116e089f@zgyarmati.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <49fb2917e2ac8bfebafe09a39dc5d817@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734732313;
 bh=7scg92+l4NicKrA0/iC+Nn+Yu6DELfoDPEN2vToo9n0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oXuR8fvxZHnu2vTcg6RYKf3PoFqHYTlX1MU7bhwr+R5RtEZ//pC9Lm/swOWHzg9C3
 2mAp6wa1Atfb8gqTIo/TuhDCCqmPFypA9m512ltF2LBueU4FUxLIpxwJsdF+V+NuPC
 GRLHg8ZCxIU6ywPzT1XYP1Gq5X7Vz9F3ZhV5N+JAljH8XxkS+gR5i+EOYh/UOUNXBI
 VBYrMPw6UCycPd9IwxLltpWRJPS6wL0EI3d5Gs3mXa8JPJCh95uYYpFjZs6lf2zehp
 ETXFG+oYJ5GRCzdWoSH/r9PEqf5MSWO/YoU+xQVXYA+aFc8rEOpfwmE3K0IIhAgPBR
 oWm2siV4Kep7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oXuR8fvx
Subject: Re: [Buildroot] [PATCH 1/2] package/proj: add an option to build
 and install apps
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Zoltan,

On 20/12/2024 22:01, Zoltan Gyarmati wrote:
> On 2024-11-09 18:55, Julien Olivain wrote:
> 
>> The proj package includes command line applications. Those have always
>> been disabled in Buildroot. Those applications can be useful for
>> scripting, and also for runtime testing the libraries.
>> 
>> This commit adds a package Kconfig option to enable those apps.
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> Tested-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

Thanks for testing!  I applied this series to master.

>> ---
>> package/proj/Config.in | 12 ++++++++++++
>> package/proj/proj.mk   |  2 +-
>> 2 files changed, 13 insertions(+), 1 deletion(-)
>> 
>> diff --git a/package/proj/Config.in b/package/proj/Config.in
>> index 6d172e2ee9..86966a4d10 100644
>> --- a/package/proj/Config.in
>> +++ b/package/proj/Config.in
>> @@ -14,6 +14,18 @@ config BR2_PACKAGE_PROJ
>> 
>> http://proj4.org/
>> 
>> +if BR2_PACKAGE_PROJ
>> +
>> +config BR2_PACKAGE_PROJ_APPS
>> +    bool "build apps"
>> +    select BR2_PACKAGE_LIBCURL
>> +    help
>> +      Build and install proj command line apps. Those command line
>> +      applications are: cct, cs2cs, geod, gie, invgeod, invproj,
>> +      proj, projinfo, projsync.
>> +
>> +endif
>> +
>> comment "proj needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
>> depends on !BR2_INSTALL_LIBSTDCPP || \
>> !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
>> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
>> index a17a0a1feb..d6457b0e5b 100644
>> --- a/package/proj/proj.mk
>> +++ b/package/proj/proj.mk
>> @@ -20,7 +20,7 @@ PROJ_CXXFLAGS += -O0
>> endif
>> 
>> PROJ_CONF_OPTS = \
>> -    -DBUILD_APPS=OFF \
>> +    -DBUILD_APPS=$(if $(BR2_PACKAGE_PROJ_APPS),ON,OFF) \
>> -DCMAKE_C_FLAGS="$(PROJ_CFLAGS)" \
>> -DCMAKE_CXX_FLAGS="$(PROJ_CXXFLAGS)"
> 
> 
> --
> https://zgyarmati.de

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
