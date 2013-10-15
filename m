From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Oct 2013 07:18:59 -0300
Subject: [Buildroot] Ncurses wide support
In-Reply-To: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>
References: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>
Message-ID: <525D1693.3010509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/15/2013 07:09 AM, Ezequiel Garc?a wrote:

> Currently Buildroot support building the non-wide (non-unicode) ncurses library.
> 
> While ncurses support an easy way to enable wide support with a configure option
> (--enable-widec), this option builds *only* the wide-enabled library
> (aka libncursesw)
> and not the vanilla one.
> 
> In other words, it's not possible to build both at the same time.
> 
> By looking at my Gentoo ebuild -which is also source based- it seems
> they solve this by
> simply building ncurses twice: first the vanilla, and then (if unicode
> is enabled) the
> wide-enabled one.
> 
> Questions that arise:
> 
> 1. Does Buildroot support something like this?

Hi.
There are tricks that could work, for instance by tweaking build and
install cmds you could build and stash the widec version in some new
directory inside the build one, then build the narrow version and
install both - being in another new directory makes it "make clean" safe.

> 2. Should we patch ncurses configure to change this behavior?
> (not really a fun solution, given this is an upstream choice)

Ehh no, probably not.

> 3. Do we even care?

It could be useful for people who want to edit multilanguage stuff in
the target nicely.
Personally i just copy the stuff over from my laptop, there's no
replacement for full vim syntax and rules :)
Regards.
