Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01789C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:05:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8E161506
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F8E161506
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4308360859;
	Mon,  8 Nov 2021 22:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FY2_FREimUdd; Mon,  8 Nov 2021 22:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F33960855;
	Mon,  8 Nov 2021 22:05:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66FBF1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A6B60855
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojCbn7g784-7 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:05:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B726607F5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:05:35 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kClhmLHkKueW5kClhmNNc3; Mon, 08 Nov 2021 23:05:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636409133; bh=YqfpgwyBs39VYi8/t92gnk85jpZ1/uXJERVgv11AMmg=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=gslxoBfxt+zgBt5OgfboFnHE5FXABSfVOuNv2+JksHscapyazpbxx39goapW0khA2
 KJOQb3zyNbvUhEZPrxTPUuodB9+hdiG7ICNNvdcZ0jOFG3uQcQMopk5HAUsgcdAUHo
 remOtMbbi6dgJBtedH88v4+NK3saWzjSSTV2nISeIP/rZTrABIeCnKYECHJdmgj3RO
 wE9RZHOZj4CHTBP3PInTW843z13LnZfrowGqqBxtiRjlfZs/SE7ZIUf8vrYKt8lW9s
 51RKmauSAvsZaAXwLTjuzwuX9woqVJv22Re0OwxKXAQBNCLBXginL/zFz1KwzsLQFT
 Q49Bj6hYmR6Lg==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211107020336.3056910-1-giulio.benetti@benettiengineering.com>
 <de0870fd-2afe-b5f8-d245-fe8c8e6599ca@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <23ab705a-1e0b-ef3c-cdfb-d48df40b6c1a@benettiengineering.com>
Date: Mon, 8 Nov 2021 23:05:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <de0870fd-2afe-b5f8-d245-fe8c8e6599ca@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCdj5/2TGZStE2D5wW1Sq3MXVjhrLkSPfVwER1xe/bsE58lVXvMAb4p7EhBxFLoUtheW71J/63cpvhNapxWikC5pCLHwJTsxAFFMkv0ryHy/0Y5vHgAv
 vUNlCKdDAZnzO6hrBlOElOtMNcZO2Qa4k0EeNL9jRYkeyHxIfHH8AHM5YwpavWKKstCtn0sNLEPibSCM9PcE+q9AZswCNKe7dGmH87r4AsPYpdbWLxTlX6zC
Subject: Re: [Buildroot] [PATCH 016/102]
 board/bananapi/bananapi-m64/genimage.cfg: beautify file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/8/21 11:02 PM, Arnout Vandecappelle wrote:
> 
> 
> On 07/11/2021 03:03, Giulio Benetti wrote:
>> Beatify this genimage .cfg file to have consistency with all genimage .cfg
>> files in Buildroot.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    board/bananapi/bananapi-m64/genimage.cfg | 5 +++--
>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/board/bananapi/bananapi-m64/genimage.cfg b/board/bananapi/bananapi-m64/genimage.cfg
>> index 9730d8faac..52127167ce 100644
>> --- a/board/bananapi/bananapi-m64/genimage.cfg
>> +++ b/board/bananapi/bananapi-m64/genimage.cfg
>> @@ -6,6 +6,7 @@ image boot.vfat {
>>    			"boot.scr"
>>    		}
>>    	}
>> +
>>    	size = 64M
>>    }
>>    
>> @@ -16,14 +17,14 @@ image sdcard.img {
>>    	partition spl {
>>    		in-partition-table = "no"
>>    		image = "sunxi-spl.bin"
>> -		offset = 8192
>> +		offset = 8K
>>    	}
>>    
>>    	partition u-boot {
>>    		in-partition-table = "no"
>>    		image = "u-boot.itb"
>>    		offset = 40K
>> -		size = 1M # 1MB - 40K
>> +		size = 984K # 1MB - 40KB
> 
>    Since there's no way you actually tested this on a board, and there's a slight
> risk that one of these defconfigs actually needs the full 1MB rather than 984K,
> I've reverted all of those to 1M.
> 

Ok, I was uncertain on those, there are 3/4 as I remember like that.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>    Regards,
>    Arnout
> 
>>    	}
>>    
>>    	partition boot {
>>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
