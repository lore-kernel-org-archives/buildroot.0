Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D307DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 08:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3AC41514;
	Sat, 10 Dec 2022 08:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C3AC41514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-9F16zOPFQD; Sat, 10 Dec 2022 08:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD6541521;
	Sat, 10 Dec 2022 08:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BD6541521
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 014C11BF44A
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 08:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDAC940176
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 08:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDAC940176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjSrQ1ucsTVT for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 08:29:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD317400C0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD317400C0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:29:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.151])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4725D780310;
 Sat, 10 Dec 2022 09:28:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 09:28:57 +0100
Date: Sat, 10 Dec 2022 09:28:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Carrier <Nicolas.Carrier@orolia.com>
Message-ID: <20221210082857.GP2855@scaer>
References: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
 <20221205215558.GI2855@scaer>
 <883c29be-2a05-00f6-76d6-cf894e497da5@gmail.com>
 <AS4P251MB061200F650240CFFE6FEF439841D9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
 <97b952a4-2e1b-363c-36f0-0fe2c0da26b7@gmail.com>
 <AS4P251MB0612D4DF753A307318923B9A841C9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS4P251MB0612D4DF753A307318923B9A841C9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670660943;
 bh=9+4KOD7eID3ec/bqNCv23EPYoVWF3o82uEWIr4ajpUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=efDeVEa63PRBScJnpQprlsI3CRfxZv+mW8maBVor6NgK56SDAkpJ8uUAtLI3glTeY
 Bf0QUwPrs4+kvC5x3STDzZLX2t7k4pou3TgPxR3TXYgHBtdDJc7D+DtaEOqw9l81yX
 QUqUArHBSyo2d84uz6fsfQNoovvI/S8gLbhLvMH1TfcWCOs37sKsnfSrW2MT0d5arI
 7O6YBWcE/kN9t25WLD0G41/2tDPAbKckWCVQ4Jy4MVZAb8ygcJTc4aNknhRj8vz8WZ
 IqGI9/F3TshPjO8NhKntb/Xv+YNxtsFJUAONGOqYjTtjkFGLb92TpX3Ml6LglfQK68
 T/Ny5iu1Br0rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=efDeVEa6
Subject: Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicolas, All,

On 2022-12-09 11:07 +0000, Nicolas Carrier spake thusly:
> About the author name, don't bother, I don't mind if you take the
> ownership (read: the blame :D) of the script.

What one can do in this case, is add a co-author tag, like;

    Co-authored-by: Nicolas Carrier <Nicolas.Carrier@orolia.com>
    [Nicolas.Carrier@orolia.com provided the test case]
    Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

> That said, maybe buildroot maintainers would like it to be expanded?
> I don't know the policy for this kind of tests, is it sufficient
> that it demonstrates that the package is able to build something that
> works or is it expected to have something more exhaustive?

It is perfectly fine to have a test case that demonstrates the basics of
the package. This helps prove that there are no missing runtime
dependencies (e.g. for pythn packages), that the basic features do work
as expected, at least in the use-case the submitter is interested in.

If there are more to test, it can be added as time passes (e.g. when we
get a report that something does not work).

We definitely do not want to be able to run the full test-suite of the
package itself; that's not our role.

> Also, there are those:
> self.assertRunOk(f'userdel {username} || true')
> self.assertRunOk(f'groupdel {username} || true')
> Which I had to had, but I never fully understood why they were needed.

assertRunOk() checks that the return code is zero, and drops the output.
So, if self.assertRunOk(f'userdel {username}') fails, then it means that
userdel in the target did fail, so it would be interesting to check why:

    output, ret = self.emulator.run(f'userdel {username}')
    self.assertEqual(ret, 0, f'Failed with {output!r}')

(I think in fact ythat this is what we should do in assertRunOk())

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
