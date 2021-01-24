From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 22:38:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/nano: fix tiny build
In-Reply-To: <CAPi7W83W-1kK-SErgorJkkTPzy6DOEe+WEaJODdbjDTPbbdk2A@mail.gmail.com>
References: <20210119175326.497192-1-fontaine.fabrice@gmail.com>
 <20210119175326.497192-2-fontaine.fabrice@gmail.com>
 <20210119203049.GZ2375@scaer>
 <CAPi7W83W-1kK-SErgorJkkTPzy6DOEe+WEaJODdbjDTPbbdk2A@mail.gmail.com>
Message-ID: <20210124213823.GK2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-19 21:42 +0100, Fabrice Fontaine spake thusly:
> Le mar. 19 janv. 2021 ? 21:30, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > On 2021-01-19 18:53 +0100, Fabrice Fontaine spake thusly:
> > > Since upstream commit
> > > https://git.savannah.gnu.org/cgit/nano.git/commit/configure.ac?id=235f92ce093099cd81f14827ab842bd331132790
> > > --enable-color --enable-nanorc are needed for libmagic support in tiny
> > > builds however as --enable-color needs fork() and tiny is selected when
> > > !BR2_USE_MMU, it is easier to just disable libmagic with tiny builds
[--SNIP--]
> > Don't wee also need an explicit --disable-libmagice in this case?
> libmagic is disabled by default when tiny is enabled, here is an
> extract of configure.ac:
[--SNIP--]
> > And here, don't we need explicit --enable-color --enable-nanorc ?
> > Unless they are only needed for tiny?
> Yes, they're only needed for tiny, here is an extract of configure.ac:
[--SNIP--]

So I eventually applied this, but I did add the explicit options, rather
than relying on defaults.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
