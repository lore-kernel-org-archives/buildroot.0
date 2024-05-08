Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D51C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 21:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8800F8174D;
	Wed,  8 May 2024 21:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igo4aHBw0tpR; Wed,  8 May 2024 21:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CDA9822B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CDA9822B7;
	Wed,  8 May 2024 21:54:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01EEE1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 21:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E099882605
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 21:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1McHLGxe0rIc for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 21:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F70F8174D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F70F8174D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F70F8174D
 for <buildroot@busybox.net>; Wed,  8 May 2024 21:54:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.127]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1s3jJH4BjQ-000JBq; Wed, 08
 May 2024 23:54:20 +0200
Date: Wed, 8 May 2024 23:54:19 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240508235419.642a8e8d@gmx.net>
In-Reply-To: <20240508214144.GA223271@pevik>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-7-ps.report@gmx.net>
 <20240508214144.GA223271@pevik>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:kabp5XWS6MYzSL70TmkNjrvzKbvcAwLvktQMXWl3Tx3JZKmN3Xh
 iwstrc0/oBDY01e2+osYZRuBSA6cqwrMnW3/rPsbuUqrh1nHqscRbpAvLXmwlr71vCRj5kO
 1SwON4RqML/tU6ZzPuEWF1yXkXyEJ3PjrKnRqkfrfV5Fg2OkY0eT6e+AmKFGYyl8O8r/mTg
 Jmiv5XmjwN2TeLXeeHkDw==
UI-OutboundReport: notjunk:1;M01:P0:sA2IdyJDTtU=;xgjSX+Yuir69UcNo1JP0Iz81ST7
 F/huytKB92FIg3jluuoTjLZsMwWoVc76cFATQZ3i4rcWBeCso6b40bPNXZLS3J06LSf6DalVk
 u7V4+k0OuBLGE7RrXh4xKvMVpL0oIxxC7vCPaI2r4J/LKfoZlb5VBsqvDt8NB+Gm+V1mDjUJv
 5g4uNQwW4eVhM2pc05JAaMh+V2SJGO0keHNYOZ5mGGRY8p8nXmrVHp1LguQyNmhT0c1FFLVeQ
 lumNI8ZEDwh/avuIm4Hy+uKP2PyHP6mMbUKNh7NhTQpo87lFnr2/5MrjP/QGEB6+Dc75y+PuM
 Kpw49uIuSxVUiBwqmxRFJV+IWKcDy1B7qs0EXYfPmOI5pn6J/Sl1a60FOl2bAx7PqTbh8JGS6
 4fXnrB9FhJKoQDNQQmdkfv6A4zhgnCZL3oJniWzCpUeMbPmyquUpilurbh4l5DmSQ1kWvOfox
 AJzFCr4TZzSQRIW7TiVmjqkFCe0NkNET2Or7nU4GBeLiHXtMO2aJqYRZSDkryaZwABPpIerQo
 ndYQpd1N9WBABc6bQ9tMNT8otbknxO3aKlLm855EFY8omhYp3G3qg89e3+PW0pkKXX1WPJVTV
 pBBWwAkXwGPjXw2k3bnbk4l0Z+GaCMDwbKR82iGM7rqHMQGwngkxfw9L+s9sjW4psz2kvfuam
 79jRB8p2ujyAjse6C6tUeAYOJ2563cAzTIHpy9BBAM085l1xSdUpdCPBpetJ71exqbM4TqWpG
 l4Bvg6+1OwCwWdsZ5+JnhSS1NUJAEaBVjlWgDzv57FHh4d99FfLfeezGKXC2eyov1RxVpjc6r
 qAQ2SuA4ZoC86MCYEwsXo963P5VCv6jfzptWYuvzKM5HY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715205260; x=1715810060; i=ps.report@gmx.net;
 bh=VJvqLssBNWZnzAQwACnbHa7XUcbJQMprSz4+9JMSNUA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UDmvMOQ0WXkGZWgu6bskh0qNKPlGdE5QoXlN97pRvDc1bwsG+LwPAAitn/KHleaU
 Mhv2pDvdLei0OlMlJTcOzxtPnvm4augIp0cstJODktrmjyl7DZD1bilkobH9kHzJL
 R372+/n4oop4bN/+6IxYrYBGyFl+5XmBwoy1/WrvtRpt0MwrEdO7pJocHUMiMssiK
 gAtG6HJgGriW2d3kkQsQzNjpO5ChOobVqfWkdf3TFwmhh5SmMJ7qDZU+pDz0d+i7G
 DfQ/PuEJMUpG181kHizA3PWnZ1tREpa0xXhyqRw9px9HJ7q+OWdiAMd/M0QPVIKJa
 tLuk8AwU94JwTRnHuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=UDmvMOQ0
