Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFACC04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1101560F6B;
	Fri, 23 Sep 2022 21:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1101560F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srztLqAmNrgQ; Fri, 23 Sep 2022 21:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2891560DCB;
	Fri, 23 Sep 2022 21:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2891560DCB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 021E81BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D109683EE5
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D109683EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOFc718VMGjD for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:50:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF5D583E6A
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF5D583E6A
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:50:00 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.20.153])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bqYYoyIPM5z8NbqYYo4At2; Fri, 23 Sep 2022 23:49:59 +0200
Message-ID: <cca2f523-cf46-0a00-36f7-28c3b095a618@benettiengineering.com>
Date: Fri, 23 Sep 2022 23:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220920220904.98162-1-giulio.benetti@benettiengineering.com>
 <20220923233956.4d6ebabc@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220923233956.4d6ebabc@windsurf>
X-CMAE-Envelope: MS4xfN4zIJDJjRNbWDeBEo+nJO51d5BijkPiUrhi525gnXN3YvrHFoMJRIpsxyFXxLEtgE//AdODW4OLSzAHNpWXk+4dOlE9FnWK70cN3XlGwS/FTD1kwYG6
 8wlrNVj9J38dZhjH3xeqSNvLWqapgSPdhewMZDDf1IXxzp/JiM1sPYdXcP3XhIMHmdHe5x/6h2o1/ZV04rS/Aywj2Irdfccb7sQ8YdHL+mL3dFnD0P473x14
 q+CPF9ktZyecRpn0KC31cp4VF4CTvxGhEmzmV7xon7EuUkxcAoeqLDgzkp5xK/BC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663969799; bh=KMSw6UrIHOnOHx2P+G69G8jz4z0v9tBsYdipuDTxT2k=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=n3aowSSi27Ip97k/j5ZTbffOYAwkLGAceKbfuFUezVCb4THC0vVzkKKxFw1x8UICZ
 WAb1PAFQNPBjGHpX1HsZYMoFaIxs9SChVhQ9BFerWuV1cWHK0MINV20ieSRS0GEO9m
 49BkKw72Mluys3j7QiDFBcd3xF3UyHcxWv4nA03iVqabO9C0bc2gvbGp8Xi0kjBlRZ
 1Nb43AM5EOPVDA3R1koa9ouRnUEkeKIW1mTKZss0iSS9GND/RNXXVI5XbO6e3LRySC
 5ll2WZ4xLrKz8Wqf0WFNLGCxhNSNkGZ5MQHnqZ8/2NLlmSw6wVO9GqZ1TCe+XJ7VfV
 8YkX8L2yiMnCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=n3aowSSi
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure due to double defined endianness
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/09/22 23:39, Thomas Petazzoni wrote:
> On Wed, 21 Sep 2022 00:09:04 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> By default package rtl8812au-aircrack-ng uses CONFIG_PLATFORM_I386_PC that
>> define -DCONFIG_LITTLE_ENDIAN and this can't be overridden since the
>> USER_EXTRA_CFLAGS are assigned to EXTRA_CFLAGS in the beginning of Makefile
>> while -DCONFIG_LITTLE_ENDIAN is assigned later.
>> Instead of using the default CONFIG_PLATFORM_I386_PC let's set it to 'n'
>> and let's use the same defines it uses:
>> -DCONFIG_IOCTL_CFG80211
>> -DRTW_USE_CFG80211_STA_EVENT
>> This way -DCONFIG_BIG_ENDIAN can be define without the conflict of being
>> defined with with the default -DCONFIG_LITTLE_ENDIAN.
>> Let's also add Linux config FIXUPS to build the module correctly.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/2e4ee705d0e2b728f102aac4e6729f11ef22be36/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   .../rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk    | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
> 
> Applied to master, thanks. The Makefile of this driver, with those
> zillions of CONFIG_PLATFORM_xyz conditions, is really horrible...

Never like libnss's one :-)

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
