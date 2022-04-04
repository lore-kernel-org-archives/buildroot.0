Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0BEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 07:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3AB282978;
	Mon,  4 Apr 2022 07:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVnDQt0E-_UX; Mon,  4 Apr 2022 07:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD5682965;
	Mon,  4 Apr 2022 07:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C35A1BF306
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 07:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B36C82965
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 07:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gILLTc7CDTMA for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 07:19:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11CFC8294A
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 07:19:30 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id A9BE7D8C5EE6;
 Mon,  4 Apr 2022 09:19:28 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 04 Apr 2022 07:19:28 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: tms320c5x@naver.com
In-Reply-To: <mailman.1460.1649023173.219595.buildroot@buildroot.org>
References: <mailman.1460.1649023173.219595.buildroot@buildroot.org>
Message-ID: <4d616ed27f13e3460003ddbf54a0222c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] buildroot-2022.02 installation problems
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 2022-04-03 21:59, ??? <tms320c5x@naver.com> wrote:

> Hello
> I am trying to learn Linux late, but nothing is easy.
> It takes a lot of effort and time to compile individually, such as
> binutils, gcc, glibc, and kernel, etc which are required to build a
> Linux environment.
> and then have discovered buildroot and i thought that the buildroot
> could be a little easier to reach my original purpose.
> I am an engineer, so far I have developed non-linux fields such as
> avr, stm32f4...
> 
> I'm a beginner and I don't have an embedded board. First, I will
> create a virtual target using qemu on my laptop (ubuntu 20.04.3),
> and upload the kernel (linux-5.11.22, non-ubuntu) there. To do this,
> the toolchain and glibc, compiler will be created through buildroot.
> The first time I did it without knowing anything, it was successful,
> but I can't remember which option I chose.

Did you use the predefined qemu_x86_defconfig?

> Maybe when it first succeeded, i think the gdb option was not checked .
> 
> Afterwards, if I build with the gdb option selected for the target, an
> error occurs like below:
> ....
> [Makefile:9230: all-gdb] Error 2
> 
> My current purpose is to remotely debug a virtual target program
> through gdbserver installed on the target based on qemu.
> To do this, gdbserver must be installed on the target, but this does 
> not work.
> Attached is the .config file when the error occurs.

File attachments rather don't work in this environment.

Please enclose the content of your defconfig - the file that gets 
created by 'make savedefconfig'.

Kind regards,
Andreas

> I look forward to your reply.
> 
> host: ubuntu 20.04.3, arch: x86_64, x86_64-pc-linux-gnu-gcc
> target: kernel 5.11.22(boot by qemu), arch: x86_64,
> x86_64-buildroot-linux-gnu-gcc
> =>The command to run qemu will:
> qemu-system-x86_64 -kernel
> /usr/src/linux-5.11.22/arch/x86/boot/bzImage -m 4096M -smp 1 -boot c
> -hda /home/dggil/Downloads/buildroot/output/images/rootfs.ext4 -append
> "root=/dev/sda rw acpi=off" -s

<cut>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
