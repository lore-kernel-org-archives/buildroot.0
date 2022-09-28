Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAFEC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 22:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309CA60E9D;
	Wed, 28 Sep 2022 22:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309CA60E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMXDivzPShWp; Wed, 28 Sep 2022 22:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA7960B77;
	Wed, 28 Sep 2022 22:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA7960B77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 800EC1BF2B5
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 22:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55B1440CD8
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B1440CD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OisuWGfQ2xJK for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 22:29:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 000A240AD9
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 000A240AD9
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 22:29:01 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id s18so8867215qtx.6
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 15:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1qqA9CWuMBJvnfbiPLSnOIThqEzQrKPEYHIFzNi+qwM=;
 b=jTOjx4ZRXySiMlcl012hRaSTJW/+a9yjb9hgAyVRE8xT4cESKwyQ3Unsppk+u3eQHj
 xqs/0DaSEPiR0qunOLBAJjNXv6f9uZlyYoUcSQB67zq/3KdmPb2uhCPq1E1KyJpXmfxx
 R9K0IVrFMBRLwcWzrEFYf3MDOHMKfwrcOEIYmx0v4bzs0bwIaMGUWMl9BEZWbiC0KooI
 oM2MtQVdQO2xtX+cIEayTfMRan1L2m+reJlSfPVluwTh349bW5CTrpN5ekNBgKaitPI/
 lpkFPiXcEeVMQSc1gNtDsj22rqrGcKslosYMRzfJ7WCRCajgDeEe+3d9H4e3UOYwTVUd
 5G2w==
X-Gm-Message-State: ACrzQf1u3/qURtL8Bf7TBABebJ6ZAyehSP5jPkMedXj4jWZJIge2W0hO
 FXyWWxd2opqziL48tHN7cwnsSe8+khM=
X-Google-Smtp-Source: AMsMyM4hIhI/U5cH0lFYC+le6rcYTGbSToNPvdoGTktrtImxClvtVMsLSkPJmzj/B7VRyPUs+OeS0g==
X-Received: by 2002:ac8:5b0d:0:b0:35d:115d:50fa with SMTP id
 m13-20020ac85b0d000000b0035d115d50famr12100qtw.447.1664404140817; 
 Wed, 28 Sep 2022 15:29:00 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 q17-20020a05620a2a5100b006bc192d277csm4139847qkp.10.2022.09.28.15.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 15:29:00 -0700 (PDT)
Message-ID: <dda7b7d2-4846-6623-5ca7-39799015a138@gmail.com>
Date: Wed, 28 Sep 2022 15:28:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
 <20220928233856.77bb191c@windsurf>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220928233856.77bb191c@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1qqA9CWuMBJvnfbiPLSnOIThqEzQrKPEYHIFzNi+qwM=;
 b=n+IZgljNWxBadQsYpxZMlNchIQJxOz0hGYl+YQVB5Z5hJsy/hXBuzg9GNQtgNJWYKJ
 nCA9oubW7+p5RtuQSCgYr+WZEF049I/RCwoL62rLvhqWVwtuR8WtEr6MqKc46VVD3trE
 APD5vk0G6kVT30XNls0jqn9D1IMTfVnIxX/rXx2Pbm/srXgB7mT3fBn1OLw7rX1/qc2D
 yXwQbZI5681inArZlJcsg/DfTJ7kBDEPx9pqNUdCrhi2a4AwZFnUBzupmJ0tnnYSl+5i
 bTWkIg5Fj6zW20nIugPuwP9VmVH6ty8nTog5lhN6UR4PYtgFI7P+OKG8D6tD+UKpIQQM
 E72w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n+IZgljN
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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

On 9/28/22 14:38, Thomas Petazzoni wrote:
> Hello Florian,
> 
> On Tue, 27 Sep 2022 15:11:33 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
>> ("perf tests: Add test for PE binary format support") present in >=
>> v5.10 there is an unconditional installation of PE binaries which will
>> be rejected by the check-bin-arch script.
>>
>> Make sure that these binaries are excluded from being checked to allow
>> the installation of the perf tests.
>>
>> Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Thanks for the patch! Before merging it, I'd like to understand a
> little bit more how readelf behaves for these PE files. Indeed in
> check-bin-arch, we are doing:
> 
>          arch=$(LC_ALL=C ${readelf} -h "${TARGET_DIR}/${f}" 2>&1 | \
>                         sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1)
> 
>          # If no architecture found, assume it was not an ELF file
>          if test "${arch}" = "" ; then
>                  continue
>          fi
> 
> for a PE file, I would expect readelf to badly fail, and therefore
> ${arch} to be empty, and the file simply ignored.
> 
> What is the behavior/output of readelf on these PE files?

If I use my host system readelf which is packaged from 
binutils-x86-64-linux-gnu, I get no output and all is well, however when 
check-bin-arch is called and it uses $(TARGET_READELF), I do get:

./host/bin/aarch64-linux-readelf -h 
build/linux-custom/tools/perf/tests/pe-file.exe | sed -r -e '/^ 
Machine: +(.+)/!d; s//\1/;' | head -1
IMAGE_FILE_MACHINE_AMD64 (0x8664)

which is what prompted me to issue this patch in the first place.

I should mention that the readelf binary in this case is the LLVM Object 
Reader and it does support PE/COFF which is probably why it even 
remotely attempts to parse the file.
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
