Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C4AC3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D5F64007B;
	Tue,  9 Jul 2024 09:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIw0sAv6OdBb; Tue,  9 Jul 2024 09:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DBC4009D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8DBC4009D;
	Tue,  9 Jul 2024 09:56:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDD521BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6C5580466
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uevb_939PiYU for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:56:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D311F802EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D311F802EE
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D311F802EE
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:56:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.127.252]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXpQ-1srcfk23xQ-00Tb8T; Tue, 09
 Jul 2024 11:55:56 +0200
Message-ID: <42d13dfb-0ac3-4939-b50b-a4187df30e89@gmx.de>
Date: Tue, 9 Jul 2024 11:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240704101631.1860647-1-fiona.klute@gmx.de>
 <20240708235339.5dbf3da4@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240708235339.5dbf3da4@windsurf>
X-Provags-ID: V03:K1:kIIRr22XfD6oj2O/c1Uc+PDg7CBUYZSy5pJNonbqvyTkIFEOXTy
 rggyzk/K/nIJRa189XoWgy3fnygnxA0b/L9PYwxsANWdC/fTTadHMq73TI6mhWwin9x1SjK
 fZ7VQ/u/zWUQ4/DQHV2h4YV9NRp82YtvoQUcaNgLAa6b+fVymrZcbPasoHmz6vYjipKyjiu
 5ghqhDa7yWGOD4ZH9vAqA==
UI-OutboundReport: notjunk:1;M01:P0:IsoGHVONl3I=;ymwOVPy5NNEnkMl20hE32jHBkLJ
 zLK+IV+WTLF1k5Qp/6ZHcPm6GuPVhsd568InETVpIqIWUkIf+bhWHB6gFuqc3CtcMK0Gsv0/p
 03BB4rbKUVjX+qey7+tfQGjpUoQBgArxrD51lNy19kFLb/xTvlhGak4PgQFdYKxqWcq1cxv/Y
 f5RN2DB5hREjqTzayHCtuMdZ6ZtlP2LnAQlZ93fTodWhR6l4itoFB1N5T1ZTu8QTVgEkEzQvt
 dp1BZZU4uucPOZ31D/z77/2ntxJMapjV0XMuBN7I+dq0QtB2ypuMRboFWkSkzY6hao8++hAEF
 Y3cqLMpKyHxEYgGI5WgfJbMTYxPqapuAthHH0lyIQojYSbj7skyIYUPSFErbD4J8n5XWdFCNU
 q67eMsdyJjH3e66qB40WmQ3lOepZDsT8gEgem6IqVoJM6uIVtqNZWolf9sO9+29MLwm9CafVC
 cqwVPhdOdt6tAl7lAskFRz7qehvheP87E9h5iYo/11aoPIvpuXIY4cYRG4V1pWlUvrjzK2v3Q
 7OY1rXDVAJeC3vSJajfjfwTci9wGmEzdCIW94e8tTMxPRiYtYmm28VaQFUA5mFzyJ3UaBL8aC
 6fQZqW8EeViqQSrmPCn5uYarUp76o0ykmYL87tz3ujyGVxtnaUlWaNLM9ZLGYPzVbKH5qeWOJ
 H6qzPl0mWAWpQXFegKK9Fgv24FzmVbfv8bNWBkY3TxENhHcNQzt1eQMWdXVwE8+fOS6MF6YVk
 d4v71VJBsuB1U2LMESGUx1BQAnpOej/TtJ0Dx5XuuJ3G2JQVcSWqhhRPzOWYsJflILx8jatDX
 cNbNPQ3AHlFnkhzc3Q9UZTehpkO//Q/DVHyEqTVTqezYM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720518956; x=1721123756; i=fiona.klute@gmx.de;
 bh=YgzBayxPnHYK38OgXeFGuNdr5Hm0oFL8/LOYHhAm+yc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=JMP5eGQaJFVLUE3wUt4lYxYiqv/KYpimeyQWnuGUqtfsB6ey2rikJghIVJglUeeg
 GhU82YCfpBezIuKi2isPw/3tdjQOkmbOllzbZODzVcHZWuO4Vw9ZybhPr3IfA2gRj
 qqdTCttkidWqL7S1D3QXXclU+6Gmxbcpsy/7tohSXIsCYFDGZYdq7AIrRsEX4hZVu
 5+ixIIMe78B/KyjB+aK08izk0O5ZzapawO/qjUVTOxcOKrumyAxMylbfW4chZqgI0
 QnWH7AtWbu2wxe2PhKbqZj55ZTdWXW501OvLd/D0Nt05RILmwD9zM/P28qxboeQBm
 5PwyC09v+KGP4b9cLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=JMP5eGQa
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 08.07.24 um 23:53 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Thu,  4 Jul 2024 12:16:28 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> Fiona Klute (WIWA) (3):
>>    package/openssh: manage sshd using start-stop-daemon
>>    package/openssh: fix init script indentation
>>    package/openssh: implement "reload" using SIGHUP
>
> Thanks, I have applied your series, but I have reworked quite a bit
> PATCH 1/3 and 3/3 to follow the canonical example of init script we
> give in the Buildroot documentation, see:
>
>    https://buildroot.org/downloads/manual/manual.html#adding-packages-start-script
>
> And review the final commits:
>
>    https://gitlab.com/buildroot.org/buildroot/-/commit/8900311b7e5450082cace986533a093d37900efa
>    https://gitlab.com/buildroot.org/buildroot/-/commit/df605de1349251687640519fcc2d2147cf146af9
>    https://gitlab.com/buildroot.org/buildroot/-/commit/2c14a55c6cf28ada9f1d3d17d3b11370829372ca
>
> Hopefully I didn't mess up :/

The script is functional, but the use of long options was intentional
for readability and I'd rather have it preserved. Having existing
scripts in a hard-to-read style doesn't seem like a good reason not to
be more explicit in new/updated ones [1]. That was the reason for the
question (and patch) about which Busybox options I can rely on when
writing init scripts.

Regarding the added "-q", if a start (stop) command fails because an
instance is already running (not running) with the current version you
only get "Starting sshd: FAIL", while with my version you'd see the
*reason* in start-stop-daemon output. That seems important to me. I only
had "-q" in the reload function because the "stopping" output of
start-stop-daemon (when it's actually just sending a SIGHUP) seemed like
it might confuse someone.

Best regards,
Fiona

[1]
https://lore.kernel.org/buildroot/6d02d2d5-e71e-45b3-a447-e81521085e7a@mind.be/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
