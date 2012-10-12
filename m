From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri, 12 Oct 2012 16:14:46 +0400
Subject: [Buildroot] [PATCH] strace: Version bump to 4.7
In-Reply-To: <CAG2jQ8ja49TsB3eDjQX04v0fvpj+9jVaA8_9C7tWDNtqvRq7pg@mail.gmail.com>
References: <1348821796-28798-1-git-send-email-markos.chandras@gmail.com>
 <87a9w20xrj.fsf@macbook.be.48ers.dk>
 <87boghzdjc.fsf@macbook.be.48ers.dk>
 <CAG2jQ8i1KwuFQKkpW=5=M=tx5QB0SPKowpxbejPVPUrnaSG5AQ@mail.gmail.com>
 <CAG2jQ8jMZ=PQEd=YJipP1cH=6-CyHD01YWsMYxZs67Rb5Wd2PQ@mail.gmail.com>
 <87ipapxbp2.fsf@macbook.be.48ers.dk> <506F6AC9.3010702@mind.be>
 <CAG2jQ8hPXUt7sR5p3Tq1enqO3uYNXEX+N6=yUynLWZHhDnp=2Q@mail.gmail.com>
 <50773988.6070904@mind.be>
 <CAG2jQ8ja49TsB3eDjQX04v0fvpj+9jVaA8_9C7tWDNtqvRq7pg@mail.gmail.com>
Message-ID: <CABtOAfxaj5MC5TL4umy-pUQDD19gGaa2zY3A5Rsr1gSrynOg5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/12 Markos Chandras <markos.chandras@gmail.com>

> On Thu, Oct 11, 2012 at 10:26 PM, Arnout Vandecappelle <arnout@mind.be>
> wrote:
> > On 10/10/12 14:49, Markos Chandras wrote:
> >>
> >> On Sat, Oct 6, 2012 at 12:18 AM, Arnout Vandecappelle<arnout@mind.be>
> >> wrote:
> >>>
> >>>   Not sure if it is related, but the previous version was already
> broken
> >>> for me
> >>>
> >>> on x86_64 builds. Hm, probably not related, because it failed with:
> >>>
> >>> file.c: In function 'printstat64':
> >>> file.c:1073:16: error: storage size of 'statbuf' isn't known
> >>> file.c:1073:16: warning: unused variable 'statbuf' [-Wunused-variable]
> >>>
> >
> >> I reported this problem upstream about an hour ago (with a proposed
> >> patch included)
> >>
> >> http://sourceforge.net/mailarchive/message.php?msg_id=29947462
> >
> >
> >  Is this only on x86_64 or also on other 64-bit platforms?
> >
> >
> I haven't tested it with other 64-bit platforms but I think the rest
> of them provide a struct stat64. But even with this patch, it does not
> go much further as it fails to build again due to undefined syscalls
> like Peter posted before
>
>
> http://autobuild.buildroot.net/results/db48ce61cdb53669958b8b301fd24d7ecc33b236/build-end.log
>
> Another way to workaround the stat64 problem on x86_64 is to
> ac_cv_have_long_long_off_t=yes on strace.mk when
> BR2_LARGEFILE is enabled.
>
> --
> Regards,
> Markos
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


Hi!

i'm trying to buiid strace

See here http://pastie.org/5043151




syscall.o:(.rodata+0x128): undefined reference to `sys_oldstat'
syscall.o:(.rodata+0x1c8): undefined reference to `sys_oldfstat'
syscall.o:(.rodata+0x548): undefined reference to `sys_oldlstat'
syscall.o:(.rodata+0x5a8): undefined reference to `sys_old_mmap'
syscall.o:(.rodata+0xc18): undefined reference to `sys_truncate64'
syscall.o:(.rodata+0xc28): undefined reference to `sys_ftruncate64'
syscall.o:(.rodata+0xc38): undefined reference to `sys_stat64'
syscall.o:(.rodata+0xc48): undefined reference to `sys_lstat64'
syscall.o:(.rodata+0xc58): undefined reference to `sys_fstat64'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121012/a0210c29/attachment.html>
