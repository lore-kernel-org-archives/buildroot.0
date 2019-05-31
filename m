From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 31 May 2019 22:43:27 +0200
Subject: [Buildroot] [PATCH v4] package/dosfstools: introduce custom
 install routine
In-Reply-To: <CAGt4E5v_jOJrTdPTRbkyuQEEDGA6AyFfZN4jH+g=a_=eK8PSfQ@mail.gmail.com>
References: <20190531194159.2566-1-mmayer@broadcom.com>
 <20190531200625.GB3407@scaer>
 <CAGt4E5v_jOJrTdPTRbkyuQEEDGA6AyFfZN4jH+g=a_=eK8PSfQ@mail.gmail.com>
Message-ID: <20190531204327.GC3407@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2019-05-31 13:35 -0700, Markus Mayer spake thusly:
> On Fri, 31 May 2019 at 13:06, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2019-05-31 12:41 -0700, Markus Mayer spake thusly:
> > > We can't use dosfstools' install target, because it'll install *all*
> > > binaries, even the disabled ones. Also, we can't just delete dosfstools
> > > binaries from the target directory after installing them, because other
> > > packages (specifically Busybox) may provide tools of the same name, and
> > If busybox installs applets also installed by dosfstools, then we also
> > want to expand the exsiting list to also cover dosfstools:
> >     https://git.buildroot.org/buildroot/tree/package/busybox/busybox.mk#n24
> > Can you send a (separate) patch doing so?
> Will do.

Great, thanks.

> I think busybox is the only other package. Maybe my wording was a bit
> too general.

Ok, sounds sane. Thanks for the feedback!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
