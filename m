From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:49:07 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/gupnp-dlna: add optional
 dependency for gobject-introspection
In-Reply-To: <20200406223845.1a542ed2@windsurf>
References: <20200327183000.1005676-1-aduskett@gmail.com>
 <20200327183000.1005676-7-aduskett@gmail.com>
 <20200329204251.GP22325@scaer> <20200406223845.1a542ed2@windsurf>
Message-ID: <20200406204907.GU22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Adam, All,

On 2020-04-06 22:38 +0200, Thomas Petazzoni spake thusly:
> On Sun, 29 Mar 2020 22:42:51 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > As such, we have three options:
> > 
> > 1. Forcibly bring a dependency ti host-vala and build vala bindings,
> >    like Adam did;
> > 2. Add an option to gupnp-dlna to build vala bindings;
> 
> I would prefer this solution, but there may not even be a need to add
> an option: there is an AC_PATH_PROG check for vapigen, so probably we
> can feed some stupid autoconf cache variable to make sure vapigen is
> not detected, even if available.

GUPNP_PROG_VAPIGEN uses AC_PATH_PROG under the hood, and we can override
the detection by setting VAPIGEN="something". Not sure what happens if
we pass it an empty string, or 'no'...

Adam, care to look into this, please? Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
