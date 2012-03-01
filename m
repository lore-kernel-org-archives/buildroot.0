From: =?UTF-8?Q?=C3=89ric_ALBER?= <eric.alber@gmail.com>
Date: Thu, 1 Mar 2012 12:12:01 +0100
Subject: [Buildroot] uClibc missing symbols (undefined reference to
	`__fini_array_end')
In-Reply-To: <201203010030.08802.arnout@mind.be>
References: <CAGDZK6Ho6M+p4gpxHTqz8F7Jnwzo3b4KSWavh4DJ_XSb5Dp5fw@mail.gmail.com>
 <201203010027.33790.arnout@mind.be>
 <201203010030.08802.arnout@mind.be>
Message-ID: <CAGDZK6HcXVAB+ryabp7sH_-USMNRG9XJR1rw9At7D6is++uTWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot Arnout !
I didn't realize gcc was trying to link with /usr/lib/libc.a instead of
/lib/libc.so.0
I just tried by creating a symlink /usr/lib/libc.so -> /lib/libc.so.0 and
everything work now.

Again, thanks for your help :)

2012/3/1 Arnout Vandecappelle <arnout@mind.be>

> On Thursday 01 March 2012 00:27:33 Arnout Vandecappelle wrote:
> >  You do get
> > /usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.2/../../../libc.so
> > on your target, right?  It's copied in by target-finalize.
>
>  Actually, it's not...  There's your bug!  Give me a minute to prepare
> a patch.
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120301/4786e843/attachment-0001.html>
