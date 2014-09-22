From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Sep 2014 18:46:37 +0200
Subject: [Buildroot] Buidroot zic command
In-Reply-To: <CAHXCMML5tqfMj2UM4bFBNaX2j4RxyYFdC6qawVbAPbX7Yx5HYA@mail.gmail.com>
References: <CAK6UBYnckKz+jEULybXADyGk-C+xL6-mEFNEOXqsvfYfz+YcyQ@mail.gmail.com>
 <CAHXCMML5tqfMj2UM4bFBNaX2j4RxyYFdC6qawVbAPbX7Yx5HYA@mail.gmail.com>
Message-ID: <20140922164637.GA4358@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Idoia, All,

On 2014-09-22 13:34 +0200, Samuel Martin spake thusly:
> Please put Buildroot mailling in cc, since some people may wonder the
> same thing, and others will be able to help.

Indeed.

You sent Samuel a private mail. You sent me a private mail. Who else di
you send a private mail, too? This is considered bad practice. You're
lucky you even get a response at all.

> On Mon, Sep 22, 2014 at 12:25 PM, Idoia Mazkiaran Zelaia
> <idoia.mazkiaran@gmail.com> wrote:
> > Hello Samuel,
> > I would like to know how can we have the zic command in Buildroot rootfs
> > when the toolchain is external and for instance it is not a libc compiler.
> >
> > Because we have already choosen in Buildroot 2014.08 Install time zone info,
> > but here comes only the zone information in /usr/share/zoneinfo but not the
> > zic command to create our own zone in execution time.
> >
> 
> The zic program is a host program that is installed in
> <output>/host/usr/bin/zic.
> It belongs to the zip package (that is part of the Buildroot 2014.08

s/zip/zic/

> release) which is automatically selected when you select tzdata or
> tzdump.
> 
> There is currently no rule to build and install the zic package for the target.

That's because zic is needed at build time, not at runtime. The prupose
of zic is to assemble the timezone info, which is what is needed on the
target.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
