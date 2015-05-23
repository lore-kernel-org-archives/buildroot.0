From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 May 2015 11:59:36 +0200
Subject: [Buildroot] Possible libarchive.mk issue
In-Reply-To: <CALoSW64Xv5-_T3eqHG_kPzv1JsGQNcyPmLG_yBX56vMt9+1bsQ@mail.gmail.com>
References: <CALoSW64Xv5-_T3eqHG_kPzv1JsGQNcyPmLG_yBX56vMt9+1bsQ@mail.gmail.com>
Message-ID: <20150523095936.GA19247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nimai, All,

On 2015-05-22 18:41 -0400, Nimai Mahajan spake thusly:
> Just wanted to get this resolved before the official 2015.05 release.
> Is there any reason libarchive has LIBARCHIVE_CONF_OPTS =
> --without-lzma hard coded/defined without if/else's?

Because nobody needed it so far. ;-)

> We use libarchive
> with xz on our project and don't know how to pre patch these
> package/*.mk files before a build so was wondering if this change
> could be made now. My assumption is that this was an oversight and
> guessing it should be like this ... will push a patch if so.
> 
> ifeq ($(BR2_PACKAGE_XZ),y)
> LIBARCHIVE_DEPENDENCIES += xz
> else
> LIBARCHIVE_CONF_OPTS += --without-lzma
> endif

Yeah, looks sane. Please send a patch.

However, we're in feature-freeze for the up-coming release, only
bug-fixes are accepted, and that would be a new feature, so will not be
in the upcming release, but the next one (~3 months from now).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
