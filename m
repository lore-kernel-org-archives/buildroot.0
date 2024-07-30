Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC3CC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 04:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378FE4023D;
	Tue, 30 Jul 2024 04:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdgm6us70z2B; Tue, 30 Jul 2024 04:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ACD840173
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ACD840173;
	Tue, 30 Jul 2024 04:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3871BF3A3
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 04:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8471940173
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 04:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJ9Nqzxs_j7O for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 04:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9860840148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9860840148
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9860840148
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 04:06:29 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 66C71353616F; Tue, 30 Jul 2024 06:06:26 +0200 (CEST)
Date: Tue, 30 Jul 2024 06:06:26 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZqhmwpJN//DyQpmc@waldemar-brodkorb.de>
References: <20240728190115.2e9fc088@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240728190115.2e9fc088@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722312386; bh=Lp1NsYthW7Sd7m7YcaS9qpdFHDDkW4tccV1/l3Bjqhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5erJKwrmUXnGpZL3e65/TGFZO3kg/S52ru8vBhwdYLvbIay7QhnTlixK8bnWXys0
 LAFEO+GijBrf1pXXX6wkkUObP4b/LGv4hiyU3FScAB3pccCKGTRgxfIaYeOBeQMNht
 VXu6wPS+YhMMqJNZmqCIc7NSK5vWQHr+wiI9WkqsGdJAG5pxZssdMneThSxnf4ocKc
 AslAOXxsEOxBimdw1K4EnHDR/tld5Me4+dtnij44hZI0XUHk1VI/zDXePrULMc1xrV
 WxPX1I7d4dtCzpBYp6N1LL+Y5GAsOKfoSaZvggaGLkT/Qd8Zz+byAqmf80jtvw74gX
 QHqO7Bmslxcow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=E5erJKwr
Subject: Re: [Buildroot] Weird issue with uClibc RISC-V 32-bit in Qemu
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> I am working on updating the toolchains of toolchains.bootlin.com, and
> as part of that rebuilding all toolchains with Buildroot 2024.05 + a
> few patches:
> 
>   https://github.com/bootlin/buildroot-toolchains/tree/toolchains.bootlin.com-2024.05
> 
> On riscv32-ilp32d, I have the uClibc stable toolchain that generates a
> system that doesn't boot under Qemu: the kernel boots fine, but when
> switching to user-space, nothing happens:
> 
>   https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190992
> 
> The interesting thing is that the uClibc bleeding-edge toolchain works
> fine. The only difference is that GCC is 14.x instead of 13.x, and
> binutils is 2.42 instead of 2.41. Bleeding edge toolchain:
> 
>   https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190991
> 
> I took just the rootfs.ext2 of the "working" build, and put it together
> with the firmware+kernel of the "non working" build, and it works fine:
> so the problem is in the rootfs.
> 
> In the broken build, if I pass init=/bin/sh, then I'm dropped into a
> shell, but some things are weird:
> 
>  - When I run ls, the first line of output starts right after the
>    prompt, not in a newline
> 
>  - After ls has finished, it doesn't got back to the shell prompt,
>    unless I press Enter again
> 
> Using init=/bin/sh with the fully working rootfs does not exhibit this
> issue.
> 
> You can retrieve the non-working artefacts and defconfig at:
> 
>   https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190992/artifacts/browse/test/output/
> 
> And the working artefact and defconfig at:
> 
>   https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190991/artifacts/browse/test/output/
> 
> Do you have any clue at what could be happening here?
> 
> Thanks for your support!

That is indeed strange behaviour. I can reproduce the issue with the
broken artefacts. The bad news, I can't reproduce it with OpenADK
nor with a fresh compile of buildroot-toolchains (the buildroot
fork) on my laptop. I just used the riscv32 defconfig.

Is the gitlab infrastructure using anything uncommon, like maybe
ccache? 

