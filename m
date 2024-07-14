Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FA1C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 11:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF27E40533;
	Sun, 14 Jul 2024 11:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjIDMTxOXi1Q; Sun, 14 Jul 2024 11:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B6E404F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32B6E404F4;
	Sun, 14 Jul 2024 11:09:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96A9C1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF2B81196
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4yRFWE960ym for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 11:09:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D40348117E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40348117E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D40348117E
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 11:09:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.217]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmDEg-1s2Nie1aPA-00ZaFz; Sun, 14
 Jul 2024 13:09:48 +0200
Message-ID: <450045b9-ce2c-4cff-a18e-664adec679ce@gmx.de>
Date: Sun, 14 Jul 2024 13:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>,
 Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240713144316.403640-1-arnout@mind.be>
 <D2OJUFSZ6Y3N.CIWMCVYF7ZFS@collins.com>
 <6fc04f1a-a96e-4cf2-86cf-f9d996330fae@mind.be>
 <D2OO6PNKP35Q.14U0XE937JIFO@collins.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <D2OO6PNKP35Q.14U0XE937JIFO@collins.com>
X-Provags-ID: V03:K1:RCKABZvGume4vxOvdZoDuYP3kmV+Ko3rCps3bGYxSA0Vqs+9/bF
 kid8vOklMpodWmgHmioe2Ui0NFblNPn6OLhL3UOVWSRLMsseICCL1z2jHtfHyQptDKUJCr4
 Q4RPsBDp6euVHVa5ACQLemAatnYW0rcQtKOJPa7nFK7VRtCl+6VVsIp7UnkajG4OWTLBoXw
 YAWdVh1Dq2bGgqVpAhzkQ==
UI-OutboundReport: notjunk:1;M01:P0:JAAqV+R7+VA=;I+rxT7IVTmGR9cRpFsPUxNd1dBX
 r23p+mNgobUr7L7EWijGMzYSNBIcz7JNj6ZCHcOmN+xa8QI739mU48+lITtaReT6B/TjbYlef
 fpnUu+QkVg3/ZTyiUGfqCUuQikMyO1Ii60/lPK6q+UEZyO8uJUeF1x7/W4ShjDHQKzePAFZj0
 XjnmL0Z9ANy7yOGsUgk5T4UH5Npq62VwDJqDY+93RSk1Gf+8XNjuvRuO6iomtRvrAlMtKMxhI
 Pt01//Qw5FBO1gerC6naD2KdEHIMesxtTbcyoU9spuqnX13LHJqeKj1CqpAFPOpCD2x5p3+2W
 iZL/OPHwsNHnCVnznYZin7unj2kAF7Txz3kWqmiMMO3CiHGjEYSde+LwUV46UvcYMl91DX+Va
 1oK0NCI3s5aroQH3nDphSI0j03Ghn9iRx3g33aH49PvaOe5H+MFeig6np3+sQFfBESIgTmn8N
 db6x7NA2E9ha69Ic9+EPckFAGFtxr6+ARu+V+P9WqNxxZ30nHVcwvkpX8lsl22Ltu0J+lDFXp
 k7I8n/sHeMCYo4ltIM+1wss4d7RHLmr9mCesdVIStkh1q7g69kwdICAeiYksAuO+zCAuvXN9H
 7K82tttbR2l4/QcZIWSRzPnkWnU4Olng4LIn6x9vQFTnpRUCwuYSimZOWjLA5Bbz3DURdlXZT
 D3vPyQoP6MzVzHwGzPiC04Bc4SP3dhD3BFUqBiX93DrGzoOS27xRpc+plL5NV5FK7Prze/RGj
 o/AjRoBTz18x6GO6zJjn4WSz8yirHp3ewwaS0pwTNS7+eCPfA9MzIJrIENqB3SVl4RJ4dwUJu
 LuswrbaURxAyE9CaH0Bodf9A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720955388; x=1721560188; i=fiona.klute@gmx.de;
 bh=tBShig2UWnbxhZXUB6N9eeHyeRyN7dIzCzY/r4ubi88=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=fRrptel/vWi3YzDbzmTe/UFjfwwPc7sdoPvKel83fqLzvACdirC+4ESFsqMe3W+g
 +KMnLbxi2P6JQij2mVZSlAtIAOFDcFzoRtNkmfiw9xD3L3inpQknwtBP9NaIEmzyd
 pOpy6dwlfX7+K+A+KNh+AuTgGBuIr72H9XkXm6EWLiQm7vatSX07SWYUJ79bE1aNL
 uYQcDUclSlfqQ9rYu3cx8/pDvbH+XQnUf9VfTkPMDVhqmOVgdifOoYsnQf8Vm3pct
 RtGoJwL6tLyj6pVzwr/08CJiI0T+iPUU+nId6qH6p5d/Xkn9YeJMi7pPKO7NR3SrT
 so780v/qIo0ZBf+fgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=fRrptel/
