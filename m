Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7852DC77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 18:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF60141FD0;
	Sun, 14 May 2023 18:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF60141FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMdpFycI3n0D; Sun, 14 May 2023 18:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C2F41F92;
	Sun, 14 May 2023 18:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C2F41F92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF9571BF5A2
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 18:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A403A41F92
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 18:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A403A41F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMiG4VErHb_S for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 18:56:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 722F541C3A
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 722F541C3A
 for <buildroot@buildroot.org>; Sun, 14 May 2023 18:56:24 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id yGtJprSjlptjByGtJpHvrW; Sun, 14 May 2023 20:56:22 +0200
Message-ID: <73cde340-cdaa-d389-6890-cf0a8e749737@benettiengineering.com>
Date: Sun, 14 May 2023 20:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230320111054.6660-1-giulio.benetti@benettiengineering.com>
 <20230514124707.GZ2582048@scaer>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230514124707.GZ2582048@scaer>
X-CMAE-Envelope: MS4xfO/5MPfX/Xwg3zHBVXVxZ5sJH+UQZ1+ZNRSgUr+m3Oe6nhlNuzkVhytG7A2qY0UFIR1pFCZuu+N+oZkrw5vHt5I3+qT0qoVUyGi32FwYCXffuDfnsAyk
 Wj3KUNiqlmHSmvo74diW9aZcnecud3MGQWeMdwrN9k833U3yzt480TMD1J9SHs0Us0ptiCMrloqePiKRP+Z848yuMzMrFJidkbii065hD455dbV0rW1/2z+x
 BK6ByxHDjmzG7VSYwT2AUYn7XX3KJ+4sOnOXxTITxqY/2E5n2W39MFWyu5ll+4+weX3at4Em5aEfwBTqSspN+fNv/cY4oCsxMCfr6LUAMIM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1684090582; bh=MtjEpjbf3IZ8/8H8DpXiwKpR3aJHDZsNrYkTKq3xwTM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=h+v6+dqJayaBDlSVTbTYmNkCRDkXLvI3rA2u3SFkFiNvCuHTOOFNlOeCQWH77Nt0o
 gurq89NfdLN0xxDTozOV5ZJPQFm+QJWMOeU3M2xB8Aywyd20C31tWRAx5gq0Nc5lsJ
 LEM9zBVIV8Bjixaf6hIij5b1JLzRU2NSxz3P73RLieHIKrCkQN8G8wnJiv2mlRHNEa
 JIs4vZjDiy4KQtysE+VSd54vbk+zKj5dZh8Rune4BJq+pAmAw8/dSdFMJy/qf3tVrT
 u2gysYhIjpyAlwjJvscXz7d90vr5Q1szN3Xis3qrwk6bSZ3AJz0oY19IlqQpwqffbn
 MlO0F3SlK3aiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=h+v6+dqJ
Subject: Re: [Buildroot] [PATCH v3] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Peter Seiderer <ps.report@gmx.net>, Indrek Kruusa <indrek.kruusa@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/05/23 14:47, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2023-03-20 12:10 +0100, Giulio Benetti spake thusly:
>> Let's also switch to a _SITE that can be accessed from a web browser and
>> results to be the official one for mmc-utils.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
> [--SNIP--]
>> diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
>> index 1256f63487..22d34c3d40 100644
>> --- a/package/mmc-utils/mmc-utils.hash
>> +++ b/package/mmc-utils/mmc-utils.hash
>> @@ -1,3 +1,3 @@
>>   # Locally computed
>> -sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f  mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
>> -sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081  mmc.h
>> +sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
>> +sha256  f0b53b9d58ee24e8bd9bb69bf4b31f8d1d031cf4f5d5078842198bbc6a779ca5  mmc.h
> 
> Whenever we update mmc-utils, there is a very high probability that
> mmc.h changes, and so we need to update its hash, even if the licensing
> termns do not change. This is a bit cumbersome, because we'd like to
> only detect an actual change.
> 
> So, I've switched to using README, which has been introduced a while
> ago, that identifies the license name (GPL-2.0-only), so is good-enough
> for us.

Ah, good idea. I haven't noticed it.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Applied to master with the above change, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
>> index 435e6ae7f1..44abf00dbc 100644
>> --- a/package/mmc-utils/mmc-utils.mk
>> +++ b/package/mmc-utils/mmc-utils.mk
>> @@ -4,8 +4,8 @@
>>   #
>>   ################################################################################
>>   
>> -MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
>> -MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
>> +MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
>> +MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
>>   MMC_UTILS_SITE_METHOD = git
>>   MMC_UTILS_LICENSE = GPL-2.0
>>   MMC_UTILS_LICENSE_FILES = mmc.h
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
