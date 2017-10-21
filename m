From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Oct 2017 18:26:53 +0200
Subject: [Buildroot] Implicit declaration of mblen
In-Reply-To: <1508584234482-0.post@n4.nabble.com> (Kees van Unen's message of
 "Sat, 21 Oct 2017 04:10:34 -0700 (MST)")
References: <1508584234482-0.post@n4.nabble.com>
Message-ID: <87bml0cvqq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kees" == Kees van Unen <Keesvanunen@hotmail.com> writes:

 > Hi,
 > I am using buildroot-2017.08 and I want to use X.org. When compiling
 > xlib_libX11-1.6.5 there is an error in imCallbk.c: implicit declaration of
 > function mblen. By adding a -I reference to CFLAGS in the relevant Makefile
 > to stdlib.h this source compiles. This happens for a number of X11 sources.
 > Does anybody knows how this can be solved with Buildroot?

 > The mblen bug also appears later on in the process when it tries to use
 > xlib_libx.so.

The cross compiler should find stdlib.h without any special -I
flags. Can you post your defconfig file (run make savedefconfig to
generate it) and the exact error message you are seeing?

-- 
Bye, Peter Korsgaard
