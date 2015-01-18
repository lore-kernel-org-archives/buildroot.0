From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 18:51:01 +0100
Subject: [Buildroot] [PATCH 01/11 v4] package/python-lxml: new package
In-Reply-To: <CAGm1_ksf4gvkx5A4PjxDax=ZQvewETuQL=O5=BmZ8h=UrNrKYg@mail.gmail.com>
References: <cover.1421582718.git.yann.morin.1998@free.fr>
 <24d0ff88170493e141dd07c29c3bcf262a67692f.1421582718.git.yann.morin.1998@free.fr>
 <CAGm1_ksf4gvkx5A4PjxDax=ZQvewETuQL=O5=BmZ8h=UrNrKYg@mail.gmail.com>
Message-ID: <20150118175101.GB16593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2015-01-18 18:27 +0100, Yegor Yefremov spake thusly:
> On Sun, Jan 18, 2015 at 1:11 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > The lxml XML toolkit is a Pythonic binding for the C libraries libxml2
> > and libxslt.
[--SNIP--]
> > +$(eval $(host-python-package))
> 
> Trying to build lxml as normal package and get following error:
> 
> running build_ext
> building 'lxml.etree' extension
> creating build/temp.linux-x86_64-2.7
> creating build/temp.linux-x86_64-2.7/src
> creating build/temp.linux-x86_64-2.7/src/lxml
> /home/user/Documents/versioned/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Os -DNDEBUG -g -fwrapv -O3 -Wall
> -Wstrict-prototypes -fPIC
> -I/home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/src/lxml/includes
> -I/home/user/Documents/versioned/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/python2.7
> -c src/lxml/lxml.etree.c -o
> build/temp.linux-x86_64-2.7/src/lxml/lxml.etree.o -w
> In file included from src/lxml/lxml.etree.c:239:0:
> /home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/src/lxml/includes/etree_defs.h:14:31:
> fatal error: libxml/xmlversion.h: No such file or directory
>  #include "libxml/xmlversion.h"
>                                ^
> compilation terminated.
> 
> What should I pass to setup.py? Should I pass include path to
> include/libxml2? How does it work for the host-package?

Oh.. Good question. I just checked, and I do have the libxml2 development
files installed on my distro. I'll respin a build here with libxml2-dev
uninstalled, see if it still works, and report back.

Thanks for spotting that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
