From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jul 2014 22:26:35 +0200
Subject: [Buildroot] [PATCH 1 of 2] generic packages: rename
 FOO_MAKE_OPTS into FOO_MAKE_OPT
In-Reply-To: <b37fc9fb-54e1-42b1-b386-4e6e0ce99b5a@email.android.com>
References: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
 <b37fc9fb-54e1-42b1-b386-4e6e0ce99b5a@email.android.com>
Message-ID: <20140722202635.GB3667@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-22 21:55 +0200, Thomas De Schampheleire spake thusly:
> Thomas De Schampheleire <patrickdepinguin@gmail.com> schreef:
> >The autotools infrastructure allows packages to specify FOO_MAKE_OPT and
> >FOO_MAKE_ENV. The generic infrastructure does not use this variable, but
> >some individual packages define them for use in their own BAR_CMDS.
> >
> >However, some of these packages call this define FOO_MAKE_OPTS, rather than
> >FOO_MAKE_OPT. This is currently not a real problem, but it is inconsistent.
> >Moreover, the upcoming kconfig-package infrastructure will also use
> >FOO_MAKE_OPT, so generic packages that also use kconfig-package have no
> >choice but use the singular name.
> 
> This last reason isn't really valid as the kconfig infra could choose to
> use OPTS iso OPT.
> 
> Note that I personally find OPTS more logical, but I do think we should
> be consistent between autotools and generic.

Agreed.

> We could also go in the other direction and change pkg-autotools and the
> depending packages to use OPTS. What do you think of that?

NAK, because of br2-external. If we were to s/OPT/OPTS/ then all
existing br2-external packages would be broken.

We could somewhat limit this brokenness by accepting the legacy OPT,
and warn the user that his packages are using the old variable. Since
we would not be using the OPT variable for anything else, that would
be somewhat workable, but we'd have an ugly kludge in our code.

But I find it a gratuituous change.

OK, we fsked up the API to begin with. Let's accept it, and move on! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