Subject: Re: [Buildroot] [PATCH 1/3] utils/docker-run: allow to specify
 extra mount points to propagate
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.07.24 um 21:48 schrieb Brandon Maier:
> On Sat Jul 13, 2024 at 4:30 PM UTC, Arnout Vandecappelle via buildroot wrote:
>>
>>
>> On 13/07/2024 18:24, Brandon Maier wrote:
>>> Hi Arnout,
>>>
>>> On Sat Jul 13, 2024 at 2:43 PM UTC, Arnout Vandecappelle via buildroot wrote:
>>>> Sometimes, the build needs access to directories which are outside of
>>>> the current directory, e.g. for pre-downloaded toolchains, local kernel
>>>> sources, OVERRIDE_SRCDIR, BR2_EXTERNALs, ... We need these to be mounted
>>>> into the container to be able to perform the build.
>>>>
>>>> Since there is no generic way to find out all the directories that are
>>>> needed, we need a manual mechanism. We choose the environment variable
>>>> EXTRA_MOUNTPOINTS which contains a space-separated list of directories
>>>> (or files) to mount.
>>>>
>>>> We choose an environment variable to avoid having to parse command-line
>>>> arguments to docker-run.
>>>>
>>>> Update the terse documentation in utils/readme.txt with this
>>>> information.
>>>>
>>>> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
>>>> ---
>>>>    utils/docker-run | 5 +++++
>>>>    utils/readme.txt | 5 ++++-
>>>>    2 files changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/utils/docker-run b/utils/docker-run
>>>> index 1adb02d74e..3bb7b6a41b 100755
>>>> --- a/utils/docker-run
>>>> +++ b/utils/docker-run
>>>> @@ -90,6 +90,11 @@ if [ "${BR2_DL_DIR}" ]; then
>>>>        docker_opts+=( --env BR2_DL_DIR )
>>>>    fi
>>>>
>>>> +if [ -n "${EXTRA_MOUNTPOINTS:-}" ]; then
>>>> +    read -r -a extra_mountpoints <<<"${EXTRA_MOUNTPOINTS}"
>>>
>>> I think it would be good to use `IFS=:` here and split EXTRA_MOUNTPOINTS
>>> on ':'. That would make sure we don't split on other unexpected
>>> characters like spaces, tabs, and newlines. And it would be consistent
>>> with how BR2_EXTERNAL works.
>>
>>    Well, there's a bigger chance that a file/directory contains a colon than that
>> it contains a newline or tab, so : is not _that_ much better. Between tab and
>> space I'd say they are about equally likely.
>>
>>    However, a path with a space will simply not be supported by Buildroot. So if
>> that extra mountpoint has a space and is used for a BR2_EXTERNAL, for a local
>> tarball, for an override srcdir, for an output directory, for a host directory,
>> for a download directory, or for some more things I'm forgetting, it simply will
>> not work.
>>
>>    On the other hand, a path that has a colon in it _can_ be used for all of
>> these things, except for a BR2_EXTERNAL.
>>
>>    So I'm no fan of using a colon.
>
> Yes that's a good point, it would be preferable to allow any characters
> in a mount path, and a colon is probably more common then whitespace.

Wouldn't it make sense to omit the "-r" option from read then, so people
can escape the split character (whichever it ends up being)? The only
disadvantage I see is that they'd also need potentially somewhat messy
escaping for literal backslashes, but those seem very unlikely in paths.

> One thing I also thought of, a colon would be consistent not only with
> $BR2_EXTERNAL, but many common env variables use colons to seperate
> paths. E.g. $PATH, $LD_LIBRARY_PATH, $MANPATH, etc. I'm assuming that
> was why $BR2_EXTERNAL chose to use colons as well.

That's why I'd prefer colons. On the other hand a bunch of BR2_* config
variables use space separated lists, so BR2_EXTERNAL is kind of the odd
one out from that point of view. Not sure if trying to unify the style
in either direction is worth the trouble it'd cause, though.

Best regards,
Fiona

> But this is a policy decision, so whichever one is used the code itself
> look good.
>
> Reviewed-by: Brandon Maier <brandon.maier@collins.com>
>
> Thanks,
> Brandon
>
>>
>>    Yann typically has a useful opinion about this kind of thing, so I'm putting
>> him in Cc.
>>
>>    Regards,
>>    Arnout
>>
>>
>>>
>>> Thanks,
>>> Brandon
>>>
>>>> +    mountpoints+=( "${extra_mountpoints[@]}" )
>>>> +fi
>>>> +
>>>>    # shellcheck disable=SC2013 # can't use while-read because of the assignment
>>>>    for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>>>>        docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>>>> diff --git a/utils/readme.txt b/utils/readme.txt
>>>> index 6488d13c75..0cc665e478 100644
>>>> --- a/utils/readme.txt
>>>> +++ b/utils/readme.txt
>>>> @@ -21,7 +21,10 @@ check-package
>>>>    docker-run
>>>>        a script that runs a command (like make check-package) inside the
>>>>        buildroot CI docker container; pass no command to get an interactive
>>>> -    shell.
>>>> +    shell. If additional directories need to be accessible inside the
>>>> +    container, specify them with the environment variable EXTRA_MOUNTPOINTS.
>>>> +    The buildroot directory, the current directory, and the download
>>>> +    directory are automatically propagated.
>>>>
>>>>    genrandconfig
>>>>        a script that generates a random configuration, used by the autobuilders
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
