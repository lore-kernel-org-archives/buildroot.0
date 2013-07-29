From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jul 2013 00:22:21 +0200
Subject: [Buildroot] [PATCH v2] package/libedit: switch to alternate URL
 for proper packaging
In-Reply-To: <CAAXf6LVQ7FS+wUoNutsXMk1Jeh_hgg0gC+c5ywKx_Lf44qs=Pg@mail.gmail.com>
References: <1375116257-27967-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LVQ7FS+wUoNutsXMk1Jeh_hgg0gC+c5ywKx_Lf44qs=Pg@mail.gmail.com>
Message-ID: <20130729222221.GB3420@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-29 21:14 +0200, Thomas De Schampheleire spake thusly:
> On Mon, Jul 29, 2013 at 6:44 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> > +# Note: libbsd required for *vis functions, but works only with a toolchain
> > +# with __progname; otherwise, some features are disabled, as if libbsd was
> > +# missing entirely.
> > +ifeq ($(BR2_PACKAGE_LIBBSD),y)
> > +LIBEDIT_DEPENDENCIES   += libbsd
> > +endif
> 
> What does libbsd really provide us? What are these vis functions?

libbsd provides functions commonly found on *BSD systems, but not
commnly available on non *BSD systems such as Linux. See its homepage:
    http://libbsd.freedesktop.org/

The *vis familly of functions provide a mean to "visually encode
characters" (from the man page). From what I see, it is a way to encode
(wide? unicode?) characters into a set of printable chars from the ASCII
set. Ie. all that is not in [[:print:]] is encoded. The encoding is
reversible.

libbsd+libedit are part of the stack I've been building up for more than
a year now, to build a complete qemu+libvirt based "VM server" (I have
to refresh the patchset (yet once more) before resubmitting to the list).
I would really like these two libs to stay in for this reason.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
