From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 23:18:45 +0100
Subject: [Buildroot] [PATCH v2 4/5] lttng-modules: bump to version 2.8.3
In-Reply-To: <CAB4xu_3U3qskp+x4mqFqRRmMmLb6XDuiH5toQujR=AwevgQZQQ@mail.gmail.com>
References: <20161030195649.6415-1-eeppeliteloop@gmail.com>
 <20161030195649.6415-5-eeppeliteloop@gmail.com>
 <20161030214114.GI18077@free.fr>
 <CAB4xu_3U3qskp+x4mqFqRRmMmLb6XDuiH5toQujR=AwevgQZQQ@mail.gmail.com>
Message-ID: <20161030221845.GB12907@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-30 18:13 -0400, Philippe Proulx spake thusly:
> On Sun, Oct 30, 2016 at 5:41 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2016-10-30 15:56 -0400, Philippe Proulx spake thusly:
> >> LTTng-modules has its own Makefile to build its modules. In particular,
> >> starting from v2.8, LTTng-modules has a way to be included as part of a
> >> Linux kernel image, that is, not as loadable kernel modules. This
> >> implies that additional environment variables need to be passed to the
> >> Makefile and kernel build system.
[--SNIP--]
> > I stand by the fact that we should use the kernel-modules infra, if it
> > can be made to work with specifying just the few new variables that are
> > needed, as explained above.
> >
> > If not possible, then provide an explanation why this is not sufficient.
> 
> It's definitely possible. I changed it because upstream said that it's better to
> use their own Makefile as they can add new variables without having to
> track them in the distribution build systems. I can convert it back to using the
> the kernel-module infra if you prefer. I have no other arguments.

Well, what is different from a package that adds, removes or renames a
configure option? We downstreams have to deal with those changes every
bump we do anyway.

All we need is that upstreams provide such information in the the docs.

So, I still prefer we keep using the kernel-module infra.

Thanks for the feedback! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
