Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A659C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 13:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B52403D5;
	Sun, 20 Apr 2025 13:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSu-RlGTbDaq; Sun, 20 Apr 2025 13:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73F50401E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F50401E0;
	Sun, 20 Apr 2025 13:01:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D02A51C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 13:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C18AF605A3
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 13:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhibaxemBlgx for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 13:01:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FCDF60592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FCDF60592
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FCDF60592
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 13:01:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D286B19F5BA;
 Sun, 20 Apr 2025 15:01:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Apr 2025 15:01:33 +0200
Date: Sun, 20 Apr 2025 15:01:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aATwLalWft-mg11L@landeda>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <20250419171732.356b2676@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250419171732.356b2676@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745154103;
 bh=oNGk4ucIAMoNpAc/yYVLk9XtgbjNJ6Bf9Vh9j4yrr/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HT8ODMNisMpx3r7a0UPpCX2BPeJ0s9IoA3ypb8BFfIsm0djDLdIFl7X6R07X1K0so
 ZBCAQYcM+WXr5g5+nd2clETVLySUfXLqjUsV7zz9ty5ebxsOlCxFVc2eXygALTr9bD
 GWlWzV2xY75Y8FO5HpPjI2pzsQJzCKj6ZNLULnvJTkCy47eXhh0kZ5xwXiQ4Wdebxy
 9SvD3XIO2J3IcMDAGNz8r61WdYLP5L3hM+S6adc7kWpnibGcIL2iOe0F/M8RJkN/+v
 ETsgwdDuVxRMgbiJDGYhOGJ0Yo1eLImVNn7SkYrnfUM6WL7yUYPvNyAuJs+I8nP4uw
 vG/p+TsiJ4+Ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HT8ODMNi
Subject: Re: [Buildroot] [PATCH 00/29 v2] package: improve for better
 pulseview integration (branch yem/sdcc-fx2lafw)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2025-04-19 17:17 +0200, Thomas Petazzoni spake thusly:
> On Wed,  9 Apr 2025 22:03:42 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > This series aims at making the pulseview and other sigrok-related
> > packages more integrated. The series is articulated around three main
> > goals, the details of which are expanded later:
> >  1. cleanup and extend pulseview dependencies, notably the need for
> >     fonts;
> >  2. extend the boost package, for a better host variant, and better
> >     maintainability;
> >  3. introduce sdcc and fx2lafw, to allow use of Cypress FX2-based logic
> >     analyzers.
[--SNIP--]
> First topic is the some-font package and this whole idea that all font
> packages should at least install some font.

I realise I did not address that first part earler, so there it is: if a
font package is enabled, then it does not make sense that it installs no
font at all; hence, when a package is enabled, we want to ensure that it
does by default install something.

This is the same situation as we get for other packages that may
optionally install multiple things, for exmple fftw, where we ensure at
least one variant thereof is enabled (commit 7883e559991); there are
quite a few other similar packages: civetweb, gkrellm, gpsd, jack2,
libcamera, libiio, linux-tools/hv, minetest, host-qemu, xen,
zxing-cpp...

This does not require that the 'some-font' pseudo-package be introduced,
by the way (but 'some-font' does require it, of course).

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
