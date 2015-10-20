From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Oct 2015 20:54:09 +0200
Subject: [Buildroot] What is the preferred way install additional cmake
 modules?
In-Reply-To: <56267135.7050303@gmail.com>
References: <56267135.7050303@gmail.com>
Message-ID: <20151020185409.GD3738@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan, All,

On 2015-10-20 18:52 +0200, Zoltan Gyarmati spake thusly:
> i am about to add the modemmanager-qt[1] package to Buildroot, which
> for building depends on a set of additional cmake modules also
> provided by the KDE project, called extra-cmake-modules[2], which
> itself also uses cmake for building and installing.
[--SNIP--]
>  My instinct would say that extra-cmake-modules is supposed to be a
> host package

My instinct says so, too. ;-)

> (as then i wouldn't need to explicitly set
> EXTRA_CMAKE_MODULES_INSTALL_TARGET to NO), so i tried this to define
> as a host-cmake-package, make modemmanager-qt depending on
> host-extra-cmake-modules, but then the cmake modules not found by the
> modemmanager-qt build config.

So:
  - if extra-cmake-modules are in staging/ then it works
  - if extra-cmake-modules are in host/ then it does not work

But what is not found? The ECM files themselves? Can you paste the few
lines that exhibit the error, please?

> In this latter case the .cmake files gets installed under:
> path-to-buildroot/output/host/usr/share/ECM/cmake/

I would have indeed expected to see them installed there.

> What is the preferred way to install this package? Install it as a
> host-package, and specify a custom install target dir, or leave it as
> plain cmake-package?

My stance:
  - it is a host-package

We need to understand why cmake can't find those modules.

I CCed Samuel, our cmake expert, so he can shine some light on this.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
