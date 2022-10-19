Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72638C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 13:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADC4611E1;
	Wed, 19 Oct 2022 13:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ADC4611E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kseoDuGwDySP; Wed, 19 Oct 2022 13:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D9F611D1;
	Wed, 19 Oct 2022 13:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D9F611D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D58F1BF375
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6963A40C7F
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6963A40C7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4fsYiglHno0 for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 13:49:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E321640CA2
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTP id E321640CA2
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 13:49:21 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id l9RgomgdmSmRKl9RgoCQ8D; Wed, 19 Oct 2022 15:49:20 +0200
Message-ID: <aeb47675-f2e8-fff6-9f9e-872bd8f64382@benettiengineering.com>
Date: Wed, 19 Oct 2022 15:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20221018131506.123350-1-giulio.benetti@benettiengineering.com>
 <20221019091512.77a48aa8@booty>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221019091512.77a48aa8@booty>
X-CMAE-Envelope: MS4xfD3+yoEVntCiwuuVSOk/rpLglkPGQjJw6D33sAX0nLok96SPm5aOSF9OeVWzYX+YOyzHTJK5jZv6GgA9lBV4/cIIgHXve+nT3NF3pV8Z+gjfrP/GPXYa
 PpfVs6nQ+KI0e4MFmf/SSlJ9D/QJUj7jKxdXbQaOa5WzcHhOdpItoAcPxIs+7WxiS0qKQXc91QvxND7eZOOWyebumX5Jc12U7exsB3SYZ507bAFldw6uOe+/
 cGjbSc3KAKwQLnrndhzk4uRVXVH5/+3YSh9EnB1nqjk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666187360; bh=6LvQDq1/jnFFR2g4FcXwtbSJzjQwB9W56PEWWO1Mw3U=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jdX6HzyszI35Vn6qNgYx1KfMU/331CBWV9jR0I/Nbki2SLVtyQB6CkAlZfx75K12D
 2qfHRbYjC7h/JPFlk0bofKxLmbfLk5C2EMSZ8rNl7vGo8ou3+N0gYLL8ntlgxHb88N
 56jrwhBNG44JZ+Wnc+0ndizEp01vEtPscmTdOi5/y0vNUB8hUgcYOPJU7z6ZldFdTx
 8tOYL9XiKVk97ntg/nSTm/LIxOamX5Qn6QUpl5eN49zCSugupkZagRpVeHFytN8QZ1
 4/0mzEUNrADFsj5FJuSpXYtp9RvOKgDHaet4cNpU1s74Im+JgSr0POokxFtwvzXXET
 i9mUjvpz+OpOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jdX6Hzys
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: remove wrong description
 in Config.in
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

On 19/10/22 09:15, Luca Ceresoli via buildroot wrote:
> Hi Giulio,
> 
> On Tue, 18 Oct 2022 15:15:06 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> This rtl8188eu driver is not the same as the one in mainline Linux that
>> still has pending work to be done that in this driver is done, check:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
>> specifically:
>> * Switch to use LIB80211.
>> * Switch to use MAC80211.
>> * Switch to use CFG80211.
>> So let's remove the description that is not valid anymore.
> 
> A lot of this text would be useful in the help text below. The help
> text is visible in any moment in later releases, the commit log needs
> to be searched.
> 
>> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/rtl8188eu/Config.in | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
>> index 76d9085297..8d68d104c8 100644
>> --- a/package/rtl8188eu/Config.in
>> +++ b/package/rtl8188eu/Config.in
>> @@ -4,9 +4,6 @@ config BR2_PACKAGE_RTL8188EU
>>   	depends on BR2_LINUX_KERNEL
>>   	help
>>   	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
>> -	  This is needed only for Linux kernels before 3.12.
>> -	  Since 3.12, there is a (staging) driver in mainline, with a
>> -	  similar codebase.
> 
> For the above reasons, I'd add here:
> 
> This rtl8188eu driver is not the same as the one in mainline Linux that
> still has pending work to be done that in this driver is done, check:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
> 
> I'd not add the todo list, as it will (hopefully) change in the future
> in the kernel and we don't want to keep updating our own copy.

Good idea. Thank you for taking care. I've just sent v2 patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20221019134823.12594-1-giulio.benetti@benettiengineering.com/

Kind regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
