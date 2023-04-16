Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C49C77B72
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 07:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F1242708;
	Sun, 16 Apr 2023 07:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F1242708
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3HqZSFyk1Mu; Sun, 16 Apr 2023 07:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58CFC4270B;
	Sun, 16 Apr 2023 07:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58CFC4270B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02D091C40A7
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 07:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D019F4014B
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 07:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D019F4014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uty8VR53veWQ for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 07:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58F4F400E5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58F4F400E5
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 07:45:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 490C45FF27;
 Sun, 16 Apr 2023 09:45:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 09:45:27 +0200
Date: Sun, 16 Apr 2023 09:45:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20230416074527.GV2819@scaer>
References: <20230405201403.1410075-1-pevik@seznam.cz>
 <20230410172429.GE2819@scaer>
 <CAB1t1Cyz6=SM2MWOeqMtj9U8KKsarvFEcJaPeJ_nDXtaQ_bK1w@mail.gmail.com>
 <20230414190117.GY2819@scaer>
 <CAB1t1CwsMzTgYyAY_AFftyUh+OdXADpKBXTw0Ot1reibt=fWgg@mail.gmail.com>
 <20230415080547.GC2819@scaer> <20230415084056.GD2819@scaer>
 <CAB1t1CwZS7vreP7z4k5g3Np8JLO-_HEEQczin45pS9RtMS1H+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB1t1CwZS7vreP7z4k5g3Np8JLO-_HEEQczin45pS9RtMS1H+A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681631133;
 bh=GdMwyfaei5xomUs2quGmhCUk3Pwh5OX8MK8H/J95DVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MY0mRxHwQtNxJx25S50DwBS+kV+mSwnsQTzcblakFeBj9i64CEOSS4Zbq4qu4l6vT
 QFsb52lIss8aBDQFJMDZIRpOQ9Azj1xOnjEuhCyfA25ZLVv82Y494stmNpAaZOTZrq
 fsyrwA0EDI3wHViacx/eKy2CmQBWPC7DFMWWfKros12cqEvEVFAeP4zPDWZYXwwT8y
 h/QAO2zAMRvH4DkmlhxvyLv8XXf7BWUFxGyfmIwtkaVVOINPDg8eqhSE0u7gIZmtL0
 GY2TTDfolZwoAyJINhZDQzygdBhmi+zzBdjHdqFEfwHSy+FucQ1TYWw/L7im6Tk3h7
 gbz0PFaza0bug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MY0mRxHw
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: bump version to
 20230127
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Petr Vorel <pevik@seznam.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

On 2023-04-16 01:21 +0200, Petr Vorel spake thusly:
> On Sat, 15 Apr 2023 at 10:41, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2023-04-15 10:05 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> > Now, we could also very well decide that ltp-testsuite depends on kernel
> > headers >= 5.11 for musl toolchains, which would probably be the actual
> > solution, if upstream really does not want to fix that situation.
> Thanks for a suggestion, I'd really try to add the dependency for musl:
> depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
> I'll put the change in a separate commit, with removal of the patch
> and explaining
> the reason (leaving the actual upgrade in a separate commit), so that
> it's easier
> for people to find the reason. If people complain, we can ask upstream
> to reconsider
> or reintroduce the patch. But I'd like to avoid extra work in case
> nobody bothers.

That sounds like a good plan, indeed.

Also, as I understand it, patch 2, which fixes mount_attr detection,
should come first, because it already applies to the current version,
no? If not, then it should be squashed into the version bump.

So, probably, the series should go like:

    package/ltp-testsuite: backport mount_attr fix on older glibc
    package/ltp-testsuite: disable for musl with kernel headers < 5.11
    package/ltp-testsuite: bump to 20230127

Thanks!

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
