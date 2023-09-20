Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ED3C04FF1
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 19:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F07400C8;
	Wed, 20 Sep 2023 19:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F07400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YiEZxHsir1wW; Wed, 20 Sep 2023 19:35:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABF7D400D2;
	Wed, 20 Sep 2023 19:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF7D400D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76FA61BF2AF
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 19:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4296061350
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 19:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4296061350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wO2jicdKyQX1 for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 19:35:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD4856134C
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 19:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD4856134C
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1D4B1BF20B;
 Wed, 20 Sep 2023 19:35:09 +0000 (UTC)
Date: Wed, 20 Sep 2023 21:35:09 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920213509.227e15bf@windsurf>
In-Reply-To: <20230919061556.4252-1-fontaine.fabrice@gmail.com>
References: <20230919061556.4252-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695238510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unVFQVpZjRF4a7f4ZoL9zPhq9fVZ57liwCBcafgimkk=;
 b=WY6coWh7W+RBxoO8jG6e3+JZFvvdF48RfYlJid7e8gzbzm9vDqNM8dKolJ6ZH3fMuFQ5m4
 C2A+sgr4Auonxyoszt2X1pwCfmvANle0tRvpkX+NC+g0Mue79R5Rajo836QWkcRDmvUhtZ
 c6AbhJ4RR5zb2+lgMHf35esJHP0hb74lzdwfssEYRlpxqxdxksTy+4FV4aft6qD/gGjLjS
 8HeeE3nr7xdJzm9nxcBMJACWJVKx53mm1Uv9EOYaGClHLe3LvvKgHJjcEgJCzsf9NEk5uZ
 aKmv1NMDs7w7zfE48OL9E6guLBpdwc/4/8ikcMATEPofufKPn0hhX/7DtYZ5iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WY6coWh7
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/binutils: fix install of libsframe
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Sep 2023 08:15:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with oprofile raised since bump of
> binutils to version 2.40 in commit
> 35656482d3b74ab12a6c2395ac9ca61b60a2fd49:
> 
> configure: error: bfd library not found
> 
> [...]
> 
> configure:17928: checking for bfd_openr in -lbfd
> configure:17953: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lbfd  -liberty -lpopt  -ldl -lintl >&5
> /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/12.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: warning: libsframe.so.0, needed by /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.so, not found (try using -rpath or -rpath-link)
> 
> Indeed, in this case, libsframe is not installed even after applying
> commit 1b4d921e1da614a72fed2a79d5c4f8e0b6d1cd45 because
> BR2_BINUTILS_VERSION_2_40_X is not selected by anyone (binutils package
> is selected by oprofile and the toolchain is not generated by buildroot)
> 
> To fix this issue, invert the logic: install libsframe by default (i.e.
> when binutils is selected or with a buildroot toolchain). libsframe will
> not be installed only if binutils < 2.40 is detected.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/af9a2d52823a332b48e6df14d2708b6a4b3833a4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Baruch Siach):
>  - Fix title typo

I think I would have preferred to keep positive logic and do it like
this:

config BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
	bool
	default y if !BR2_BINUTILS_VERSION_2_39_X && !BR2_BINUTILS_VERSION_ARC

but OK, those "old" binutils versions are soon going to go away, so
this BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME is not going to be there
forever. So I've applied your patch. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