Subject: Re: [Buildroot] [PATCH v1 6/8] support/kconfig: bump to
 linux-v6.9-rc5 version
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Petr,

On Wed, 8 May 2024 23:41:44 +0200, Petr Vorel <petr.vorel@gmail.com> wrote:

> Hi Peter, all,
> 
> > - update RAEDME.buildroot (add copy step for kconfig.new, update
> >   copy steps for *_shipped files
> > - rebased 01-kconfig-kernel-to-buildroot.patch
> > - rebased 06-br-build-system-integration.patch
> > - updated 10-br-build-system.patch
> > - removed 11-use-mktemp-for-lxdialog.patch
> >   (no longer applicable)
> > - rebased 12-fix-glade-file-path.patch
> > - rebased 14-support-out-of-tree-config.patch
> > - rebased 16-fix-space-to-de-select-options.patch
> > - removed 17-backport-kecho.patch (use complete Kbuild.include instead
> >   of backporting single parts)
> > - rebased 18-merge-config.sh-create-temporary-files-in-tmp.patch
> > - rebased 19-merge_config.sh-add-br2-external-support.patch
> > - removed 20-merge_config.sh-Allow-to-define-config-prefix.patch
> >   (already upstream included)
> > - removed 21-Avoid-false-positive-matches-from-comment-lines.patch
> >   (already upstream included)
> > - removed 22-kconfig-lxdialog-fix-check-with-GCC14.patch
> >   (no longer applicable)
> > - new 23-Revert-kconfig-allow-only-config-comment-and-if-insi.patch
> >   (revert to re-enable source statement inside of choice, as
> >   suggested by Yann E. MORIN, see [1])  
> 
> Even with applied patch 7th and 8th (and the others applied previously simple
> 'make defconfig' fails:
> 
> buildroot/output/build/buildroot-config/conf: Kconfig file missing
> Usage: buildroot/output/build/buildroot-config/conf [options] <kconfig-file>
> 
> Generic options:
>   -h, --help              Print this message and exit.
>   -s, --silent            Do not print log.
> 
> Mode options:
>   --listnewconfig         List new options
>   --helpnewconfig         List new options and help text
>   --oldaskconfig          Start a new configuration using a line-oriented program
>   --oldconfig             Update a configuration using a provided .config as base
>   --syncconfig            Similar to oldconfig but generates configuration in
>                           include/{generated/,config/}
>   --olddefconfig          Same as oldconfig but sets new symbols to their default value
>   --defconfig <file>      New config with default defined in <file>
>   --savedefconfig <file>  Save the minimal current configuration to <file>
>   --allnoconfig           New config where all options are answered with no
>   --allyesconfig          New config where all options are answered with yes
>   --allmodconfig          New config where all options are answered with mod
>   --alldefconfig          New config with all symbols set to default
>   --randconfig            New config with random answer to all options
>   --yes2modconfig         Change answers from yes to mod if possible
>   --mod2yesconfig         Change answers from mod to yes if possible
>   --mod2noconfig          Change answers from mod to no if possible
>   (If none of the above is given, --oldaskconfig is the default)
> make[1]: *** [Makefile:1018: defconfig] Error 1
> make: *** [Makefile:82: _all] Error 2

Known problem ;-), see cover letter

> Works for me despite 'make defconfig'...

The change is in kconfig/conf.c itself, from the old version:

	{"defconfig",       optional_argument, NULL, defconfig},

From the new version:

	{"defconfig",     required_argument, &input_mode_opt, defconfig},

Regards,
Peter

> 
> Kind regards,
> Petr

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
