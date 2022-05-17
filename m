Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CD0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0232C812AE;
	Tue, 17 May 2022 20:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQE_g68n5NUc; Tue, 17 May 2022 20:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6AEB8128B;
	Tue, 17 May 2022 20:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67E351BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 574738128B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kaSZMEZA4Xjg for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:56:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net [95.217.104.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC1A581285
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:56:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FD1F1C6E2A8; Tue, 17 May 2022 22:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652820985;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=bcNqpj7TrlT789G9Ud78oUpxnkhG4V+mC8v0RXSIVCs=;
 b=yF3BJkD4dPnwhrloPncRXPxLdXlCRjfF/G7uT//+UUV4t0JZKI2/XZgLOHvoyvlQDgGaWB
 //BwseCEyYvcMV3lti+MVHmxH0nDyHT2pcvakyt+PQ/XRuwU5pIeVd5E5c1MHQJF0UP+5C
 xBa0LMwfrLAbdiPO7OC0A2i+IqLCasbul7vM29TwK6pdtqrFSSQw8ncGpliaE/Jf5gFQ+M
 263tTnZkOxUg0m6jIUDY4a6O8xUoZGRjMD6LObmLkyhKI8L+if2FIppPvVTXbokBxohspN
 6W6LcS8rOijozJR3Bz13y1H4WuYLqrIiIhsE6/sH/7l/2MzvLomZTlRjYouv0A==
Message-ID: <7700647d-b901-b966-8588-8ae73590cd78@cosmos-ink.net>
Date: Tue, 17 May 2022 22:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220517141938.3395-1-linus@cosmos-ink.net>
 <20220517204027.GS1597494@scaer>
In-Reply-To: <20220517204027.GS1597494@scaer>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: needs more test cases
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
From: Linus via buildroot <buildroot@buildroot.org>
Reply-To: Linus <linus@cosmos-ink.net>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks for adding it!

You've been really helpful. I really appreciate the time you set aside 
for me.

Huge Thanks,
Linus Kaschulla

P.S.: I might probably add the pv utility (pipeview) sometime later as I
consider the tool essential and noticed it missing. But might be a few
months until I get to that. Should be a pretty easy addtion tough.

Am 17.05.22 um 22:40 schrieb Yann E. MORIN:
> Linus, All,
>
> On 2022-05-17 14:19 +0000, Linus Kaschulla via buildroot spake thusly:
>> For the new patch, adding block size options (commit 555f8dfd),
>> Yann E. MORIN requested updated testcases that specifically ensure
>> the extreme blocksizes (4K and 1024K) don't cause issues.
>>
>> This patch splits the current test case in 2, testing with both
>> block sizes and ensuring the block size was applied in the same
>> fashion as for the specified compression.
>>
>> Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
>> ---
>>   support/testing/tests/fs/test_squashfs.py | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
>> index a914f5aac7..07239fcce2 100644
>> --- a/support/testing/tests/fs/test_squashfs.py
>> +++ b/support/testing/tests/fs/test_squashfs.py
>> @@ -3,13 +3,15 @@ import os
>>   import infra.basetest
>>   
>>   
>> -class TestSquashfs(infra.basetest.BRTest):
>> +class TestSquashfsMinBlocksize(infra.basetest.BRTest):
> In fact I think we need to keep the existing test that uses the default
> value too.
>
>>       config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>>           """
>>           BR2_TARGET_ROOTFS_SQUASHFS=y
>> +        BR2_TARGET_ROOTFS_SQUASHFS_BS_4K=y
>>           BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
>>           # BR2_TARGET_ROOTFS_TAR is not set
>>           """
>> +    expected_blocksize_in_bytes = 1024 * 4
>>   
>>       def test_run(self):
>>           unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
>> @@ -18,6 +20,7 @@ class TestSquashfs(infra.basetest.BRTest):
>>           self.assertEqual(out[0],
>>                            "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
>>           self.assertEqual(out[3], "Compression lzo")
>> +        self.assertEqual(out[4], "Block size {}".format(self.expected_blocksize_in_bytes))
>>   
>>           img = os.path.join(self.builddir, "images", "rootfs.squashfs")
>>           infra.img_round_power2(img)
>> @@ -31,3 +34,15 @@ class TestSquashfs(infra.basetest.BRTest):
>>   
>>           cmd = "mount | grep '/dev/root on / type squashfs'"
>>           self.assertRunOk(cmd)
>> +
>      $ make check-flake8
>      WARNING: support/testing/tests/fs/test_squashfs.py:40:1: E302 expected 2 blank lines, found 1
>
> Yes, like check-package, this is 100% totally undocumented. :-]
>
> So, I've restored the original test that checks the default, and two new
> tersts that check the min and max, and I fixed the flake8 issue.
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
>> +# Reusing TestSquashfsMinBlocksize's test_run(), but change
>> +# blocksize in config the maxium to ensure all extemes work.
>> +class TestSquashfsMaxBlocksize(TestSquashfsMinBlocksize):
>> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>> +        """
>> +        BR2_TARGET_ROOTFS_SQUASHFS=y
>> +        BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K=y
>> +        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
>> +        # BR2_TARGET_ROOTFS_TAR is not set
>> +        """
>> +    expected_blocksize_in_bytes = 1024 * 1024
>> -- 
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
