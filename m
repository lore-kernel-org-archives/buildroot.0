From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Wed, 20 Apr 2011 18:55:02 +0100
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <87pqogj49u.fsf@macbook.be.48ers.dk>
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk> <1301952165.27248.2.camel@segulix>
	<87pqogj49u.fsf@macbook.be.48ers.dk>
Message-ID: <1303322103.8512.4.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-04-20 at 18:06 +0200, Peter Korsgaard wrote: 
> >>>>> "Sergio" == Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> writes:
> 
>  Sergio> On Mon, 2011-04-04 at 12:31 +0200, Peter Korsgaard wrote:
>  >> The problem is a null pointer access in tgetent. It seems to load the
>  >> terminfo file ok, but something goes wrong.
> 
>  Sergio> https://bugs.busybox.net/show_bug.cgi?id=2845
> 
>  Sergio> we shoun't build curses with --with-termlib=tinfo 
> 
> Does that have anything to do with the crash? Your bug report (which I
> cannot reproduce) seems to be related to a build error rather than a
> runtime one.

https://bugs.busybox.net/show_bug.cgi?id=2845#c7

After you fix the build error, I wrote that we should built ncurses with
configure option  --with-termlib=tinfo , which Fedora use by default .
And you wrote to make a "patch adding optional tinfo build" , I done one
draft of the patch.

Since this bug in runtime, seems to be with terminfo, build with option
--with-termlib=tinfo , doesn't solve the problem ? 

> I've now just tested with a glibc toolchain (E.G
> qemu_arm_versatile_defconfig and select external codesourcery 2010.09
> toolchain) and stuff using ncurses (I tried htop) also crashes here, so
> it doesn't seem to be something specific to uclibc.
> 
> I've also tested ncurses 5.9 with the same results. with 2011.05 getting
> quite near, perhaps the best approach is to revert to ncurses 5.7?
> 

-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110420/301f26a2/attachment.bin>
