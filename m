Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70BEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 13:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B1E6117D;
	Mon, 30 May 2022 13:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YK-x2YNneJT6; Mon, 30 May 2022 13:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6676460ED7;
	Mon, 30 May 2022 13:09:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5DF71BF357
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A177B404BB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrmuLVCYNnvc for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 13:09:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5E1E40499
 for <buildroot@buildroot.org>; Mon, 30 May 2022 13:09:05 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id B5D61440B08;
 Mon, 30 May 2022 16:08:58 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653916138;
 bh=dY5t/8OydhWqqQbfVvADIhqgaedYInj2YdUNqxfWjjc=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=JZOpRhTQeNnXZuBVq+HAM8dAxmiTyPSd0/n2xcMPVc11B4q2gvLW4ATXIrCp83M75
 z5vgs8ImWhUIfFA3W+J5nU4Qv8vIM7L4r/EnD5SiCpUrbLdmvHIk/Gs4rRostXfv64
 CR+qLPxCbYnFt7HxA3zy0y4MYvf+um441+N9IXgcxIEw/NVT+HumGNeu/RJhhZ+Nw8
 bXvu/FWaMb91zlSnV7EynfKuxb+R46yk/5jtRZ7wWbiBlb2f88N+uAg3dTtXW5Wczt
 hwv7zYlNAKrv1hzzT7ZBTLMX7FqTalySDUxbJZqZE2wudTMrm1k+SLmrtVIcymikrP
 rxl1qB+XP8PvQ==
References: <20220530124450.19073-1-andreynech@gmail.com>
 <CAOiXNkCfAQ-jBTrxT2dCZw9AR6uuFJ7WxEsYWXdhfm_iF4DLPg@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 30 May 2022 16:04:14 +0300
In-reply-to: <CAOiXNkCfAQ-jBTrxT2dCZw9AR6uuFJ7WxEsYWXdhfm_iF4DLPg@mail.gmail.com>
Message-ID: <87r14bdv6a.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrey,

On Mon, May 30 2022, Andrey Nechypurenko wrote:
> This is a little bit strange. The patch file located in outgoing
> directory and generated with
> # git format-patch -M -n -s -o outgoing origin/master
> do contains Signed-off-by: tag. However, the command
> # git send-email --to buildroot@buildroot.org --cc-cmd
> './utils/get-developers -e' origin/master
> leads to what could be seen in my previous mail - no Signed-off-by: tag.
>
> Am I doing something wrong or are there some configuration options I am missing?

The 'origin/master' parameter goes to 'git format-patch'. Which means
that you are sending commits between origin/master..HEAD.

If you want git send-email to send you patch file, put that file as last
parameter.

One more comment below.

> On Mon, 30 May 2022 at 14:44, Andrey Nechypurenko <andreynech@gmail.com> wrote:
>> Version 3.20 is the first one where the following issue is fixed:
>> https://gitlab.kitware.com/cmake/cmake/-/issues/18299
>> Was affected by this bug and decide to bump the version to the
>> latest stable

This bump by itself does not fix the issue for hosts that have buggy
cmake installed. To fix them you also need a separate patch to bump
BR2_CMAKE_VERSION_MIN to a fixed version.

baruch

>> ---
>>  package/cmake/cmake.hash | 4 ++--
>>  package/cmake/cmake.mk   | 4 ++--
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
>> index da514a6d6b..1749db8c27 100644
>> --- a/package/cmake/cmake.hash
>> +++ b/package/cmake/cmake.hash
>> @@ -1,5 +1,5 @@
>> -# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
>> -sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
>> +# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
>> +sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
>>
>>  # Locally calculated
>>  sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
>> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
>> index 4177b119ab..053658fad6 100644
>> --- a/package/cmake/cmake.mk
>> +++ b/package/cmake/cmake.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>
>> -CMAKE_VERSION_MAJOR = 3.18
>> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
>> +CMAKE_VERSION_MAJOR = 3.22
>> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
>>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>>  CMAKE_LICENSE = BSD-3-Clause
>>  CMAKE_LICENSE_FILES = Copyright.txt
>> --
>> 2.32.0
>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
