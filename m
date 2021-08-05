Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372FDC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:39:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40BF60720
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C40BF60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99816403B3;
	Thu,  5 Aug 2021 07:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQXW0NJ46jO4; Thu,  5 Aug 2021 07:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C24D40390;
	Thu,  5 Aug 2021 07:39:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 004FF1BF859
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E220E40263
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPlEzUI1Oh7u for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 07:38:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3AE540259
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 07:38:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (10)
Received: from [192.168.65.122] (95.143.241.142.ultranet.net.pl
 [95.143.241.142])
 by server220076.nazwa.pl (Postfix) with ESMTP id 553361C4259;
 Thu,  5 Aug 2021 09:38:55 +0200 (CEST)
To: Arnout Vandecappelle <arnout@mind.be>
References: <20210803143654.550783-1-b.bilas@grinn-global.com>
 <1e2a20e9-3c43-8de3-a954-be4543e77edf@mind.be>
From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Message-ID: <86b2e396-7919-de0d-e9dc-03e1869850df@grinn-global.com>
Date: Thu, 5 Aug 2021 09:38:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1e2a20e9-3c43-8de3-a954-be4543e77edf@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] package/cegui: disable OpenGLES renderer
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Arnout,

On 8/4/21 10:49 PM, Arnout Vandecappelle wrote:
>
> On 03/08/2021 16:36, Bartosz Bilas wrote:
>> Support of OpenGLES generates tons of autobuilders failures
>> so let's disable it till upstream finds a solution for that.
>>
>> Fixes:
>>   http://autobuild.buildroot.net/results/41d/41d10c09472fbb8481a72c4f8bed789bb15bb3c2//
>>   http://autobuild.buildroot.net/results/9a8/9a8122b4d3d0aa9d71cdf8d21359411b130741f8//
>>   http://autobuild.buildroot.net/results/7e5/7e5dd79b48abde09bf4633b196579da5561f9fa1//
>>
>> and many more...
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>   Applied to master, thanks.
>
>   However, I wonder, if opengles is turned off, is the
> $(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) still relevant?

Ouch, I've completely forgotten about this line. I'm gonna send a patch 
that removes it too.

Best
Bartek
>
>   Regards,
>   Arnout
>
>> ---
>>   package/cegui/cegui.mk | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
>> index 127d3b0fad..2e56322374 100644
>> --- a/package/cegui/cegui.mk
>> +++ b/package/cegui/cegui.mk
>> @@ -13,6 +13,7 @@ CEGUI_CONF_OPTS = \
>>   	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
>>   	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
>>   	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
>> +	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
>>   	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
>>   	-DCEGUI_USE_FRIBIDI=OFF \
>>   	-DCEGUI_SAMPLES_ENABLED=OFF \
>>
-- 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
