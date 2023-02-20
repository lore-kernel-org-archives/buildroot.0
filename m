Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D3C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 912608228B;
	Mon, 20 Feb 2023 20:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 912608228B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeJ_KxpjtHK4; Mon, 20 Feb 2023 20:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 981C281F96;
	Mon, 20 Feb 2023 20:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 981C281F96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BC5A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3270F400D1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3270F400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eslol4iMNNXk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:40:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E15D5400AF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E15D5400AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:40:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D1D6240002;
 Mon, 20 Feb 2023 20:40:02 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:39:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220213959.799dfa91@windsurf>
In-Reply-To: <20230220100309.116832-1-fontaine.fabrice@gmail.com>
References: <20230220100309.116832-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676925603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gT3HUtfCsbjBuHlBHDxv8jKvxd1V6RLdc3Y182VvCM=;
 b=ibNMjDUZVGna/bt1U2HkEeDj0xP29wE1bP11MR9y52xk2rtV/52gjQWv8NEQnJygJGsD8q
 jRoSNBK1bSgNrgU5Gf/gC2eprh1WxgZY7vQnMBpdKsdnn87moi1UFxgAAmhhQtX0Q0Repw
 g8CiP2ZtEO2EFb9aH1lvKzlLN2oTT5VBdRyVSYQQwZ331RR4GV63WcueL+1UkijWSM98AD
 K+kcZ4DgLv5iEtvVqRzKtB6M6n9Lto+6ZeTDvDGKI3c4SjmT6w3SAOsLn7RQFXeV8e+pel
 xaVb4Jo/VeYu6VcZw0YZQMJKIlLYTO0W19X87utPs3Q0G98znA8T36zX874QEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ibNMjDUZ
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require FileHandle perl package for syslinux
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 11:03:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> syslinux needs FileHandle module:
> 
> Can't locate FileHandle.pm in @INC (you may need to install the FileHandle module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/makeerrlist.pl line 8.
> BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/makeerrlist.pl line 8.
> /home/buildroot/autobuild/instance-0/output-1/host/bin/i586-buildroot-linux-gnu-gcc -Wp,-MT,errlist.o,-MD,./.errlist.o.d -Os -march=i386 -falign-functions=0 -falign-jumps=0 -falign-labels=0 -ffast-math -fomit-frame-pointer -std=gnu99 -m32 -mpreferred-stack-boundary=2 -fno-stack-protector -fwrapv -freg-struct-return -fPIC -fno-exceptions -fno-asynchronous-unwind-tables -fno-strict-aliasing -falign-functions=0 -falign-jumps=0 -falign-labels=0 -falign-loops=0 -g -D__COM32__ -D__FIRMWARE_BIOS__ -nostdinc -iwithprefix include -I. -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/sys -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/../include -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/include/sys -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/core/include -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/ -I/home/buildroot/autobuild/instance-0/output-1/
 bu
>  ild/syslinux-6.03/com32/lib/sys/module -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/bios/com32/lib//../.. -W -Wall -Wstrict-prototypes  -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Winline -DDYNAMIC_CRC_TABLE -DPNG_NO_CONSOLE_IO -DPNG_NO_WRITE_SUPPORTED -DPNG_NO_MNG_FEATURES -DPNG_NO_READ_tIME -DPNG_NO_WRITE_tIME -mregparm=3 -DREGPARM=3 -c -o errlist.o errlist.c
> cc1: fatal error: errlist.c: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/de88089888b2ca354b28af3550abf846560da7d5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  support/dependencies/dependencies.sh | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
