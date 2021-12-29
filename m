Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EECC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 12:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E72440897;
	Wed, 29 Dec 2021 12:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPWp6TYyjCDX; Wed, 29 Dec 2021 12:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3EFC401C4;
	Wed, 29 Dec 2021 12:45:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B284C1BF303
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 12:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACD294012D
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 12:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srsZrWkiG23c for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 12:45:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB5C6400F2
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 12:45:42 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 2YKonNI2JZs8s2YKonEJyQ; Wed, 29 Dec 2021 13:45:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640781939; bh=5KekCrHielW4adn1dmfYkmM7CUI5GllJYvZGUkTW/ho=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=AGabR0gxtbQHSyEgJRncDGGr0JfkixrIv3VUSCfjouF8djc/bbVGCTvG2Cz/Ia5yP
 OOm7mB6WHRoBndRPrCjqUE6peHg5YNVabjXAusztITMlrzTJ96CKkhURjp3v2IPIy/
 +r48qnVRd45yDHdICdWxngQL5IWEj7IFTMqkn/utdB7hXyVVS6mmNb0v/2C8LwzYkQ
 KWRY2S9Fd0RbJ0asz6/TQj1Z5RUnV/XKcx+p+wClZDxBicfvD3do3r9KjJvZ1VEzW6
 PHiAR2+tXHS4Tw9j0V3Winu4/nTJtvWYfmr/tUkg6iSHQyQqydL6md5ZM6HoevCt0f
 eKPfN72M88qKg==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211229095600.212449-1-giulio.benetti@benettiengineering.com>
 <20211229112037.2e9002dc@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <a294a640-6d8f-0183-f4b3-3fc6eae2a2bf@benettiengineering.com>
Date: Wed, 29 Dec 2021 13:45:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211229112037.2e9002dc@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNVe4EINbLtHXZNLbzO56c4PB5Z8qB43b2FHtjg3KwgmB0IOell0pJBXDYA94PlAjqpsdGVuXOf2VKGsC3kA/X45dcii6WOfetFsKE5SrhcGXJudeOGO
 0NF89Z5Fv0hV/fVTSF8UXp0gI9LaF5oAyRCI+SuhRJxHevpJ6OHgcDgGrPL/YrZByBtmzGvHZbshGi3TuGMuYWpXRh30jrtecantPadT+R/V3TtlQGpNpMJx
 b0uDHzOY9tSmexKUQm4AcdtYMMHA+sqM5qMxa9c5nB+zIDw8IPRNQvRns5WokwC8
Subject: Re: [Buildroot] [PATCH] package/glibmm: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
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
Cc: James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/12/21 11:20, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Wed, 29 Dec 2021 10:56:00 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Add BR2_TOOLCHAIN_HAS_SYNC_4 and restyle the with "|| \" form.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/6a2/6a2709956fbb16ac3cbf676acb242c88f83fcdae/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/glibmm/Config.in | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
>> index 2dfc861817..1b27f8cbb1 100644
>> --- a/package/glibmm/Config.in
>> +++ b/package/glibmm/Config.in
>> @@ -4,6 +4,7 @@ config BR2_PACKAGE_GLIBMM
>>   	depends on BR2_INSTALL_LIBSTDCPP
>>   	depends on BR2_USE_WCHAR # libglib2
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> 
> Not the correct fix: you're confusing the sync built-ins with the atomic
> built-ins. 

Yes, this is new to me.

> Fabrice sent the correct fix a few minutes before yours :-)

Yes, I've seen and replied to him already.
At least I've learnt one new thing :-)

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
