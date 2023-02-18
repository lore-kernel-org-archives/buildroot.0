Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143A6C636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 13:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EBDA82031;
	Sat, 18 Feb 2023 13:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EBDA82031
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzUiDW3SruHF; Sat, 18 Feb 2023 13:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC9A182018;
	Sat, 18 Feb 2023 13:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC9A182018
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 159351BF59F
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 13:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D767241911
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 13:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D767241911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D25Cpn2aNAkm for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 13:24:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35A20418C9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35A20418C9
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 13:24:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6DA081BF208;
 Sat, 18 Feb 2023 13:24:36 +0000 (UTC)
Date: Sat, 18 Feb 2023 14:24:35 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230218142435.06cb9c26@windsurf>
In-Reply-To: <96015d0268df72d3cdd58e7db09c1333@free.fr>
References: <20230218101426.630874-1-bagasdotme@gmail.com>
 <20230218113939.526f0a76@windsurf>
 <96015d0268df72d3cdd58e7db09c1333@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676726678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyYYHhr9b5n7EyirEvCFaKyWTIjJ2bM+1Vr4bjsZsTY=;
 b=TrMa3Ie1M1sZl1xFASC+ANa3cmd/VVOrRjf+LLlp9XmT0cE/VPHzJz5lkFB29NtPKPyyAh
 zRtkA38UoXgJYyqeg4PWmjnYhWAF51WDjfarCopbopJMJQ365D/JpwRs2xeTz58hJ8pudT
 eJGvZ5QBDOG3vczXM0hiVMfnKs29T1Z6AV4Nhr0ns/Op9t38MKbJ1mAI4g37Oy6yRC1rMn
 GbvGxtUqxlUIoDy5BOhE5y9NRCfy53EaTEzfoOe+OWGO1S/IY1kjnnUc+UlSKxXk7RSy5G
 3I4/qk3UZ2oDY8fPV6C6izDKQc5mpv213XHKxvDCYK5S7KzYHA2IrUVNhWo86A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TrMa3Ie1
Subject: Re: [Buildroot] [PATCH] Revert "package/gnupg2: bump to version
 2.4.0"
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Sat, 18 Feb 2023 12:13:16 +0100
Julien Olivain <ju.o@free.fr> wrote:

> I indeed started to receive some autobuild failures.
> Unfortunately, I cannot reproduce on my system for now:
> on my side, the build complete successfully.
> 
> I tried with _and_ without having a /usr/bin/gpgrt-config on host,
> which I was suspecting to bring some host config.
> 
> In my first proposal of gnupg2 version 2.4.0 bump [1], I initially 
> proposed
> to add Buildroot staging bin dir in PATH, to make sure we won't have 
> such
> host/br-staging confusion:
> 
> GNUPG2_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)

This is a really bad idea, and can potentially break. Indeed,
STAGING_DIR/usr/bin contains lots of programs that are compiled for the
target. So if you do that, the build process on your build machine
might try to invoke executables that are compiled for the target.

If the issue comes from a <foo>-config script, then generally, two
things are needed:

 - Make sure the <foo>-config script returns correct values for
   cross-compilation. If not, use <pkg>_CONFIG_SCRIPTS in the package
   installing this <foo>-config script

 - Make sure the package calling the <foo>-config script calls the
   right one. Most autotools-based projects provide some sort of cache
   variable that allows to tell the configure script that <foo>-config
   in $(STAGING_DIR)/usr/bin/<foo>-config should be used

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
