From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jul 2016 20:07:43 +0200
Subject: [Buildroot] help please
In-Reply-To: <CAAfO8NwwwFGA-gCeFnOYs0HAbDAAnKs6nHnWusA-LzWpTWQ8ag@mail.gmail.com>
References: <CAAfO8NyXP5-PFMoC3bN7v8NRD+jzcvgtBfgZZXKijGquARhU8Q@mail.gmail.com>
 <20160712204436.GE3680@free.fr>
 <CAAfO8NykMv=DCdn=rV6tCFOfRvZQf84V82ZrKgtJW-422F9nfQ@mail.gmail.com>
 <20160713182135.GA3687@free.fr>
 <CAAfO8NwwwFGA-gCeFnOYs0HAbDAAnKs6nHnWusA-LzWpTWQ8ag@mail.gmail.com>
Message-ID: <20160714180743.GC3737@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

[Please, keep the list in Cc: when you reply]

On 2016-07-14 02:11 -0400, Mike King spake thusly:
> Buildroot can now build and install the package minus the drivers of
> course.  Thanks again!

So, I've done some work to build the kernel modules, too. It works now,
but it was far from being easy.

linux-gpib uses such a weird, deviously-twisted buildsystem, that
building the kernel modules, especially in cross-compilation, is not
trivial:

  - they forget to pass correct include paths;

  - they override standard kernel headers because they want to provide
    legacy handling (but even fail at that).

I've done a few patches to fix that (and the rest of the install
procedure, btw) so that linux-gpib now should work, except for the
language bindings, that are yet another challenge to address... :-/

You'll find my branch updated there:

    https://github.com/yann-morin-1998/buildroot/commits/yem/linux-gpib

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
