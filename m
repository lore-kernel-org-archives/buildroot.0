Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE09EB64DA
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 09:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41F0C40C05;
	Tue, 18 Jul 2023 09:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41F0C40C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtQ4_p7NSSVM; Tue, 18 Jul 2023 09:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78B9B40BFA;
	Tue, 18 Jul 2023 09:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B9B40BFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3C61BF267
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46957401E0
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46957401E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qu11vLRDiLHb for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 09:38:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAEFE401BB
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAEFE401BB
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 09:38:16 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.105.132])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Lh9qq3cNrbLDjLh9qqkpUC; Tue, 18 Jul 2023 11:38:14 +0200
Message-ID: <12185df5-872e-68fe-c77c-cf72527e2ae7@benettiengineering.com>
Date: Tue, 18 Jul 2023 11:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230716212856.24353-1-giulio.benetti@benettiengineering.com>
 <20230718112050.6d453ad0@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230718112050.6d453ad0@windsurf>
X-CMAE-Envelope: MS4xfFQ0YsV1xdzMsNJF4Yg0Gk1fRdZUdOVBksONcpkct+Ty3E1QnPX1C4OAmbbZjJ+Ktl/j0MS0Ah2qpJ/qU2N33YBKPlAx1YeOdcw3aTgsQfpm3NwgBxjC
 cJ0jtfnK2iXg5goLRO/8vQ/jSO0JjNlVDJIWkfKazgLQSby4y7llPwTQEBhAS8V/qjbAAlXrRXL9n7ibDzuv9p7JSfwb0qdYm1GnCDM2N5lj5KmG+NdZoOpg
 YiqPAH0XULXQeEm6Dz23+an0QIqQE4t6pqqQuY65NOdHz7UQyt8D0MCNQkHxhDo7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689673094; bh=zzrt8WtH4Bk3FdqkhY9WbmRVkvqmzh1SkYwii9CJME0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Dk0h/7gQ9XmHC9Y+1ufveeA54HNRWA9fFTawLgkUOBQIaU+qPZMrw3uqfLEr7M6Y2
 t7T6+EVERJLXdLRyDuE0aPlpd5qSgZ29LDHFpaSzFiC3wN1Z+VWHXnba74FAsEzg5m
 zf0vIGdKHDSbzE58pvxVu3woJNtwAvjcyQ0nrKzE34tB/VkCcUbFN3MyWrpck7o/Lv
 d34OHVHa2wOurLPKZB7JYcWosXDlwmbNDiSCcr94FrZGeZJNqaznDMXIPp/JSy6WCp
 XBZlyl7Fz6BwSo86repUjttN5Pl1f+dx4A3BZfGQYM6hn379LhORodU4sTIwi/T8XJ
 T+pSqK+Z9PzOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Dk0h/7gQ
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: fix build with big endian
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/07/23 11:20, Thomas Petazzoni via buildroot wrote:
> On Sun, 16 Jul 2023 23:28:56 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Add local patch to allow to override CFLAGS and undefine
>> CONFIG_LITTLE_ENDIAN by default and use the correct endianness according
>> to target architecture.
>>
>> Upstream: https://github.com/jwrdegoede/rtl8189ES_linux/pull/101
> 
> This Upstream tag...
> 
>> diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
>> new file mode 100644
>> index 0000000000..93ce8ee33e
>> --- /dev/null
>> +++ b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
>> @@ -0,0 +1,39 @@
>> +From f48d99fab8b79e573850067a3ff2d8c16aa95ce1 Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Wed, 28 Sep 2022 21:17:17 +0200
>> +Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
>> + end of EXTRA_FLAGS assignment
>> +
>> +At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
>> +since it's assigned at the beginning of the Makefile. For example it's not
>> +possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
>> +allow to build these modules for big endian architectures. So let's move
>> +the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
>> +EXTRA_CFLAGS assignment.
>> +
> 
> ... needs to be here. Otherwise, "make check-package" will complain.

Oops, sorry. Just sent v2 for this

Thank you
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
