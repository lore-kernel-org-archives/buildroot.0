Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1D5C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 04:01:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5700060F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 04:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5700060F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F7D60655;
	Sun, 25 Jul 2021 04:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ob_eLxv8uDTk; Sun, 25 Jul 2021 04:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E40E605E6;
	Sun, 25 Jul 2021 04:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 630441BF34D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 04:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E45D403A1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 04:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ih7appvm5CQx for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 04:01:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFB1840370
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 04:01:32 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id BF16E440B32;
 Sun, 25 Jul 2021 07:01:16 +0300 (IDT)
References: <20210724204801.1073334-1-daniil.stas@posteo.net>
 <20210724210341.GJ2382418@scaer>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-reply-to: <20210724210341.GJ2382418@scaer>
Date: Sun, 25 Jul 2021 07:01:27 +0300
Message-ID: <87tukjxcrs.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/htop: fix sources location
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
Cc: buildroot@buildroot.org, Daniil Stas <daniil.stas@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Yann, Daniil,

On Sun, Jul 25 2021, Yann E. MORIN wrote:

> Daniil, All,
>
> On 2021-07-24 20:48 +0000, Daniil Stas spake thusly:
>> Change sources location from bintray to github since bintray doesn't
>> work anymore
>> 
>> Signed-off-by: Daniil Stas <daniil.stas@posteo.net>
>
> Applied to master, thanks.

Wouldn't tar file hash change break the sources.buildroot.net cache?

baruch

>> ---
>> Backport to: 2021.02.x, 2021.05.x
>> ---
>>  package/htop/htop.hash | 2 +-
>>  package/htop/htop.mk   | 3 ++-
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/htop/htop.hash b/package/htop/htop.hash
>> index 647feabb8e..e9eb5daf4d 100644
>> --- a/package/htop/htop.hash
>> +++ b/package/htop/htop.hash
>> @@ -1,3 +1,3 @@
>>  # Locally calculated
>> -sha256  19535f8f01ac08be2df880c93c9cedfc50fa92320d48e3ef92a30b6edc4d1917  htop-3.0.5.tar.gz
>> +sha256  4c2629bd50895bd24082ba2f81f8c972348aa2298cc6edc6a21a7fa18b73990c  htop-3.0.5.tar.gz
>>  sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
>> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
>> index aa2ff24750..dd801b0dc0 100644
>> --- a/package/htop/htop.mk
>> +++ b/package/htop/htop.mk
>> @@ -5,8 +5,9 @@
>>  ################################################################################
>>  
>>  HTOP_VERSION = 3.0.5
>> -HTOP_SITE = https://dl.bintray.com/htop/source
>> +HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
>>  HTOP_DEPENDENCIES = ncurses
>> +HTOP_AUTORECONF = YES
>>  # Prevent htop build system from searching the host paths
>>  HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
>>  HTOP_LICENSE = GPL-2.0


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
