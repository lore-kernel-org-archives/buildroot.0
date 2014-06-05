From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Jun 2014 20:57:46 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZURFSJhZ5+1PGYTyLwtCRkaYOWU_nNbkti6SDjdJ1-LuDQ@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605173431.GB3553@free.fr>
 <CAE9DZURFSJhZ5+1PGYTyLwtCRkaYOWU_nNbkti6SDjdJ1-LuDQ@mail.gmail.com>
Message-ID: <20140605185746.GC3553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dallas, All,

On 2014-06-05 12:39 -0500, Dallas Clement spake thusly:
> Maybe there is hope if the
> autotools people can figure out a way to provide a unique namespace for
> each package and variables.

That's not really the responsibility of the autotools folks.

Say I write a pacakge that uses ac_cv_has_gstreamer which for my pckage
means "gst-inspect is present".

Now you have no knowledge of my package, and you write your own package
that uses ac_cv_has_gstreamer which would mean "libgstreamer.so.0 is
present and usable".

There is no reconciliation possible betwen your package and mine. That's
not the fault of the autotools. Maybe we could say that it's the fault
of gstreamer to not provide the adequate macros, but even if that was
the case, that would not prevent two packages to use the same variable
to represent two different things (think optinal behaviour depending on
the environment for a package, while another would use it to represent
a user-selectable --enable/disable option).

There's no way out of this mess...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
