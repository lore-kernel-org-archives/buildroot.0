Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005B7C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 14:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F99583B07;
	Sat, 20 Aug 2022 14:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F99583B07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1h0OZft5kvwd; Sat, 20 Aug 2022 14:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614D083403;
	Sat, 20 Aug 2022 14:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614D083403
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 143151BF2A6
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 14:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E200183403
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 14:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E200183403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlyAmKAw0ZUt for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 14:21:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A3D833A7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86A3D833A7
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 14:21:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 53FA36013C;
 Sat, 20 Aug 2022 16:21:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 16:21:34 +0200
Date: Sat, 20 Aug 2022 16:21:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220820142134.GK2167049@scaer>
References: <0e18605c9938776a707a4aab032be74a1a9afe8e.1660828116.git.stefan@agner.ch>
 <20220820121323.GI2167049@scaer>
 <93037fb13a2d46a9ad5d4821b8cf76f4@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93037fb13a2d46a9ad5d4821b8cf76f4@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661005298;
 bh=5HMsvw6sYfKIx3SVFI4UoAVrzHs1APKc4pZxFG0cg7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6VMWvUS2DyZoJmQFYJgrLeq67PVOVdaQdyRX9yMCf6Rj5V4hG56ERaMSHUSnOFAk
 8ZIVwEbszS1KvbQHmCgpdRrvHyw+L57kbSRengWrRpwyBcHWtlcl3K0NYEAtQoFLJk
 X56e6Q+4AkWQJuJFhj72mDm/XGpds/QJV9rsL+66fDKNbr8y7yyF8lbcqyUWPELieu
 JQ7LMUothqFSF5A1lWpgiDYU4XdslwygaKGQTxeqVKf90cPWcdK628U+kNjNARBbgZ
 rkRk/h9/FZgdfwHIWj0kYn+VR9xaukO3dUlHdjG6oh9G0ePrN66l/qpKlG8g157nQi
 NcidqsMFa7l8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E6VMWvUS
Subject: Re: [Buildroot] [RFC PATCH] package/linux-firmware: Add more Intel
 WiFi 22000 series
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2022-08-20 15:40 +0200, Stefan Agner spake thusly:
> On 2022-08-20 14:13, Yann E. MORIN wrote:
> > And then, we'd have to code some non-trivial magic that iterates over
> > all iwlwifi-Qu{,Z}-*.ucode and check if their API part is in the range,
> > and for a single "family" of firmwares, keep the highest one (how do we
> > know that two firmware files are f the same family? Just because they
> > only differ in API version?) That's a bit brittle...
> To avoid the direct dependency I was thinking of using the
> BR2_TOOLCHAIN_HEADERS_AT_LEAST Kconfigs, essentially maintain a list of
> default max supported API per kernel version in Kconfig. Not sure if
> that is a good idea.

Indeed, not really, because the version of the running kernel may be
different than the version of the kernel headers used to buid the
toolchain.

For example, you could build a toolchain with kernel headers 3.0, and
run a 5.19 kernel. In such a case, the highest API derived from the
kernel headers version may very well be lower than the lowest API
supported by the running kernel.

> >> +LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB = $(call qstrip,$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB))
> >> +LINUX_FIRMWARE_FILES += \
[--SNIP--]
> > This list is not entirely alphabetically sorted.
> This is on purpose, I've used the order in
> drivers/net/wireless/intel/iwlwifi/cfg/22000.c.

Then, add a comment above, like:
    # Keep this list in the same order as in kernel's driver

> > Also, why do you extend the prefixes, from iwlwifi-QuZ- and iwlwifi-Qu-,
> > to include extra c0, b0, a0 and so on? Why can we just have:
> >     iwlwifi-Qu-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
> >     iwlwifi-QuZ-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
> Same reason: Align with kernel sources.

But then, users would had a need for one of the firmwares now excluded
from the list will have no way to enable them.

> > Oh, and in at least linu 5.17, there are also references to
> > iwlwifi-QuQnj-, iwlwifi-SoSnj- and a bunch of others. And
> > specifically, there is also iwlwifi-cc-a0- which in Buildroot is
> > installed with BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260 and not
> > BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
> There are more firmwares in the kernel sources than present in the
> linux-firmware git repository. This is essentially the common
> denominator of Linux 5.15 and the current version of linux-firmware. It

But why limit ourselves to what is know to 5.15? If someone uses 5.19,
they might need other firmware files? And even if 5.15 and 5.17 have
exactly the same set, then the upcoming 6.0 might need more or a newer
familly (the QUQnj or QUSnj for example).

> might deploy too many firmwares for an older kernel, but it is
> guaranteed to work (list a non existing firmware causes the tar command
> in the build step to complain).

Well, it is easy to solve:

    # Fiter-out firmware famillies that do not match the API version glob
    # so that 'tar' does not whine later on.
    LINUX_FIRMWARE_FILES += \
        $(notdir $(wildcard $(patsubst %,$(@D)/%, \
            iwlwifi-Qu-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
            iwlwifi-QuZ-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
            iwlwifi-QuQnj-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
            iwlwifi-QuSnj-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
        )))

But adding new firmware "categories" (QuQnj or QuSnj et al.) should be a
seaprate patch, of course.

> > So, maybe we could split the families further as an alternate solution?
> I'd prefer to group them as they are grouped in the kernel sources.

I am slightly conflicted on this one. I would prefer they be grouped by
whatever the user can use to identify the chip: by actually looking up
the reference on the chip, by looking up lspci/lsusb/lshw/... But I can
also see the appeal of matching the kernel driver... But if we were to
change the categorisation, that would be in a separate patch.

But maybe, going for boolean entries was not a good idea to begin with,
and just a single glob option for all of the iwlwifi family as a whole
would be better. Like:

    config BR2_PKG_LNX_FW_IWLWIFI
        bool "iwlwifi familly/ies"

    config BR2_PKG_LNX_FW_IWLWIFI_GLOBS
        string "iwlwifi familly globs"
        default "*"
        depends on BR2_PKG_LNX_FW_IWLWIFI
        help
          List of shell globs to match firmware files.

          For example:
            - BR2_PKG_LNX_FW_IWLWIFI_GLOBS="*"
              would match all of:
                iwlwifi-*.ucode

            - BR2_PKG_LNX_FW_IWLWIFI_GLOBS="Qu-* QuZ-*"
              would match all of:
                iwlwifi-Qu-*.ucode
                iwlwifi-QuZ-*.ucode

This is way easier to do and, with the $(wildcard) clause I suggested
above), should cover all of the iwlwifi cases, and we can coalesce the
22000, 22260, 3160, 3168, 3945, 4965, 5000, 6000G2A, 6000G2B, 7260,
7265, 7265D, 8000C, 8265, and 9XXX, into a single option with a glob.
But that is not very user-friendly...

Thomas, Arnout, Peter: thoughts?

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
