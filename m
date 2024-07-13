Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD1C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83F2440105;
	Sat, 13 Jul 2024 11:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtkywFJB2e8W; Sat, 13 Jul 2024 11:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376114018D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 376114018D;
	Sat, 13 Jul 2024 11:58:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8DC01BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D33E24018D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9kTF1mlyJc4 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2378D40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2378D40105
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2378D40105
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:58:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.6]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUqL-1seNtR1BCZ-0045mT; Sat, 13
 Jul 2024 13:58:30 +0200
Message-ID: <5cb4f71a-2ea6-47b8-b70b-7b92088c2b21@gmx.de>
Date: Sat, 13 Jul 2024 13:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240710183917.387437-1-fiona.klute@gmx.de>
 <D2NTNM2UYWN6.3O7CJ5OTL4NDJ@collins.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <D2NTNM2UYWN6.3O7CJ5OTL4NDJ@collins.com>
X-Provags-ID: V03:K1:5xPwHf8czsPxmsaPDU/ELB5SnZrrcrhaX1UpIchd/92Qa4PrEQY
 rSE3bVQtsVXur+A5sCgvXKxpNxlzoupuxkM24JbrVF08/BHqw784iNdBjFuUpZcrSRx0Vyx
 O25qAVM/J3e2VAOhI92F6NfNyaa+h265VpGJh9MzxXnI2PDEXn3M1VpJ3B2EIMnfiFP8f0N
 rlQ6URe3UiVdl/C+UbuAA==
UI-OutboundReport: notjunk:1;M01:P0:mRziEo3wIts=;+U06FF16aIecXSR5kJ3UO8n4hgS
 C3cNoy17OlK8x6eNn2w2tddlttCyQ+NCHzmhq/4CDcLmAT5gRkLUS7bm2OcGu7wYCzGFOS0An
 t49Ct54XHkIJqcQEhL0uNc143kSR12ACYUhhxXV1kq6WcCamKaEvEnUpxK+ATRnkOQ7BT9YGe
 /SQn8zBCW/u458tO1gplTNXM78FJGQ5Vu/pCwzkaMyuBe71O4wFJUF/dcr1UZkgxIbPOgyS64
 Uj4a0XYG7BGPXEy2u7xaqmfAZ3lyyrM+Cw+4p7SiNMT7M+Lfm4bNuUw2jZyrQa7yMurmAkjcW
 m8kLpniUD89ogRr/+6yb2Gq/kR2kMIEN2KYDnoIBeOkVG+SKuKq1UifyQ9tQrFlORHrfd1ZeE
 78b81wcZnQDjYbuZ1rD0bIHdoKz5yeYoErgOOTA76GLHp1jJ+2DmLgSR4m+/I+SAWtmGut5Ej
 CLGymermPO35aLS+mNAERvnly3nQuAOhH6+GK+KPlPZieltRHMYMSq9SKzQqUMNQYCxXOspWS
 gPjkfU7uUJsyhrOwAba5MSjakWE1c8FL4I/50eXheLgsxlyIHfiRJqYmhCsIVWWJ/j2mSYLgi
 k1JtPQ2AovHp0c/Qnl8qk3LpAqDOo4Aer+1Whn2FD020l4tb5KGUFjF4cSen/gpEZIyjNsP1o
 zIdAmYtsj0GXCavpzJYNW6uKZpEr0TeGoP94udlbbxGd/1lSyph9Hif4qC/Dy2bdZ1UVIAuUs
 7T/fXNTtAZE5/BVaoMJILa2fy7xew5BoA0j6saPUcc+9SXUqwUqpwnHx44h8fyZMRLFQYGb0R
 Ftu6tojbvAXzJi72iqsm7uWg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720871910; x=1721476710; i=fiona.klute@gmx.de;
 bh=yOcU//DnxjXU4ZgioufcZU6o2LLPG5HaRUaYIqlAqfk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ivphlfB+y6PBQdl9Etjd7mScfTYze1EU6GVA65zYQxPUGjiW27UK3jvaP+66kumy
 s/L8MHEGxrCAl7OoDCReBp1wxWW5p+O8/vGpUXiOxUljkaX7d+C8S7eba3SCY6xDJ
 bLBUX+/CFH2ylubFsCVEHCxsHvQ11g2tpfnKcphaRHcqURy81wcTTAi0T1Th2e/RU
 EnU54eYpn1kmHjpoMi09EUSNGdzf5PLKqG1dcFUZ+8WlEl0QeEKd4nQWJ/WhO/+uq
 1zWsU3doOgZW4TMgvYaycE/NHrqYrUxXZCxQ4vmwTlTdnsEX2v+gJUmcqYOUpUpbJ
 O9NfuS5LQSPkNOEuQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ivphlfB+
Subject: Re: [Buildroot] [PATCH 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon!

Am 12.07.24 um 21:53 schrieb Brandon Maier:
> Hi Fiona,
>
> On Wed Jul 10, 2024 at 6:39 PM UTC, Fiona Klute via buildroot wrote:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> The BR2_EXTERNAL environment variable is passed into the container,
>> and each path listed in it mounted. This allows using external trees
>> when running a build using utils/docker-run. Testing the existence of
>> the variable instead of a non-empty value allows passing an empty
>> BR2_EXTERNAL variable to disable currently set external trees.
>>
>> Note that splitting multiple paths listed in BR2_EXTERNAL will break
>> if any path contains spaces, the added code shares that limitation
>> with the existing code in support/scripts/br2-external.
>
> Looking at the git history for br2-external, that limitation was added
> in 2016 to accommodate RHEL5. Even Red Hat stopped supporting RHEL5 in
> 2021. One of the maintaners would know better, but I doubt Buildroot is
> still usable on those ancient machines anyway.
>
> Even though Buildroot doesn't support BR2_EXTERNAL's with whitespace. In
> this case I think it would be good to handle correctly. As the split
> BR2_EXTERNAL are passed to Docker before Buildroot, and a malformed
> Docker command can wreck havoc to a machine.

I've sent an updated version that handles spaces. I'm not making any
promises how much of an actual build will work that way, though.

>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>>   utils/docker-run | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/utils/docker-run b/utils/docker-run
>> index 1adb02d74e..dffe784d13 100755
>> --- a/utils/docker-run
>> +++ b/utils/docker-run
>> @@ -90,6 +90,13 @@ if [ "${BR2_DL_DIR}" ]; then
>>       docker_opts+=( --env BR2_DL_DIR )
>>   fi
>>
>> +if [ -v BR2_EXTERNAL ]; then
>> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
>> +        mountpoints+=( "${br2_ext}" )
>
> This doesn't handle git-new-workdir and git-worktree like the $MAIN_DIR
> mountpoint does. It would be good to take the git-worktree logic and put
> it into a Bash function, so we can use the same code for $MAIN_DIR and
> $BR2_EXTERNAL.

Probably doable, but I wonder why this would be needed. Sure, I use Git
for my external trees, but AFAIK Buildroot doesn't have any
assumptions/expectations of how the sources of an external tree are
managed. If I'm missing something there that feels like a pretty major
thing missing from the manual.

Or would this be so people can work with Git on their external trees
within the container if they choose to? In that case I think that could
be a separate patch, not something that should hold up merging this one.

Best regards,
Fiona

>> +    done
>> +    docker_opts+=( --env BR2_EXTERNAL )
>> +fi
>> +
>>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
>>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>> --
>> 2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
