From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Apr 2011 18:06:53 +0200
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <1301952165.27248.2.camel@segulix> (Sergio Monteiro Basto's
	message of "Mon, 04 Apr 2011 22:22:44 +0100")
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk>
	<1301952165.27248.2.camel@segulix>
Message-ID: <87pqogj49u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> writes:

 Sergio> On Mon, 2011-04-04 at 12:31 +0200, Peter Korsgaard wrote:
 >> The problem is a null pointer access in tgetent. It seems to load the
 >> terminfo file ok, but something goes wrong.

 Sergio> https://bugs.busybox.net/show_bug.cgi?id=2845

 Sergio> we shoun't build curses with --with-termlib=tinfo 

Does that have anything to do with the crash? Your bug report (which I
cannot reproduce) seems to be related to a build error rather than a
runtime one.

I've now just tested with a glibc toolchain (E.G
qemu_arm_versatile_defconfig and select external codesourcery 2010.09
toolchain) and stuff using ncurses (I tried htop) also crashes here, so
it doesn't seem to be something specific to uclibc.

I've also tested ncurses 5.9 with the same results. with 2011.05 getting
quite near, perhaps the best approach is to revert to ncurses 5.7?

-- 
Bye, Peter Korsgaard
