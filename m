Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF19C001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 16:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5870181F25;
	Tue, 15 Aug 2023 16:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5870181F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AI2nAeZqdP5H; Tue, 15 Aug 2023 16:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E7DA81F97;
	Tue, 15 Aug 2023 16:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E7DA81F97
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DA571BF3D5
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 16:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7CEA40CB8
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 16:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7CEA40CB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ay5rkd_CQ-DY for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 16:30:47 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA0914016D
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 16:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA0914016D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6587:c204:11b1:7ba6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DFBE913F8AC;
 Tue, 15 Aug 2023 18:30:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 15 Aug 2023 18:30:39 +0200
Date: Tue, 15 Aug 2023 18:30:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230815163039.GF2603@scaer>
References: <20230604025204.324443-1-aduskett@gmail.com>
 <20230814000034.35275fc0@windsurf>
 <c4cad771de9563a40a3205c2b837d6e9@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4cad771de9563a40a3205c2b837d6e9@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692117044;
 bh=DDnrnLNTmO7QzaEsGcXz0eoPQ9NKKzhglXvqWsqD1ng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JAf8Q4ZeSkGDUPqYSUKVYtu5jWGxEemwYl2CQemz45JettIBUcPeGtVJlG9qaAmo2
 110qsDOPSzbiOx+DbDApjBpDNzAc9lANm/7xd46W2E4rwRQmmuhOrjrTQK6yqcDZfM
 jDuc/4mUk8FaZ8qZ6gcdm1NZbcUoptpqWqX4hItBW4SpeDxzS6GNE7jCEUo1zE+E2M
 gHgJJE7TM5vVBLKWtOGo93P9TCzwOmqdXH9P1uWqbOL0HWwkUL5zqIkFpeHMtblwz3
 3NF+QVe0MQ+fnYJPcS1cch1s9je/TD6TCKJCnSFYkADm/k+OBQ4FQJAZHOrqbG5kgp
 3k46TmPfRWscw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JAf8Q4Ze
Subject: Re: [Buildroot] [PATCH v2 1/1] package/firewalld: new package
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-08-15 17:00 +0200, Julien Olivain spake thusly:
> On 14/08/2023 00:00, Thomas Petazzoni wrote:
> >On Sat,  3 Jun 2023 19:52:04 -0700
> >Adam Duskett <aduskett@gmail.com> wrote:
> >>Firewalld provides a dynamically managed firewall with
> >>support for network or firewall zones to define the trust level of
> >>network
> >>connections or interfaces.
> >One thing that would be really nice as a follow-up patch would be a
> >test case for the runtime test infrastructure. This is especially
> >relevant as it is Python based, so it is easy to miss runtime
> >dependencies that might be needed. I've added Julien Olivain in Cc, who
> >can provide guidance on that, as he has probably written some of the
> >most complex/elaborate test cases we gave in our runtime infrastructure.
> 
> I'll be happy to write such a firewalld runtime test.
> 
> When trying to do it, on branch next at commit eea0c9f, I was not able
> to run any of the simplest firwalld command (Python nftables module
> cannot load).
> 
> With a configuration such as:
> 
>     make qemu_aarch64_virt_defconfig
>     utils/config \
>         -e BR2_PACKAGE_FIREWALLD \
>         --set-str BR2_TARGET_ROOTFS_EXT2_SIZE 200M
>     make olddefconfig
>     make
>     output/images/start-qemu.sh
> 
> Running simple commands, logged as root on qemu target, such as:
> 
>     firewall-offline-cmd --version
>     firewalld --nofork --nopid
>     python -c 'import nftables'

I did about the same, starting off with qemu_aarch64_virt_defconfig,
but manually tweaked the configuration to switch to a bootlin glibc
toolchain, and manually enable firewall. And it works:

    # firewalld --version
    usage: firewalld [-h] [--debug [level]] [--debug-gc] [--nofork] [--nopid]
                     [--system-config path] [--default-config path]
                     [--log-target {mixed,syslog,file,console}] [--log-file path]
    firewalld: error: unrecognized arguments: --version
    # firewall-offline-cmd --version
    1.3.2
    # firewalld --nofork --nopid
    2023-08-15 16:24:04 ipset not usable, disabling ipset usage in firewall.  Other set backends (nftables) remain usable.
    2023-08-15 16:24:04 iptables-restore and iptables are missing, IPv4 direct rules won't be usable.
    2023-08-15 16:24:04 ip6tables-restore and ip6tables are missing, IPv6 direct rules won't be usable.
    2023-08-15 16:24:04 ebtables-restore and ebtables are missing, eb direct rules won't be usable.
    ^C#
    # python -c 'import nftables'
    #

Regards,
Yann E. MORIN.

> All fail with output such as:
> 
>     Traceback (most recent call last):
>       File "<string>", line 1, in <module>
>     ModuleNotFoundError: No module named 'nftables'
> 
> I quickly tried with updated version of libnftnl and nftables proposed
> at [1] but did not helped.
> 
> Upstream nftables reworked Python integration in commits [2] [3] but
> are not yet in a release.
> 
> So I believe the nftables package needs a rework, at least for its
> python support. We should first write a runtime test for it (including
> its Python support). Only then, we should be able to write a runtime
> test for firewalld.
> 
> Best regards,
> 
> Julien.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/list/?series=368887
> [2] https://git.netfilter.org/nftables/commit/?id=b3def33efecb2f7be39fc9aefc9546907202056c
> [3] https://git.netfilter.org/nftables/commit/?id=8e603e0f7eec7c0000344a004228a30fbf0ece5c
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
