From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jul 2014 00:23:09 +0200
Subject: [Buildroot] Migrating libconfuse package from .tar.gz to github
In-Reply-To: <53C6F7F6.40702@mind.be>
References: <CAM+bi4vVkn-TivZymaXuKswCLfFewXnAd1L-c-O9o=h7L3VXqg@mail.gmail.com>
 <53C6F7F6.40702@mind.be>
Message-ID: <20140716222309.GJ9252@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Alvaro, All,

On 2014-07-17 00:08 +0200, Arnout Vandecappelle spake thusly:
> On 10/07/14 09:55, Alvaro Gamez wrote:
> > libconfuse is being migrated to github (see http://www.nongnu.org/confuse/)
> > 
> > I'm trying to migrate buildroot's package definition too, but I'm
> > facing a problem I don't know how to resolve.
[--SNIP--]
>  That comes from gettext, so it means you need Yann's gettextize patches.
> 
>  Unfortunately, it still doesn't work, but for a different reason:
> 
> configure.ac:49: error: `po/Makefile.in' is already registered with AC_CONFIG_FILES.
> ../../lib/autoconf/status.m4:288: AC_CONFIG_FILES is expanded from...
> configure.ac:49: the top level
> 
>  po/Makefile.in is mentioned twice in configure.ac, because gettextize adds it
> as well. Yann, any ideas how to solve this? The easiest solution is probably
> patch libconfuse.

Indeed. I removed po/Makefile.in from configure.ac, and now gettextizing +
autoreconf + configure + build all work.

I'll send an updated patch in a moment...

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
