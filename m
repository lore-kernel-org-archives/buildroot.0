Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DEAC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EE134016B;
	Sat, 17 Sep 2022 21:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EE134016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7fOvzeSAuQB; Sat, 17 Sep 2022 21:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E75E40119;
	Sat, 17 Sep 2022 21:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E75E40119
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F19211BF3CE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA87540119
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA87540119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id riCU0sPUZwHB for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 21:19:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFF13400E4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFF13400E4
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 21:19:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2a18:6673:cb9f:3864])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C018713F84C;
 Sat, 17 Sep 2022 23:19:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 Sep 2022 23:19:14 +0200
Date: Sat, 17 Sep 2022 23:19:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220917211914.GB1127102@scaer>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <212daefb880a3c5e49ff4aa8278cc4c3bc67360e.1660931225.git.yann.morin.1998@free.fr>
 <d707dd32-af74-0d63-c890-7d81e29ca454@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d707dd32-af74-0d63-c890-7d81e29ca454@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663449558;
 bh=B1l5AY/QrEsl3g77wKUUuOJAIiJT5s2O9piEX7Dx8DQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vCw7F1t54MqGFjXZyGYFWcR3A8Z2JBUCzU1HbFeBWnBjIGuw+tXWG7ITr+HKUJXOm
 AaziYxsS/AACF494o7NOk7NGSN4QTLYBVKmdOCl2tedvCVyJdllZ70nDIILS7MQVW2
 ZHkKNGv1DB0XW1Axs9RHZzjdGg0B9fvapt4x+Ft5eNmq+WlV4kVucW0cn8YgHLYXiy
 kLeZZdOePzMvuYB2I/25Ct0xUb4PdtOCF0j3DCmp8xLZmq7uTOECxoEqttO/pKVH8O
 o/QH4GgCnQvZZyPF5i1R+zZaglkvqmTlyO4tB43D+6ksnw8O5Fb9WpSyWrlRySvHa5
 Es8ck9tmgbHWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vCw7F1t5
Subject: Re: [Buildroot] [PATCH 2/4] package/dracut: allow users to provide
 their own modules
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
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-17 22:17 +0200, Arnout Vandecappelle spake thusly:
> On 19/08/2022 19:50, Yann E. MORIN wrote:
> >Dracut modules can only be looked for in HOST_DIR/lib/dracut/modules.d/
> >and dracut does not offer the possibility to look elsewhere.
> >
> >Installing files in HOST_DIR/ can do done either from a host-package, or
> >via a post-built script; there is no overlay like there is for target/.
> >This is a bit cumbersome.
> >
> >Add an option to the host-dracut package, so users can point to a list
> >of modules to install.
[--SNIP--]
>  Although I agree that conceptually this extra modules thing belongs with
> the dracut package itself, from a user, practical point of view, you
> actually want it in the dracut option of fs/cpio. If you use host-dracut
> without the cpio-dracut fs, it means you are using it in a post-build
> script, so it's not so weird to also install the extra modules in that
> script. On the other hand, if you are using cpio-dracut and you need extra
> modules (which is quite likely), then it extremely annoying that you have to
> go first to filesystems->cpio and later to hosttools->dracut...
> 
>  In other words, I think this should be moved to cpio.

I beg to differ (of course!). ;-)

Extra modules change the features of dracut; they change what dracut can
do. They are not like config files, which actually describe what the
filesystem is to be assemble from.

Besides copying extra modules as done in this patch, a user could also
patch dracut to add those modules. So, semantically, extra modules from
a patch or a local directory are the same.

When adding new modules, you will indeed have to add config files that
reference them (or one of your config files already references one and
you missed it). Probably, indeed, the modules will be developped in a
more-or-less closed loop with the config files that use them; but that's
incidental.

If they were part of the cpio filesystem, they'd be copied on every
invocation, though, which is conceptually not very nice either (but
probably very low overhead).

Finally, even if using from a post-build script, it is still nicer to
expose that option in the menuconfig, rather than require the user to do
the copy in their script.

So, local modules should really belong to the dracut package, not the
cpio filesystem.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >+
> >+endif
> >diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
> >index 2b6a144aac..96fa7db6ba 100644
> >--- a/package/dracut/dracut.mk
> >+++ b/package/dracut/dracut.mk
> >@@ -19,6 +19,15 @@ define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> >  endef
> >  HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> >+HOST_DRACUT_EXTRA_MODULES = $(call qstrip,$(BR2_PACKAGE_HOST_DRACUT_EXTRA_MODULES))
> >+define HOST_DRACUT_INSTALL_EXTRA_MODULES
> >+	$(Q)mkdir -p $(HOST_DIR)/lib/dracut/modules.d/
> >+	$(foreach m,$(HOST_DRACUT_EXTRA_MODULES), \
> >+		cp -a $(m)/* $(HOST_DIR)/lib/dracut/modules.d/
> >+	)
> >+endef
> >+HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_INSTALL_EXTRA_MODULES
> >+
> >  # When using uClibc or musl, there must be "ld-uClibc.so.1" or
> >  # "ld-musl-x.so" symlinks, respectively - else the init process cannot
> >  # start

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
