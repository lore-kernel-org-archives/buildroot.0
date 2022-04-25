Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8555C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 08:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79801402E9;
	Mon, 25 Apr 2022 08:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzTSgHuNNwRr; Mon, 25 Apr 2022 08:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C90C402A4;
	Mon, 25 Apr 2022 08:18:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 588641BF3D7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45DBC606C6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dj0WylP_qfxD for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 08:18:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50C7C60675
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 08:18:30 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 66020440862;
 Mon, 25 Apr 2022 11:17:43 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1650874663;
 bh=/FrkHGI36xu/J36vj05pgPE5hwFxlg9dTkpaTUVdAXg=;
 h=References:From:Cc:Subject:Date:In-reply-to:From;
 b=tlepI3zKyrtgh42mYzk6m6wvkcpLm8RBnFswQ4SutcRom997fSwCao9/8zH/+11b1
 PD5Ywm+2biim5r94YXjgT+reI0SHPgFdqQdJtN1RN5/ZcVobTh4buvtiEhfbmCea/y
 /sui4KlkrAoLnDUtNLgvXMEwxTEFEGxoFcaH/KUU3xCP6mEJ8wUAXs8j4CCBkD+CZU
 lGC/vT0lil3m/nAy7sFmC4i2+LqMcXRXP/FLY54IA9R/MBDRoivYRv19Dpwtc6LV14
 8QbsxHeuEJ1kZB7Y6dsULNStTNBPSF+aPDtQ+o2sQfP1PLVP/J4gP0ADdTslkPi23J
 mNWQtwflvBMXg==
References: <20220425080503.769954-1-buildroot@heine.tech>
 <87o80p1sv8.fsf@tarshish>
User-agent: mu4e 1.6.10; emacs 27.1
Date: Mon, 25 Apr 2022 11:16:38 +0300
In-reply-to: <87o80p1sv8.fsf@tarshish>
Message-ID: <87k0bd1sq4.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

On Mon, Apr 25 2022, Baruch Siach via buildroot wrote:
> On Mon, Apr 25 2022, Michael Nosthoff via buildroot wrote:
>
>> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>> ---
>>  package/protobuf/protobuf.hash               | 2 +-
>>  package/protobuf/protobuf.mk                 | 2 +-
>>  package/python-protobuf/python-protobuf.hash | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
>> index 60e64f54d4..f37b2dee40 100644
>> --- a/package/protobuf/protobuf.hash
>> +++ b/package/protobuf/protobuf.hash
>> @@ -1,3 +1,3 @@
>>  # Locally calculated
>>  sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
>> -sha256  645192532f28254152b51c01868efdf9b766b1dbe49c77cccd6efcdb2d7c7bc2  protobuf-cpp-3.19.1.tar.gz
>> +sha256  dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9  protobuf-cpp-3.20.1.tar.gz
>> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
>> index 80764f0216..c4c33ba7da 100644
>> --- a/package/protobuf/protobuf.mk
>> +++ b/package/protobuf/protobuf.mk
>> @@ -7,7 +7,7 @@
>>  # When bumping this package, make sure to also verify if the
>>  # python-protobuf package still works and to update its hash,
>>  # as they share the same version/site variables.
>> -PROTOBUF_VERSION = 3.19.1
>> +PROTOBUF_VERSION = 3.20.1
>>  PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
>>  PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>>  PROTOBUF_LICENSE = BSD-3-Clause
>> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
>> index 2bfef96676..ddfa48b491 100644
>> --- a/package/python-protobuf/python-protobuf.hash
>> +++ b/package/python-protobuf/python-protobuf.hash
>> @@ -1,3 +1,3 @@
>>  # Locally calculated
>> -sha256  2286615a3ae3e24c3524d171b6728b77b72cd2f3aab905f6a8d3fcaf6209dd00  protobuf-python-3.19.1.tar.gz
>> +sha256  d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8  protobuf-python-3.20.1.tar.gz
>
> The version update in python-protobuf.mk is missing.

I misread the commit in protobuf.mk. Sorry for the noise.

Something went wrong with the Cc list. I hope it's fixed now.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
