From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Tue, 15 Oct 2013 07:09:51 -0300
Subject: [Buildroot] Ncurses wide support
Message-ID: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently Buildroot support building the non-wide (non-unicode) ncurses library.

While ncurses support an easy way to enable wide support with a configure option
(--enable-widec), this option builds *only* the wide-enabled library
(aka libncursesw)
and not the vanilla one.

In other words, it's not possible to build both at the same time.

By looking at my Gentoo ebuild -which is also source based- it seems
they solve this by
simply building ncurses twice: first the vanilla, and then (if unicode
is enabled) the
wide-enabled one.

Questions that arise:

1. Does Buildroot support something like this?

2. Should we patch ncurses configure to change this behavior?
(not really a fun solution, given this is an upstream choice)

3. Do we even care?
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
