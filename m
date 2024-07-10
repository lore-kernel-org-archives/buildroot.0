Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1489C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 17:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85ED340FE2;
	Wed, 10 Jul 2024 17:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuxvLtcyPD_6; Wed, 10 Jul 2024 17:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7158D40FD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7158D40FD8;
	Wed, 10 Jul 2024 17:39:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6D881BF59B
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 17:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D21C340FE0
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 17:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrDo8khLGBw9 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 17:39:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43FD140FCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43FD140FCF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43FD140FCF
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 17:39:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.120.32]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mv2xU-1s9nO80UPw-011RUS; Wed, 10
 Jul 2024 19:39:32 +0200
Message-ID: <c72ea8f5-e785-4d85-9cee-f690c78a19e2@gmx.de>
Date: Wed, 10 Jul 2024 19:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
References: <20240704101631.1860647-1-fiona.klute@gmx.de>
 <20240708235339.5dbf3da4@windsurf>
 <42d13dfb-0ac3-4939-b50b-a4187df30e89@gmx.de>
 <20240709120659.60e32214@windsurf>
 <f93e8075-a773-4d47-b6fe-04bb714b06db@gmx.de>
 <Zo0is1FyTmzcIPbi@tl-lnx-nyma7486-2>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <Zo0is1FyTmzcIPbi@tl-lnx-nyma7486-2>
X-Provags-ID: V03:K1:9Eyv5+BK/lyL2z32mRPo5enRCOIoJ15ggN5yG4Hr8afeSNyzS3A
 odq+MDcjX/SQqupXtBSufJJCMAIvjcidd9piZvozIOLmX/0/fNRm69mVR9fm9a5v3hYlAeh
 G5pvbhxqJaetoDI6S1oqJfBrRmmra8tltqNCq7jT1sbaasvXf2YP8IGwWyatG8VxcO8GHkr
 xXl+ytCmvyf5pM+P9Ux+A==
UI-OutboundReport: notjunk:1;M01:P0:W0hXPyq5EpI=;kIXtdkVXOA1MQaj1JMOKyzWrKJX
 Dswn92eMKzgCM8Wq/XZzUdeY9/UvXz/hOLCwI1dzBAuXu/AePihZ0z3Q1tVa5541htksIXrfz
 lfbemAxc4qPI8GiDSw8m/rKSIVc7afR+l+x0lOT0Z3tmVOs8lCMsiRDKyAEYfPZjg1xpGxR+x
 eNchaa7uX+faKyarfJDEiAW1Ys6OV+JhI5vT08WMxjEMBJfN5vwk90WoX8tfrs00N0WFTj91+
 2tuB86q3dlgEIAPqFFpOAgyK2apYCU9z3xx4sLd3nQV/uQwvSrcclTYEzDMI1u/sg/+74Vn5e
 dEIhWXydOWg5E/Nxh8ql5TZhmI+SgpWvWMet1JZ3VzvqacqrUoLmh9Ixmta0XepjSCcr+TSPR
 zJmgK57vbDstLU+5upEhTkAF9qQJSpqi9K1AoQVRimM6F84PC2huU4oXLIAMgc/Z9dNG4pwjs
 Kd3WDxy58ML6XPsSdMkWy6NKLQ7CIyZ+i5iZ5mQxrw9FYn9gSQovQg/bgwXND28ahv+SYMM/u
 ug7ISej0IKWhP5vFEHyOTum9EU52YAnEpV75NKi55S5seFBZqHw2AluhNJZ9MMnpyJFrtx0/p
 OrZLW5qjD483w049ZjVtqzVEVVcWfGqsbSL2X4AseU9wHgZGYcisyVqJ2Vs3x7nH4ssTp39us
 48Rr+WXPW6lp8RTGhM71eVdOCaaPiAIgMvUuJ0I2vCgMe3kZ3gtG/Y+oROoyZBrj3cOXMJTNX
 V84Pr8QtikkS46IzGCVLpSzu+P/DNG8w95dJ+KMoJXR52COq6sYFradZAeisz4ttqFyqcM/8x
 I7N7am86Qu8HAqq9kU7wKZPw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720633172; x=1721237972; i=fiona.klute@gmx.de;
 bh=Fo6ACIbz8LTmmitJhPR3NrOHKJV05Z2OsynOkiT+kGA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BUtQeB6mUVL5huCKMdHdLoS2LdAwXNk1dl5FIGtHZ+JEa/XGGKedhf6v6qg2C4w1
 OOkI384cmr4qNoXbV/e//S0rpgN9sLD0qOrUcir9EML+Qam+dCiJvIYpuEYkI32Ja
 q4vo1PPwaoAsts9kIqCzsihTbwraFc+aKIgu+Zezl3EvQ65CUjz2oJQbVnM73bfXQ
 P7M2JnsoMqUk8vlEAET8+l22rs+H7Kf7YHgZyIVt10abCI80gSp93rzhhbfRv5pEH
 lVOVAlrrk2HC/qAFfXGA9eEkVGAGazpnMqOAmrIrvII29C8xn8qjG+Qphewa4TGLx
 JD/+Kc6xh0YRw3PnnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BUtQeB6m
