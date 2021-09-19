Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44FEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 15:20:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E873160FC2
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 15:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E873160FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 850BE4016C;
	Sun, 19 Sep 2021 15:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itmEkpZzktZH; Sun, 19 Sep 2021 15:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E6DA40176;
	Sun, 19 Sep 2021 15:20:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22F1B1BF5A2
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 15:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11A384035C
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 15:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqzQI0yvi9TQ for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 15:20:13 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6269402FB
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 15:20:12 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.166.2])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RyVAmntfPrIRlRyVAmF4pp; Sun, 19 Sep 2021 17:13:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632064389; bh=ORgTEUd778tzzBRPnGB36fBDvLlhlojMwQIpYJaY82w=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=B18D2PUxfNtWCdobv0kEwa0qQEfa3JyCQ9Uf9QPvruBG2bwRB5iZaHHireRsLECa5
 U8PHU4RhaRrmDrvR/C+Yw0bC6KUmKC3mdiX/Zg2eaFs5nkr/LpQZkowYdrpRMvh9dv
 Lpzz/k/QqRfClcXhxvrzAjQNaH5Bf9DCJ5JODojrbmr7wR4whzvl40LzDyWLPDq9wf
 PDeHl66Ko67oKr881HgL1UBU1qLxAkd8r3HSX2+Y2pIXWfps/7pZk8LUbW4xejT1el
 eASmiVpqUEQCrtEHb+1GwhnJiQefv/f20oguRbeS7nmraXjlgO2Io/rtH937CH4h7Z
 yryz7xCGwesjw==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210906213938.201161-1-giulio.benetti@benettiengineering.com>
 <20210919071555.GF1053080@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <1a389193-3d8d-ffad-b744-7cf5f7412c7d@benettiengineering.com>
Date: Sun, 19 Sep 2021 17:13:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210919071555.GF1053080@scaer>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFnq+AfahaanyaRdNEAp6x9LowWWMwAnxyj4sDG+eRSp/sHPh1E8kX1YbBWuhCV9fCaqDEyJuWqgP6S6lcie+QQs43PFEkwRGRjZRUDCe3uABboWvAwl
 +POWuislOFnaZMp5Jm/X/hI3sNyWo8MeWWsOPZyarX48L+QgtF2xpl0940VH1mhaC10p5dN/jeHF52P1aXe0WfrxjjFMX8GxodDElh8Zc4Ts3WkDJgdnNOKU
 Kln+S53Dzqx5/XOFrssVDdzPqilWi6XkZIPgm/y+c8Q=
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.10.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Yann,

On 9/19/21 9:15 AM, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2021-09-06 23:39 +0200, Giulio Benetti spake thusly:
>> Bump libfuse3 to version 3.10.5 and remove local patch that has been
>> upstreamed.
>>
>> Release notes:
>> Various improvements to make unit tests more robust.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Applied to master, thanks.
> 
> It should also fix the same build failure that occurs with glibc 2.34 on
> the old libfuse (pre-3).

I don't understand here. There is a patch already applied for glibc 2.34 
on the old libfuse:
https://patchwork.ozlabs.org/project/buildroot/patch/20210912194057.2556882-1-fontaine.fabrice@gmail.com/

I don't understand how this version bump of libfuse3 can help. Have I 
missed something?

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> ---
>>   ...on.build-fix-wrong-.symver-detection.patch | 61 -------------------
>>   package/libfuse3/libfuse3.hash                |  2 +-
>>   package/libfuse3/libfuse3.mk                  |  2 +-
>>   3 files changed, 2 insertions(+), 63 deletions(-)
>>   delete mode 100644 package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
>>
>> diff --git a/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch b/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
>> deleted file mode 100644
>> index da20c26f19..0000000000
>> --- a/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -From 3aba09a5c56e017746c5c1652dbc845f4db7374a Mon Sep 17 00:00:00 2001
>> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> -Date: Tue, 3 Aug 2021 23:39:46 +0200
>> -Subject: [PATCH] meson.build: fix wrong .symver detection
>> -
>> -As pointed here [1] __has_attribute() is broken for many attributes and
>> -if it doesn't support the specific attribute it returns true, so we
>> -can't really rely on that for this check. This lead to Buildroot
>> -libfuse3 build failure [2] where that shows up with:
>> -```
>> -error: symver is only supported on ELF platforms
>> -```
>> -Indeed Microblaze doesn't support ELF since it doesn't include elfos.h,
>> -but __has_attribute(symver) returns true.
>> -
>> -So let's substitute the #ifdef __has_attribute() with a stronger test on
>> -a function foo() with __attribute__((symver ("test@TEST"))).
>> -
>> -[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
>> -[2]: http://autobuild.buildroot.net/results/d6c/d6cfaf2aafaeda3c12d127f6a2d2e175b25e654f/build-end.log
>> -
>> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ----
>> - meson.build | 16 +++++++---------
>> - 1 file changed, 7 insertions(+), 9 deletions(-)
>> -
>> -diff --git a/meson.build b/meson.build
>> -index b0250ee..a7281f3 100644
>> ---- a/meson.build
>> -+++ b/meson.build
>> -@@ -96,20 +96,18 @@ endif
>> - # to have __has_attribute, then they are too old to support symver)
>> - # other compilers might not have __has_attribute, but in those cases
>> - # it is safe for this check to fail and for us to fallback to the old _asm_
>> --# method for symver
>> -+# method for symver. Anyway the attributes not supported by __has_attribute()
>> -+# unfortunately return true giving a false positive. So let's try to build
>> -+# using __attribute__ ((symver )) and see the result.
>> - code = '''
>> --#if defined __has_attribute
>> --# if !__has_attribute (symver)
>> --# error symver attribute not supported
>> --# endif
>> --#else
>> --#error __has_attribute not defined, assume we do not have symver
>> --#endif
>> -+__attribute__ ((symver ("test@TEST")))
>> -+void foo(void) {
>> -+}
>> -
>> - int main(void) {
>> -     return 0;
>> - }'''
>> --if cc.compiles(code, args: [ '-O0', '-c'])
>> -+if cc.compiles(code, args: [ '-O0', '-c', '-Werror'])
>> -      message('Compiler supports symver attribute')
>> -      add_project_arguments('-DHAVE_SYMVER_ATTRIBUTE', language: 'c')
>> - else
>> ---
>> -2.25.1
>> -
>> diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
>> index 0414264bf8..cce2b11171 100644
>> --- a/package/libfuse3/libfuse3.hash
>> +++ b/package/libfuse3/libfuse3.hash
>> @@ -1,3 +1,3 @@
>>   # Locally calculated sha256 checksums
>> -sha256  bfcb2520fd83db29e9fefd57d3abd5285f38ad484739aeee8e03fbec9b2d984a  libfuse3-3.10.4.tar.gz
>> +sha256  e73f75e58da59a0e333d337c105093c496c0fd7356ef3a5a540f560697c9c4e6  libfuse3-3.10.5.tar.gz
>>   sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
>> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
>> index fc747c5bfd..767382271e 100644
>> --- a/package/libfuse3/libfuse3.mk
>> +++ b/package/libfuse3/libfuse3.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -LIBFUSE3_VERSION = 3.10.4
>> +LIBFUSE3_VERSION = 3.10.5
>>   LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
>>   LIBFUSE3_LICENSE = LGPL-2.1
>>   LIBFUSE3_LICENSE_FILES = LICENSE
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@lists.buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
