Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E05EC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8EED409EE;
	Wed, 10 Aug 2022 21:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8EED409EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kM34R8BLTcEA; Wed, 10 Aug 2022 21:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7F21408F1;
	Wed, 10 Aug 2022 21:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7F21408F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC3C41BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7B48827C6
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7B48827C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LG2MBv5CPED for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:24:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1077827BB
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1077827BB
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:24:33 +0000 (UTC)
Received: from [192.168.8.155] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LtBmong38r8wyLtBmoBJha; Wed, 10 Aug 2022 23:24:31 +0200
Message-ID: <aaf56e25-8bc3-33a2-66be-5b69ddddcd37@benettiengineering.com>
Date: Wed, 10 Aug 2022 23:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220809224427.1421622-1-giulio.benetti@benettiengineering.com>
 <20220810231839.1b6164f7@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220810231839.1b6164f7@windsurf>
X-CMAE-Envelope: MS4xfAp5lUTj9HAuck/3A9nGPIJkE/Zeol6yVQV6slxLEguWNVg5BKpS5at2J4ykOfuNCyDomDESNj9n+F2ntjDdjdG/B5/xoOepclon5bYlzH+j2njhQWA5
 sF2BDK4d78PV2cM6IzYgA11ubBOfLyz8x6NsyxVr74Ie/gdT2ekL+TtHf0cnv3uDcizNWF6fLqx9qdZG6hdqTc51i6emZ18cpxT/1Q1E3NC4Zyp299QbPxHw
 Eb63MxrRfdWgB8gnesYKz+6f4tCv9Sh2EOZHThEdq7A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660166671; bh=g5zu+KYjeS/sAPPAKRYnMnhnTVYdklsOgd3T0Lb+FgA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=M3fuQgxsCHc5jKPHwx5qglefCtQquwLRrvv8HeiS42m/jmjEI3dw6469JF7u/5zE9
 kBGCs5MYM23eB8SEKBdxxliSBWVl34A4SDL/WpY0W35eQglMa0kP4HMyjcP+cmNLgp
 FNsYk4qFECHN3Hbfi/EkeqlHuZnYxypNFXmVSeV/p8CtZE5jMUmrd76X9QMsga96tz
 oZC0jLbiD43SuH8LFo08db9sMc48g+Y2LKI9THaRkNyanKocFwG3Za27bvS+lB7X03
 WD5WQjsdN8vZtLqzYsVwHK0ty7BPpdX4RocCoP+uB/ZuZRZOEMZVtYUxTFOfzmM8wl
 66C3s7LrEuv+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=M3fuQgxs
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.6.2
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

On 10/08/22 23:18, Thomas Petazzoni via buildroot wrote:
> Hello Giulio,
> 
> On Wed, 10 Aug 2022 00:44:27 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> nfs-utils 2.6.2 adds nfsrahead tool to set readahead through sysfs, but
>> this tool is mandatory and requires libmount that in order requires
>> libblkid. Also we need a local patch that is already pending upstream to
>> avoid failing static linking:
>> https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
>>
>> So let's select:
>> - BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>> - BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>> and add the pending patch for fixing static linking failure due to wrong
>> order of libraries in linker list(-lblkid must follow -lmount). This is
>> achieved by using pkg-config that is already a dependency of this package.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Thanks, I have applied to master, but I have a comment below.
> 
>> diff --git a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
>> new file mode 100644
>> index 0000000000..b8dcea63f7
>> --- /dev/null
>> +++ b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
>> @@ -0,0 +1,34 @@
>> +From a69014a1b4e5b8068630abe3109f31eb64b6a076 Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Wed, 10 Aug 2022 00:10:51 +0200
>> +Subject: [PATCH] nfsrahead: fix linking while static linking
>> +
>> +-lmount must preceed -lblkid and to obtain this let's add:
>> +`pkg-config --libs mount`
>> +in place of:
>> +`-lmount`
>> +This ways the library order will always be correct.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +---
>> +Pending Upstream:
>> +https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
>> +---
>> + tools/nfsrahead/Makefile.am | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/tools/nfsrahead/Makefile.am b/tools/nfsrahead/Makefile.am
>> +index 845ea0d5..280a2eb4 100644
>> +--- a/tools/nfsrahead/Makefile.am
>> ++++ b/tools/nfsrahead/Makefile.am
>> +@@ -1,6 +1,6 @@
>> + libexec_PROGRAMS = nfsrahead
>> + nfsrahead_SOURCES = main.c
>> +-nfsrahead_LDFLAGS= -lmount
>> ++nfsrahead_LDFLAGS= `pkg-config --libs mount`
> 
> This is not the correct way of using pkg-config in an autotools based
> project. Instead, the configure.ac should use the PKG_CHECK_MODULES
> macro, and use the appropriate variables in Makefile.am.
> 
> Approximately something like this in configure.ac:
> 
> PKG_CHECK_MODULES([LIBMOUNT], [mount])
> 
> and in the Makefile.am:
> 
> nfsrahead_CFLAGS = $(LIBMOUNT_CFLAGS)
> nfsrahead_LDFLAGS = $(LIBMOUNT_LIBS)
> 
> see https://bootlin.com/doc/training/autotools/autotools-slides.pdf
> slide 85 and following.

Thank you Thomas!
I was focusing too much on nfsrahead's Makefile.am without taking care
of configure.ac, I rework the patch for upstream with this test-case and
update the PR later.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