When adding strace to the rootfs.ext2 I see in the broken image
with strace -f /bin/ash:
...
uname({sysname="Linux", nodename="(none)", ...}) = 0
statx(AT_FDCWD, "/", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|0755, stx_size=1024, ...}) = 0
statx(AT_FDCWD, ".", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|0755, stx_size=1024, ...}) = 0
ioctl(0, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
ioctl(1, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
rt_sigaction(SIGHUP, {sa_handler=SIG_DFL, sa_mask=[USR1 PIPE CHLD CONT STOP TSTP XFSZ VTALRM PROF IO RT_1], sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGINT, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=0x6860f1fc, sa_mask=[RT_1 RT_2 RT_3 RT_4 RT_5 RT_6 RT_7 RT_8 RT_9 RT_10 RT_11 RT_12 RT_13 RT_14 RT_15 RT_16 RT_17 RT_18 RT_19 RT_20 RT_21 RT_22 RT_23 RT_24 RT_25 RT_26 RT_27 RT_28 RT_29 RT_30 RT_31 RT_32], sa_flags=0}, NULL, 8) = 0
rt_sigaction(SIGQUIT, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=[RT_1 RT_2 RT_3 RT_4 RT_5 RT_6 RT_7 RT_8 RT_9 RT_10 RT_11 RT_12 RT_13 RT_14 RT_15 RT_16 RT_17 RT_18 RT_19 RT_20 RT_21 RT_22 RT_23 RT_24 RT_25 RT_26 RT_27 RT_28 RT_29 RT_30 RT_31 RT_32], sa_flags=0}, NULL, 8) = 0
rt_sigaction(SIGTERM, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTERM, {sa_handler=SIG_IGN, sa_mask=[RT_1 RT_2 RT_3 RT_4 RT_5 RT_6 RT_7 RT_8 RT_9 RT_10 RT_11 RT_12 RT_13 RT_14 RT_15 RT_16 RT_17 RT_18 RT_19 RT_20 RT_21 RT_22 RT_23 RT_24 RT_25 RT_26 RT_27 RT_28 RT_29 RT_30 RT_31 RT_32], sa_flags=0}, NULL, 8) = 0
brk(0x686a6000)                         = 0x686a6000
openat(AT_FDCWD, "/dev/tty", O_RDWR|O_LARGEFILE) = -1 ENXIO (No such device or address)
ioctl(2, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
fcntl64(2, F_DUPFD_CLOEXEC, 10)         = 10
ioctl(10, TIOCGPGRP, 0x9c371c3c)        = -1 ENOTTY (Inappropriate ioctl for device)
write(2, "/bin/ash", 8/bin/ash)                 = 8
write(2, ": ", 2: )                       = 2
write(2, "can't access tty; job control tu"..., 40can't access tty; job control turned off) = 40
write(2, "\n", 1
)                       = 1
close(10)                               = 0
brk(0x686a7000)                         = 0x686a7000
ioctl(0, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
openat(AT_FDCWD, "/.ash_history", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
ioctl(0, SNDCTL_TMR_START or TCSETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
ioctl(0, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
ioctl(0, TIOCGWINSZ, {ws_row=0, ws_col=0, ws_xpixel=0, ws_ypixel=0}) = 0
geteuid()                               = 0
rt_sigaction(SIGWINCH, {sa_handler=0x6866d618, sa_mask=[], sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(1, "~ # ", 4~ # )                     = 4
prlimit64(0, RLIMIT_NOFILE, NULL, {rlim_cur=1024, rlim_max=4*1024}) = 0
syscall_0x48(0x1, 0x9c3718b0, 0x9c371880, 0x9c371850, 0, 0) = -1 ENOSYS (Function not implemented)
read(0, 

And in my working image:
...
uname({sysname="Linux", nodename="(none)", ...}) = 0
statx(AT_FDCWD, "/", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|0755, stx_size=1024, ...}) = 0
statx(AT_FDCWD, ".", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|0755, stx_size=1024, ...}) = 0
ioctl(0, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
ioctl(1, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
rt_sigaction(SIGHUP, {sa_handler=SIG_DFL, sa_mask=[HUP], sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGINT, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=0x685ac040, sa_mask=~[RTMIN RT_1], sa_flags=0}, NULL, 8) = 0
rt_sigaction(SIGQUIT, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=~[RTMIN RT_1], sa_flags=0}, NULL, 8) = 0
rt_sigaction(SIGTERM, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTERM, {sa_handler=SIG_IGN, sa_mask=~[RTMIN RT_1], sa_flags=0}, NULL, 8) = 0
openat(AT_FDCWD, "/dev/tty", O_RDWR|O_LARGEFILE) = -1 ENXIO (No such device or address)
ioctl(2, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
fcntl64(2, F_DUPFD_CLOEXEC, 10)         = 10
ioctl(10, TIOCGPGRP, 0x9c3fdb8c)        = -1 ENOTTY (Inappropriate ioctl for device)
write(2, "/bin/ash: ", 10/bin/ash: )              = 10
write(2, "can't access tty; job control tu"..., 40can't access tty; job control turned off) = 40
write(2, "\n", 1
)                       = 1
close(10)                               = 0
ioctl(0, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
openat(AT_FDCWD, "/.ash_history", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
ioctl(0, SNDCTL_TMR_START or TCSETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
ioctl(0, TIOCGWINSZ, {ws_row=0, ws_col=0, ws_xpixel=0, ws_ypixel=0}) = 0
geteuid()                               = 0
statx(1, "", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT|AT_EMPTY_PATH, STATX_BASIC_STATS, {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=0, stx_mode=S_IFCHR|0600, stx_size=0, ...}) = 0
ioctl(1, TCGETS, {c_iflag=ICRNL|IXON, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B9600|CS8|CREAD|HUPCL|CLOCAL, c_lflag=ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
rt_sigaction(SIGWINCH, {sa_handler=0x6860d9b8, sa_mask=[], sa_flags=SA_RESTART}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(1, "~ # ", 4~ # )                     = 4
ppoll_time64([{fd=0, events=POLLIN}], 1, NULL, NULL, 0

Can you explain the difference in behaviour? Seems like some time64 issue, but why it happens on gitlab, but not on my laptop.

You can get a copy of the static strace binary for playing around from here:
https://debug.openadk.org/strace.riscv32

best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
