Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37C1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 12:23:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C764E60724
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 12:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C764E60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83E76401BD;
	Sun, 24 Oct 2021 12:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxQaBg-GSo6N; Sun, 24 Oct 2021 12:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57230401FB;
	Sun, 24 Oct 2021 12:23:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3211BF48C
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 12:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D8E460788
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 12:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQQc3WHmvz6f for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 12:23:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 126AB6069C
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 12:23:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8cf8:eeb7:8c5b:1909])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D03527802CE;
 Sun, 24 Oct 2021 14:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635078217;
 bh=kN3u2okuCCAtgQnW6L33jDANAt8XFrydMaSgVTTompU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCXVBEWQkUagoZ1yq2WcqK4wphp8n5gGQ5D+DNDBjKHm5CfVSH2INQ2B+BPnSVlPD
 MUNVo4UeKoRVUmZ23vU7ETphdElQ8PfM5ccnpwHMUOsqwD3eiqjV5ZUZHiqeXs3FCl
 emsYppfIrtcDuWPpEQSh4SZJeHCo0cO+ilh3wy+wUUJ8xGli4k36Ap9TOuUJqUrGjS
 FHirkRzqnqiUcOQa7m6t6laNltxbKv6GoygXIRRst62eFcb5UigVOOBMkojUX5dKG3
 RgDmVWKP2p92IxoIn7PNQI6DUxzzFj/f4IusaTBkDZVVGNogkti1XVs5SsF88LBvcO
 S6DChaERca3LA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Oct 2021 14:23:26 +0200
Date: Sun, 24 Oct 2021 14:23:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20211024122326.GO2400@scaer>
References: <e8b54604a28b4a35b266b5e788d92431@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8b54604a28b4a35b266b5e788d92431@AcuMS.aculab.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Grub2 changes since 2021.10.2
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
Cc: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 'Peter Seiderer' <ps.report@gmx.net>, "Walter,
 Stefan" <stefan.walter@iml.fraunhofer.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David, All,

In the title, you mention "2021.10.2". There is no such release of
Buildroot... Did you mean 2021.08.1, 2021.02.2, or something else?

On 2021-10-23 16:20 +0000, David Laight spake thusly:
> Do the recent changes to grub2 make it any easier to install
> the version of grub2 built by buildroot?
> I'm pretty sure the commands in the scripts I inherited install
> grub from the host system.
> This is made much more likely because the actual boot disks
> are made on a second system (by production, not development).

I am not sure I understand what your problem is...

From what I understand, you have some scripts, that you did not write,
that you do not entirely understand, that do some magic fiddling with
the grub2 as installed by Buildroot, so that part of the build happens
on one machine, and another part on another machine.

If that's the case, then this is clearly not something that has been
envisioned by Buildroot. And I am not even sure this is something that
we should even cater to...

> I've tried setting the BR option to include the grub objects
> in the built 'root' filesystem.
> While this adds files to the image, even when booted from the
> disk the grub install program fails - IIRC due to missing files.

And now, you are speaking about things that are missing in the installed
grub on the target. Seems like this is a legitimate issue, even if
separate from the rest...

However, you are not providing enough context and details as to see what
is missing. Maybe you could provide a runtime test with your use-case,
like we have in support/testing//tests/boot/, to validate that the grub
installation we do actually works as it should?

You could take a peek at support/testing/tests/fs/test_iso9660.py for a
few already existing use-cases of booting a system with grub2, from a
CDROM.

> Either the host's own 'grub install' program needs to install
> these files from somewhere (I could parcel them up somewhere else)

All the files installed by the target variant of grub2 are installed
in output/images/ (the actual boot files, like grub.img for the legacy
BIOS boot) and, if $(BR2_TARGET_GRUB2_INSTALL_TOOLS)==y, to
output/target/lib/grub/*/ (where grub modules for each platform are
located) and somewhere in output/target/bin/ and output/target/sbin/
(for the grub tools to run on the target).

> or I need to get the 'host' version of the required binaries
> into my release (they should run on production's system, the
> ones from the image itself won't).

Again that two-machine setup that has nothing to do with Buildroot...

> This is all x86_64 using MBR disks (EFI causes too much grief).
> I understand all about the x86 boot process (I rewrote NetBDS's
> MBR and PBR code many years ago),

I do not question your knowledge about how a PC boots, and from what you
said, I believe you even know way much more than I do.

> but where grub2 installs anything
> (and which programs update what) seems to have been deleted
> from any user documentation.

That the grub documentation is lacking can't really be blamed onto
Buildroot, can it? ;-)

> AFAICT grub writes all over parts of the disk (like the rest of
> track 0?) that aren't actually reserved for boot code.

That's too bad, because I had seen a recent thread in the grub archives,
that indeed seem to imply that there were quite a lot of locations where
grub would write things, but I can't find that thread again... But
again, I don't understand how this is related to Buildroot, except if we
were to generate improper disk images borked because we put things
overwritten by some grub tools. In which case a runtime test to validate
that would be much appreciated too.

> I've also got a problem where the grub build objects to /usr/bin/gcc
> being earlies that gcc 5.1 (it is 4.8.5 on a Centos 7 system).
> I expected everything to be built with the gcc 10 I specified.
> Has this been fixed by the recent changes to the CC path in the
> grub package?

That is because the host variant grub build would so far build and
install modules, and so would use the host compiler.

This has been fixed as of yesterday, now: the host grub build no longer
builds for any platform; it just builds the tools. The grub modules are
now all built as part of the target variant, for each of the platform
enabled in the configuration.

If $(BR2_TARGET_GRUB2_INSTALL_TOOLS)==y, then all grub modules are
installed in output/target/lib/grub/*/ now (as they were before the
recent multi-platform rework; so at least in this respect, we've fixed
that regression).

What might be missing, though, is an option to also install them in,
say, output/images/grub/*/. But this would be a new feature, as this had
never been the case.

And in the end, I am still not sure I understood what your problems
are... Maybe all you need is a way to actually collect the grub modules
in a known location?

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
