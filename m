Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F91ACAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 04:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB3FC83EFB;
	Sun,  5 Oct 2025 04:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEYleMCGuAh9; Sun,  5 Oct 2025 04:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C816883E88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C816883E88;
	Sun,  5 Oct 2025 04:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C24E9118
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 04:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B149883E84
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 04:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd8fycIqqvQN for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 04:36:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8221183E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8221183E77
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8221183E77
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 04:36:23 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id C6AA5440FA4;
 Sun,  5 Oct 2025 07:35:27 +0300 (IDT)
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Cc: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <87347yynjz.fsf@tarshish> (Baruch Siach via buildroot's message
 of "Sun, 05 Oct 2025 07:34:08 +0300")
References: <20251004105801.380109-1-bernd@kuhls.net> <87347yynjz.fsf@tarshish>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Sun, 05 Oct 2025 07:36:20 +0300
Message-ID: <87wm5ax8vv.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1759638927;
 bh=Bw9RpilzsJVU+KfV+LSKhOJkLyZUOmpgQFpjZAkZ59o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fUIlYyhWO02uxdUxxU2GpdJV6HtfgRmi/ombpnXrBNuDQW0Y13fyOnku25kI9hOGk
 t7TgPzMP1b7NNKhLibj20IL7lBgvfMlz4TbP6vTsLXvW/hXXAQlZkqr/sKLarSY+Rn
 vl0ZhKMAuwZ6gTNWfI2jBxR3Mc6QRw2wQkanB/kevFTeDbkNRR7LOsO+aDVrXJDz52
 mqwitoCwya5VRb3uh7uoE1lXPLr19jLWUzNHpnjmP6DS5Q75TjDY4g3HFKlcXnKXnq
 0EwleLKRzsZRcq+ZB1DoI9GS1Tb6bj78yF0aEDTwxLmu9cnMraQR0ajV7JfU1b4yz1
 fibWBvRc6Arpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=fUIlYyhW
Subject: Re: [Buildroot] [PATCH 1/1] package/libao: bump version to 1.2.2
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Sun, Oct 05 2025, Baruch Siach via buildroot wrote:
> On Sat, Oct 04 2025, Bernd Kuhls wrote:
>> Added upstream patch to fix a missing include, autobuild did not record
>> any build errors but Arch Linux provides the patch:
>> https://gitlab.archlinux.org/archlinux/packaging/packages/libao/-/commit/bad3196d4e3030d31b01eb3bd41fff8afc8ca113
>
> Where is this patch?

I have just noticed v2 adding this patch.

Sorry for the noise.

baruch

>> Switched to gitlab tarball because the previous site does not provide a
>> tarball for version 1.2.2 which was tagged in 2016:
>> https://gitlab.xiph.org/xiph/libao/-/tags/1.2.2
>>
>> Added autoreconf due to usage of gitlab tarball which does not contain
>> a configure script.
>>
>> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>> ---
>>  package/libao/libao.hash | 6 ++----
>>  package/libao/libao.mk   | 5 +++--
>>  2 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/libao/libao.hash b/package/libao/libao.hash
>> index 91c6bd11a7..70e6b4987e 100644
>> --- a/package/libao/libao.hash
>> +++ b/package/libao/libao.hash
>> @@ -1,5 +1,3 @@
>> -# From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
>> -sha256  03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf  libao-1.2.0.tar.gz
>> -
>> -# Hash for license file:
>> +# Locally computed
>> +sha256  df8a6d0e238feeccb26a783e778716fb41a801536fe7b6fce068e313c0e2bf4d  libao-1.2.2.tar.gz
>>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
>> diff --git a/package/libao/libao.mk b/package/libao/libao.mk
>> index 19a4c165c6..a9fd739ff3 100644
>> --- a/package/libao/libao.mk
>> +++ b/package/libao/libao.mk
>> @@ -4,13 +4,14 @@
>>  #
>>  ################################################################################
>>  
>> -LIBAO_VERSION = 1.2.0
>> -LIBAO_SITE = http://downloads.xiph.org/releases/ao
>> +LIBAO_VERSION = 1.2.2
>> +LIBAO_SITE = https://gitlab.xiph.org/xiph/libao/-/archive/$(LIBAO_VERSION)
>>  LIBAO_DEPENDENCIES = host-pkgconf
>>  LIBAO_INSTALL_STAGING = YES
>>  LIBAO_LICENSE = GPL-2.0+
>>  LIBAO_LICENSE_FILES = COPYING
>>  LIBAO_CPE_ID_VENDOR = xiph
>> +LIBAO_AUTORECONF = YES
>>  LIBAO_CONF_OPTS = \
>>  	--disable-esd \
>>  	--disable-wmm \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
