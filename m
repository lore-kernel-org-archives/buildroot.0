Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6ADD68B30
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 15:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6AF84488;
	Thu, 14 Nov 2024 15:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejHxL1hH7Aau; Thu, 14 Nov 2024 15:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311028448E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311028448E;
	Thu, 14 Nov 2024 15:25:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05497968
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 15:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E78F384487
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 15:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAyRTUVsx4A9 for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 15:25:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.10;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D06C84481
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D06C84481
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D06C84481
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 15:25:36 +0000 (UTC)
Received: from [192.168.0.66] ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5fUy-1t8qZQ2P7K-00FiNi; Thu, 14 Nov 2024 16:25:34 +0100
Message-ID: <4f4607c1-7aa7-4b1c-9d0d-d8fdef58c973@green-communications.fr>
Date: Thu, 14 Nov 2024 16:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, Buildroot ML <buildroot@buildroot.org>
References: <1af29766-5cfd-47a5-adb5-d90ff42dd095@gmx.de>
 <e3e6612f-a9dd-45a6-89eb-9165788c5b8b@green-communications.fr>
 <b25d0a28-cc5c-451a-a719-e932f1fa1aaa@gmx.de>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Autocrypt: addr=Nicolas.Cavallari@green-communications.fr; keydata=
 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
In-Reply-To: <b25d0a28-cc5c-451a-a719-e932f1fa1aaa@gmx.de>
X-Provags-ID: V03:K1:nTuFXquICVf4pg6CYOQj1Oq5hHolvjFoEn/+heUmT28rmVLyFlG
 uVDhOVhkMTKZ41if/3HKXJWHJ4abR3irAo/Uqhj4Uy2IxjbDF63GG9LbqWNn3v7rOma3dKD
 HIkAO71gLqc9mqpZptqVXqNtxeeE1/zMiwn+rBvqZ39yGMu4MP3/mT/EEP/Cq/ktZEH9kPV
 b9DviEC0FxZlqcPkhFIWQ==
UI-OutboundReport: notjunk:1;M01:P0:W74fJ2wAhcE=;jqSp3bvCxgqR0pnwExFv58q4m7W
 48GlMB6rPIlln5GF2gyZ8a7yXToQnjT7v7G+/YQXVCIEI0WwbMk4GLB/clWggkZCqVXJrIc1V
 u0YZovw7ysqg4CST/N8EJEXqqxhYN/RRXKrKvXnE8GZzn8JAaMDvB7QT/pYetXVZgViq5pnlz
 3qlotfVFQO1GuexegbRkKtnyGZ5P5kJM6PP+USIVHM0o9RArSGYDDXGgKBNA2RXhvGdbkWfZN
 j+YfutwcxluCxKN1I35n8xRrDgOvbBrcuQV+QUzHG5FiwoqYYlk/Sm7kB5H8l9ihM11pkWUJx
 D4IITFWcAnFIv5Rvl/b1oj6gEWOTIPhggfhr3xljmWx0TrXi63j/fIf1y86ngVLtBTLXvgEPD
 60OXZfQs9o7JVLwus63XZlA0muct8+bC1+yca3IuqMvbNwa5dQeMxVqyBIq8YHSCGMkPeKCpq
 nGbkve38wd+rxUzkOgpdjLZnvHBYxM6ZgdThnpezSh9P2lAEMT5kHfJdi8IlmzoBpxykXb41M
 TcqulYTsvZIVYCfLzelMcDKUFO6zweHKEEZLr7m5Xw6BeHCCF1m1XC8w5Dcv2dYw+9/0yM0o5
 1YhO8QSyQEWJv43dsV3uKE6h/nuEHXObbZ5F1ZTf2XcnyW7Ga4UvyIByeFEnYtd5sGwnKJ3s4
 xj0XnvODTQ99l0VyVkYezIfJP0gE2Z3TWbYJUWvRhIZ5/fAogP/nr3kvScxm2tipCmruPQ9FI
 PBFz0lJWit0qUJ0BmNJVOg1RPHYDml2ljs1F6iGd7YG54JTFKTL1JEXunVokxZCmJ6RN98qg3
 1Y8tjm+Gr1H7pbYS+wXC1mbmdP05PPGv3/3Jp2371OeWhKpmhPMpDlFE0o9LT0oj90
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] Consistency check for UID/GID tables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/11/2024 12:50, Fiona Klute wrote:
> Am 14.11.24 um 09:35 schrieb Nicolas Cavallari:
>> On 13/11/2024 11:54, Fiona Klute via buildroot wrote:
>>> Hi everyone,
>>>
>>> as pointed out in the documentation [1] autogenerated UIDs/GIDs might
>>> cause issues if they change during updates, so one should set stable
>>> UIDs/GIDs for users/groups owning files.
>>>
>>> I'd like to create a consistency check, to make sure that any files in
>>> the generated image will be owned by users/groups with fixed UIDs/GIDs.
>>
>> Isn't fixing the UID/GID of users enough ? Since Buildroot typically
>> uses usernames to define permissions, making sure users never change
>> their ids is enough, as long as user names don't change. If the username
>> changes, we can probably assume that it is intentional.
> 
> By "consistency check" I mean to verify that exactly the expected
> users/groups exist, with the expected UIDs/GIDs as applicable, and that
> there are no files owned by an undefined user. I want to do this
> automatically (as part of the build) to ensure that nothing is missed,
> including on updates or changes to the config.

So you want to check that the output matches your expectation and fail if it 
does not match, while I want to force the output to be the expectation and make 
Buildroot refuse to use anything else. Both are equally valid ways to achieve 
the same thing.

> My system uses a squashfs image that's updated as a whole, with an
> overlay for /etc. /etc/passwd and /etc/group will be changed, at the
> very least to create an individual user account. So any changes to
> defined system users/groups need to be recreated as a system is updated
> in the field. This includes users/groups that don't own files, if e.g. a
> service added in an update tries to switch to a user that doesn't exist
> that'd cause errors.

I have a similar usecase.

>> The only problem with this is that makeusers is fairly limited. We
>> cannot specify "set the uid of this existing user" or "add this existing
>> user to a new group" without overriding all other fields for that user.
>> I have a local patch to work around that, but it's incomplete and I
>> don't think upstream is interested.
>>
>> It would also help to be able to forbid the automatic UID generation and
>> fail the build when it would be required. But the last patch submission
>> that could do this was rejected.
> 
> A patch to makeusers, or to Buildroot?

support/scripts/mkusers is part of Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
