From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2015 00:05:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix building if GCC's C
 standard is not gnu99
In-Reply-To: <5595B12E.1070705@mind.be>
References: <1435860302-16176-1-git-send-email-bernd.kuhls@t-online.de>
 <20150702231241.69ef0bea@gmx.net> <5595B12E.1070705@mind.be>
Message-ID: <20150702220533.GK3838@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-07-02 23:46 +0200, Arnout Vandecappelle spake thusly:
> On 07/02/15 23:12, Peter Seiderer wrote:
> [snip]
> > From build/libv4l-1.6.2/config.log:
> > 
> > configure:4709: checking for .../host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc option to accept ISO C99
> > configure:4858: .../host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
> > conftest.c:54:9: error: unknown type name 'wchar_t'
> >    const wchar_t *name;
> > 
> > 
> > The C99 detection problem seems more related to missing wchar_t type support than the compiler option?
> 
>  Good catch!
> 
> [Adding Waldemar for uClibc input]
> 
>  The configure script does include wchar.h, but it seems that wchar_t doesn't
> get defined after all... Waldemar, any idea?

No wchar support in the toolchain, maybe?

Peter, can you confirm your toolchain is missing wchar (BR2_USE_WCHAR)?

Note: I am *not* saying those packages should depend on whar, just that
this would explain the failing (and broken!) autoconf test.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
