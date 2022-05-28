Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7DCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6F4419AD;
	Sat, 28 May 2022 20:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29sG6Lelncyh; Sat, 28 May 2022 20:08:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75B14199A;
	Sat, 28 May 2022 20:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC531BF3C1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 785C0600C4
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4tCE1zauyff for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:08:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id B26866005E
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:08:50 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v2jwnhdswY1m9v2jwn35Ls; Sat, 28 May 2022 22:08:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653768529; bh=h3oWIRtsTlBfeDQ1/lJYsoztqYSdCnhzr2RXUXwVpJs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=X9/tDqnsxKQs9/xWcEpI4erY0iKyy27o2+BOrEAIPjnnLPSSNGtrqN6Z7R8qrTSE9
 KOmGwR3YZW92kjwKr73udV5xy5SRWRK5XBMJ+GM2KFBqPsoXhMVsrucqqIwIefFGLD
 xnkfN2OZ5rAGcGI2vVHwQHdzFhqqzBe6cJFCHc6k+VdJsTw70sWrPmK4xjsWHeoAwU
 waqkGg11eImoNCmirg+GOuUx61IvyWHdWbin5u+FKjT4YYHBAm1R8XB5AInQVqkrrD
 ltW6A2Dsp4Kat3ax5pYKFc+AvWLXoRlhGUGxNMVZcR3CT7lP6UJH4Xhcje55kVS50j
 jJnYVyzmF0UJg==
Message-ID: <1ad51b4f-914c-3411-49e4-593345a325d1@benettiengineering.com>
Date: Sat, 28 May 2022 22:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220524220734.93556-1-giulio.benetti@benettiengineering.com>
 <20220528200627.GH301044@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220528200627.GH301044@scaer>
X-CMAE-Envelope: MS4xfAAxdtL3/kpGcmJ7l1Kelqw97fgGjy1L6zEcI7K8hFsqkJn5+1CvlB9PC5yJIuAEJZK9Lr/upNxUGKASPmPCy8S9HRyjSJ17GW5zXEBqOW4Rg8/HI4tW
 ORkCaONsfH9Urc0Rn8ODszvZEkRO9C+yR5Bhod10P4iTo4W3tn2DXEhx4szvXvKsNERqba65w0Adgi2SrVcYu1zNqd0nHNqmtDqO87cSUjeBiLv4cFDMXKqD
 usNIdQeB2O+rrr/LHbGXmht+TpS66nW0GspAfVAvkml7JoXBdQVqj93ljaOI2LIq93llef1U07UKsVuIzZpOPkYKz8tLdLxQFwmF3vPBOWk=
Subject: Re: [Buildroot] [PATCH] package/libnss: fix build failure on
 Aarch64 host for powerpc64 target
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 28/05/22 22:06, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2022-05-25 00:07 +0200, Giulio Benetti spake thusly:
>> When building on Aarch64 host for powerpc64 we get this error:
>> gcc: error: unrecognized command-line option '-m64'
>>
>> This happens because we don't have the flexibility to override the LDFLAGS
>> when linking nsinstall host tool that is built in libnss. Also libnss uses
>> the same LDFLAGS it uses for target and that is not correct.
>> So let's add a patch to add NATIVE_LDFLAGS variable to override LFDFLAGS
>> when building nsinstall utility and set it to HOST_LDFLAGS in libnss.mk
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/67500395f19aa698b98404cde8d20463e55504bf/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> Patch is pending upstream:
>> https://bugzilla.mozilla.org/show_bug.cgi?id=1771036
> 
> We need that information in the patch itself, so that we handily have it
> where we need it when we bump the version and can check whether the
> patch still makes sense or not.

Ok, next time I'll put it in commit log.

Thank you for pointing.

Best regards
-- 
Giulio Benetti
CTO/CEO@Benetti Engineering sas

> 
> Applied to master, thanks.
> 
> (And upstream seemed to be happy with the patch, even if it has not yet
> been applied.)
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>   ...36-Fix-build-failure-on-Aarch64-host.patch | 36 +++++++++++++++++++
>>   package/libnss/libnss.mk                      |  4 ++-
>>   2 files changed, 39 insertions(+), 1 deletion(-)
>>   create mode 100644 package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
>>
>> diff --git a/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
>> new file mode 100644
>> index 0000000000..2ca373cd21
>> --- /dev/null
>> +++ b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
>> @@ -0,0 +1,36 @@
>> +From 9d5900c1ee9000906a90923e861b0fd7f1061cde Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Tue, 24 May 2022 23:40:45 +0200
>> +Subject: [PATCH] Bug 1771036 - Fix build failure on Aarch64 host
>> +
>> +If trying to build on Aarch64 host for powerpc64 target we can't override
>> +the LDFLAGS leading to this build failure:
>> +gcc: error: unrecognized command-line option '-m64'
>> +
>> +So let's add NATIVE_LDFLAGS check and use it to link nsinstall. This way
>> +any build environment can pass LDFLAGS that fits better for host
>> +architecture.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +---
>> + coreconf/nsinstall/Makefile | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
>> +index 08dfbc2fe..5061789ff 100644
>> +--- a/nss/coreconf/nsinstall/Makefile
>> ++++ b/nss/coreconf/nsinstall/Makefile
>> +@@ -34,6 +34,10 @@ ifdef NATIVE_FLAGS
>> + OS_CFLAGS=$(NATIVE_FLAGS)
>> + endif
>> +
>> ++ifdef NATIVE_LDFLAGS
>> ++LDFLAGS=$(NATIVE_LDFLAGS)
>> ++endif
>> ++
>> + include $(DEPTH)/coreconf/rules.mk
>> +
>> + # Redefine MAKE_OBJDIR for just this directory
>> +--
>> +2.34.1
>> +
>> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
>> index 540092dfcf..0d0f1d84b9 100644
>> --- a/package/libnss/libnss.mk
>> +++ b/package/libnss/libnss.mk
>> @@ -92,7 +92,9 @@ define LIBNSS_BUILD_CMDS
>>   		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>>   		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>>   		CHECKLOC= \
>> -		$(LIBNSS_BUILD_VARS) NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX"
>> +		$(LIBNSS_BUILD_VARS) \
>> +		NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX" \
>> +		NATIVE_LDFLAGS="$(HOST_LDFLAGS)"
>>   endef
>>   
>>   define LIBNSS_INSTALL_STAGING_CMDS
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
