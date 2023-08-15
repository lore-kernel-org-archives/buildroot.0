Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D18DC0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 15:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B40E681F19;
	Tue, 15 Aug 2023 15:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B40E681F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rfEwDwQuYAd; Tue, 15 Aug 2023 15:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE9A581F12;
	Tue, 15 Aug 2023 15:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE9A581F12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 563091BF3FC
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C62241550
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C62241550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nFVYyGujyDn for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 15:00:35 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72DD3409EF
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72DD3409EF
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 56B272003F2;
 Tue, 15 Aug 2023 17:00:29 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35514])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Aug 2023 17:00:29 +0200
MIME-Version: 1.0
Date: Tue, 15 Aug 2023 17:00:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230814000034.35275fc0@windsurf>
References: <20230604025204.324443-1-aduskett@gmail.com>
 <20230814000034.35275fc0@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <c4cad771de9563a40a3205c2b837d6e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692111632;
 bh=WqGrGm4vC78d6Y/dq0gcoyVTcaDbJYsfFnvJhUTgdb8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aE2N4ryiPPK/wxpP4TnwofpMBkgztSzztNxWu93ktTekDJSfq3l3m5KCI47O7bH8w
 UJcJiTgvbCDngkmxAxXShpTV3YPJCVxOhUTJCBmtWg0PfOdFFBYHLql3/xuKTFzFci
 fBZb+WEcTf+iW6ZQ9Joe2CoUpC4TkIC2lhufk/XIWKWam0ENkGGxQbC8gSkb/FspPz
 kvwbtkg8P6R8sF2aK2yXOucYENu+u7AOj0bsYpKmn3o6AEptDU2HYnaktRRPTBmS2t
 rLcSK2txliJueTqTBHUFOgZf/1KotfVmOjB5Qo6BtW97HjDfgbFzBArCNCkm37s7nX
 fzba7uvie8fNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aE2N4ryi
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
Cc: buildroot@buildroot.org, Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Adam, all,

I'm adding Yegor Yefremov in CC, since he is registered as a
nftables developer.

On 14/08/2023 00:00, Thomas Petazzoni wrote:
> On Sat,  3 Jun 2023 19:52:04 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
> 
>> Firewalld provides a dynamically managed firewall with
>> support for network or firewall zones to define the trust level of 
>> network
>> connections or interfaces.
> 
> One thing that would be really nice as a follow-up patch would be a
> test case for the runtime test infrastructure. This is especially
> relevant as it is Python based, so it is easy to miss runtime
> dependencies that might be needed. I've added Julien Olivain in Cc, who
> can provide guidance on that, as he has probably written some of the
> most complex/elaborate test cases we gave in our runtime 
> infrastructure.

I'll be happy to write such a firewalld runtime test.

When trying to do it, on branch next at commit eea0c9f, I was not able
to run any of the simplest firwalld command (Python nftables module
cannot load).

With a configuration such as:

     make qemu_aarch64_virt_defconfig
     utils/config \
         -e BR2_PACKAGE_FIREWALLD \
         --set-str BR2_TARGET_ROOTFS_EXT2_SIZE 200M
     make olddefconfig
     make
     output/images/start-qemu.sh

Running simple commands, logged as root on qemu target, such as:

     firewall-offline-cmd --version
     firewalld --nofork --nopid
     python -c 'import nftables'

All fail with output such as:

     Traceback (most recent call last):
       File "<string>", line 1, in <module>
     ModuleNotFoundError: No module named 'nftables'

I quickly tried with updated version of libnftnl and nftables proposed
at [1] but did not helped.

Upstream nftables reworked Python integration in commits [2] [3] but
are not yet in a release.

So I believe the nftables package needs a rework, at least for its
python support. We should first write a runtime test for it (including
its Python support). Only then, we should be able to write a runtime
test for firewalld.

Best regards,

Julien.

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=368887
[2] 
https://git.netfilter.org/nftables/commit/?id=b3def33efecb2f7be39fc9aefc9546907202056c
[3] 
https://git.netfilter.org/nftables/commit/?id=8e603e0f7eec7c0000344a004228a30fbf0ece5c

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
