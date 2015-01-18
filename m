From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 23:26:57 +0100
Subject: [Buildroot] [RFC] python-lxml: add target package variant
In-Reply-To: <CAGm1_ksk2RqtAHWqQHCaPeGGR4VLiD37X=HMOtzwaHz8yZp-Eg@mail.gmail.com>
References: <1421619459-26270-1-git-send-email-yegorslists@googlemail.com>
 <CAGm1_ksk2RqtAHWqQHCaPeGGR4VLiD37X=HMOtzwaHz8yZp-Eg@mail.gmail.com>
Message-ID: <20150118222657.GG16593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2015-01-18 23:23 +0100, Yegor Yefremov spake thusly:
> On Sun, Jan 18, 2015 at 11:17 PM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
[--SNIP--]
> > -PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
> > +PYTHON_LXML_DEPENDENCIES = libxml2 libxslt host-libxslt
> >
> > +
> > +$(eval $(python-package))
> >  $(eval $(host-python-package))
> 
> After adding host-xslt I don't have compiler errors, but linking:
> 
> >>> python-lxml 3.4.1 Building
[--SNIP--]
> build/lib.linux-x86_64-2.7/lxml/etree.so
> /home/user/Documents/versioned/buildroot/output/host/usr/lib/libxslt.so:
> file not recognized: File format not recognized
> collect2: error: ld returned 1 exit status
> error: command '/home/user/Documents/versioned/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc'
> failed with exit status 1
> package/pkg-generic.mk:182: recipe for target
> '/home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/.stamp_built'
> failed
> make: *** [/home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/.stamp_built]
> Error 1
> 
> The whole stuff tries to link against host variant.  Samuel Martin, do
> you have any idea?

I'll take a look shortly.

In the meantime, I've marked this patch as "Changes requested", too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
