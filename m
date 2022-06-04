Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E397C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 14:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A113612BD;
	Sat,  4 Jun 2022 14:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UieMMyXijSaB; Sat,  4 Jun 2022 14:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B6F612B3;
	Sat,  4 Jun 2022 14:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C94E1BF322
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 14:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5872941A1C
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 14:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5cQ2p-ZdBba for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 14:52:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2319041A13
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 14:52:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2BF6E5FF20;
 Sat,  4 Jun 2022 16:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654354345;
 bh=jc7+qSeg+m3AiVG2B3UyXG38uJasaHWs5SZBMXrInBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iroPsYnWtBHkpKe/GMsjP4gUsBZT1+CaeqKj8z6VFBSNk64wbFyeg2YWagEnNa1ko
 NiHdwCk6owFYdms5Yp8i9ztyUiwLQK4yafoWi683oWBR2lo7PGQL60w/1xAze/34C1
 KG0erHMMDqJcCxjX4A4ThAvnh5ZFkiAzY2MlrBbjrXK6/fnqGTsH0O7GIU+hJAGH3e
 nilPM3kGf0MEgId9Ayxg6n3T5VB1NdWnyMc4/MpN8xcTfDIjAQQa7u0YoI+B2GmU5G
 JYmTvKhrUYYo7qZEDxtH1EoayATzXCp9lHDq/UqajJ8FUQt/thZKXMGcuPbOeCdtAJ
 3FN/AXR6xqScg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 16:52:21 +0200
Date: Sat, 4 Jun 2022 16:52:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <20220604145221.GM427639@scaer>
References: <20220521204348.1023965-1-fontaine.fabrice@gmail.com>
 <e828792d-8371-7fe1-bdd1-b7f729fa7097@lucaceresoli.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e828792d-8371-7fe1-bdd1-b7f729fa7097@lucaceresoli.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qpid-proton: needs C++ and
 threads
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2022-05-23 15:19 +0200, Luca Ceresoli spake thusly:
> On 21/05/22 22:43, Fabrice Fontaine wrote:
> > qpid-proton needs C++ (and so threads due to proactor) to avoid the
> > following build failure:
[--SNIP--]
> If upstream does not provide _working_ support for building without C++,
> then I would not spend much time in trying to do so.

Yes, upstream jsut dismissed the issue by requiring C++:
    https://github.com/apache/qpid-proton/pull/366#issuecomment-1146334165

    This change won't work - you actually do need a C++ compiler to run
    the tests so the CMake build configuration is correct. So yes you
    actually do need to make a build dependency on c++.

I don't think they are correct in that statement, (i.e. testing for the
presence of a C++ compiler should not require a C++ compiler...), but
that's their call to not want to deal with the issue, so I applied
Fabrice's patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
