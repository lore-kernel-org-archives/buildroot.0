Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47879C0032E
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 11:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCECB4F4EF;
	Sun, 22 Oct 2023 11:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCECB4F4EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPaGBCM2fLCO; Sun, 22 Oct 2023 11:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0259E4F4EC;
	Sun, 22 Oct 2023 11:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0259E4F4EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E17F1BF4DA
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 11:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0642A40103
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 11:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0642A40103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcXfSwDdbejL for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 11:46:12 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F2D743791
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 11:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F2D743791
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E151360136;
 Sun, 22 Oct 2023 13:46:08 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35546])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Oct 2023 13:46:08 +0200
MIME-Version: 1.0
Date: Sun, 22 Oct 2023 13:46:08 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <ZTP71KY22hz0U3fT@gmail.com>
References: <20231020060236.3725194-1-marcus.folkesson@gmail.com>
 <7a3a5533d8fc664535be030d5d1242f1@free.fr> <ZTP71KY22hz0U3fT@gmail.com>
User-Agent: Webmail Free/1.6.4
Message-ID: <841745799cfd128ae718e46c37460032@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697975170;
 bh=E1/mdNS1VP7SHZTzCzoIo1XEn8aN24zBOyKZc6kgFMQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BFcnF8wKNlNML+InE6uKhJf8ibyMZZF3H4M6PyD4qqlCJP65Q3/hmWFHFquFme9bS
 KU1Lk0FrOiKNzxDkpwbsaxiwZ13mOrhHfkeOhPjjNHruMuJyEJOhCvi3SRH4kTsPv3
 L9dXtRxKAPh2AFKEUCrbLmk2BWbNEQSC2ud4Zt5OXYgKCgdHNyTdDRB4gk6w362/EX
 YPMmSKo7P9V1wgzdHPP6A7xGLB0Q3nEHnsGx7eAsykSDAbwt5rAXA3GNn8ryK/wTT1
 Bzd+WH+C2YDbN/8QGepVlf1Wtr5Vtaag90t7uY6AVmrW1ZlmIuS6658iUnh8D+6PWJ
 ZT6cZXtTCW6BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BFcnF8wK
Subject: Re: [Buildroot] [PATCH v4] package/criu: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

On 21/10/2023 18:27, Marcus Folkesson wrote:
> Hi again,
> 
> On Sat, Oct 21, 2023 at 01:15:10PM +0200, Julien Olivain wrote:
>> Hi Marcus,
>> 
>> Thanks for the updated patch!
>> 
>> I confirm the normal test-pkg is passing. Then, I ran a "test-pkg -a"
>> (which test more toolchains/arches) and observed few new minor
>> failures. I'll comment a bit each failures and provide hints for
>> improvements, when possible.
>> 
>>     cat >criu.config <<EOF
>>     BR2_PACKAGE_HOST_PYTHON3=y
>>     BR2_PACKAGE_CRIU=y
>>     EOF
>>     utils/test-pkg -a -c criu.config -p criu
>>                      arm-aarch64 [ 1/45]: OK
>>            bootlin-aarch64-glibc [ 2/45]: FAILED
>> 
>> criu uses restartable sequences, see:
>> https://github.com/checkpoint-restore/criu/blob/v3.18/criu/include/linux/rseq.h#L7
>> 
>> Criu seems to have a header detection on "sys/rseq.h" (i.e. on the
>> libc side). But the sys/rseq.h then includes linux/rseq.h (i.e. on the
>> kernel side), which is not checked. Some configurations like
>> bootlin-aarch64-glibc includes the glibc header, but also have older
>> kernel. Restartable sequences were introduced in kernel >= 4.18. So
>> this can be handled by adding a dependency on kernel.
>> 
>>        bootlin-arcle-hs38-uclibc [ 3/45]: SKIPPED
>>             bootlin-armv5-uclibc [ 4/45]: SKIPPED
>>              bootlin-armv7-glibc [ 5/45]: OK
>>            bootlin-armv7m-uclibc [ 6/45]: SKIPPED
>>               bootlin-armv7-musl [ 7/45]: OK
>>         bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
>>        bootlin-m68k-68040-uclibc [ 9/45]: SKIPPED
>>      bootlin-microblazeel-uclibc [10/45]: SKIPPED
>>         bootlin-mipsel32r6-glibc [11/45]: SKIPPED
>>            bootlin-mipsel-uclibc [12/45]: SKIPPED
>>              bootlin-nios2-glibc [13/45]: SKIPPED
>>          bootlin-openrisc-uclibc [14/45]: SKIPPED
>> bootlin-powerpc64le-power8-glibc [15/45]: SKIPPED
>>    bootlin-powerpc-e500mc-uclibc [16/45]: SKIPPED
>>            bootlin-riscv32-glibc [17/45]: SKIPPED
>>            bootlin-riscv64-glibc [18/45]: SKIPPED
>>             bootlin-riscv64-musl [19/45]: SKIPPED
>>          bootlin-s390x-z13-glibc [20/45]: FAILED
>> 
>> Build fails with output:
>> 
>>     Makefile:23: *** "The architecture s390x isn't supported".  Stop.
> 
> Another problem that occured...
> After I use $(BR2_NORMALIZED_ARCH) instead of $(BR2_ARCH), the arch
> is at least supported. But it fails with
> 
> Error (compel/src/lib/handle-elf-host.c:161): Unsupported header 
> detected
> make[3]: *** [criu/pie/Makefile:58: criu/pie/parasite-blob.h] Error 255
> 
> After some more investigation, it ended up here:
> 
> static bool is_header_supported(Elf_Ehdr *hdr)
> {
> 	if (!arch_is_machine_supported(hdr->e_machine))
> 		return false;
> 	if ((hdr->e_type != ET_REL
> #ifdef NO_RELOCS
> 	     && hdr->e_type != ET_EXEC
> #endif
> 	     ) ||
> 	    hdr->e_version != EV_CURRENT)
> 		return false;
> 	return true;
> }
> 
> I've added debug trace to see why it fails and got this:
> Error (compel/src/lib/handle-elf-host.c:155): 	type 0x100 machine 
> 0x1600 version 0x1000000
> Error (compel/src/lib/handle-elf-host.c:158): 	ET_REL 0x1 EM_s390 0x16, 
> EV_CURRENT 0x1
> 
> It is a tool that runs on host (little endian), but read data of an elf
> compiled for s390 (big endian), so bytes is read swapped.
> 
> Right now I thinking of not list s390 as a compatible architecture for
> this package.
> 
> Do you think it is reasonable?

Yes, I think it is reasonable to exclude s390 for now.

You can also add a comment about that in the _ARCH_SUPPORTS, that
criu does have "some" support for s390 but it is not included due
to this endianess issue.

This can be improved later, if there is Buildroot criu users on s390.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