Subject: Re: [Buildroot] [PATCH v4 0/3] Refactor OpenSSH init.d script
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.07.24 um 13:44 schrieb yann.morin@orange.com:
> Fiona, All,
>
> On 2024-07-09 13:31 +0200, Fiona Klute via buildroot spake thusly:
>> Am 09.07.24 um 12:06 schrieb Thomas Petazzoni:
>>> Hello Fiona,
>>>
>>> On Tue, 9 Jul 2024 11:55:56 +0200
>>> Fiona Klute <fiona.klute@gmx.de> wrote:
>>>
>>>> The script is functional, but the use of long options was intentional
>>>> for readability and I'd rather have it preserved. Having existing
>>>> scripts in a hard-to-read style doesn't seem like a good reason not to
>>>> be more explicit in new/updated ones [1]. That was the reason for the
>>>> question (and patch) about which Busybox options I can rely on when
>>>> writing init scripts.
>>>>
>>>> Regarding the added "-q", if a start (stop) command fails because an
>>>> instance is already running (not running) with the current version you
>>>> only get "Starting sshd: FAIL", while with my version you'd see the
>>>> *reason* in start-stop-daemon output. That seems important to me. I only
>>>> had "-q" in the reload function because the "stopping" output of
>>>> start-stop-daemon (when it's actually just sending a SIGHUP) seemed like
>>>> it might confuse someone.
>>>
>>> I'm fine with both, but then I think the documentation and the
>>> canonical example it refers to should be fixed first. This is how we
>>> declare what is the "right" way of doing things. Otherwise, we'll keep
>>> on using these as a reference for all future scripts, and we don't have
>>> a reference point that tells us how things should be done when fixing
>>> existing scripts or adding new ones.
>>
>> Makes sense, I'll try to update the reference.
>>
>> Is there some way to get an asciidoc
>> "include::package/busybox/S01syslogd" to work instead of copying the
>> code into docs/manual/adding-packages-directory.adoc (as it is now, and
>> not exactly identical)? It seems like the path is resolved relative to
>> $(OUTPUT)/docs/manual instead of the source, I didn't dig into the
>> Makefiles enough to see why yet.
>
> This is so that "documents" can have generated parts. This can be
> achieved by defining [DOC]_POST_RSYNC_HOOKS, similar to what we can do
> for packages. For the Buildroot manual, you could add such a hook to
> copy what you need.
>
> Note that you can't include a file from a code-block in asciidoc, so
> you'll probably have to generate proper asciidoc, something like.
>
>      define MANUAL_INIT_SCRIPT_REF
>          { \
>              printf '---\n'; \
>              cat package/busybox/S01syslogd; \
>              printf '---\n'; \
>          } >$(@D)/S01syslogd.adoc
>      endef
>      MANUAL_POST_RSYNC_HOOKS += MANUAL_INIT_SCRIPT_REF
>
> And then you may include::S01syslogd.adoc

Thank you, the hook works, and actually even with include inside the
source block [1], so I just need a "cp" in the post rsync hook. Using
include does drop the line numbers that are hardcoded in the current
inline code block, but I hope that won't be an issue. :-)

Best regards,
Fiona

[1]
https://docs.asciidoctor.org/asciidoc/latest/verbatim/source-blocks/#using-include-directives-in-source-blocks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
