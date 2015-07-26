From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 14:11:55 +0200
Subject: [Buildroot] [PATCH] zxing_cpp: New package
In-Reply-To: <CAGduivzTUvGvGs98N1eVnif0tb2ncoJSKD+cn4Y0DmcpET4waw@mail.gmail.com>
References: <1437689326-23261-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20150725222152.GK1847@free.fr>
 <CAGduivzTUvGvGs98N1eVnif0tb2ncoJSKD+cn4Y0DmcpET4waw@mail.gmail.com>
Message-ID: <20150726121155.GC3770@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2015-07-26 13:27 +0200, Maxime Hadjinlian spake thusly:
> On Sun, Jul 26, 2015 at 12:21 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2015-07-24 00:08 +0200, Maxime Hadjinlian spake thusly:
[--SNIP--]
> >> +define ZXING_CPP_INSTALL_STAGING_CMDS
> >> +     for i in $$(find $(@D)/buildroot-build/core/src -iname *.h); do \
> >> +             $(INSTALL) -m 644 $$i $(TARGET_DIR)/usr/local/include; \
> >> +     done
> >> +endef
> >> +
> >> +define ZXING_CPP_INSTALL_TARGET_CMDS
> >> +     for i in $$(find $(@D)/buildroot-build/ -iname *.so -o -iname *.a); do \
> >> +             $(INSTALL) -m 644 $$i $(TARGET_DIR)/usr/lib; \
> >> +     done
> >> +     $(INSTALL) -m 755 $(@D)/buildroot-build/zxing $(TARGET_DIR)/usr/sbin
> >> +endef
> >
> > Why can't we use the standard 'install' rule for either staging or
> > target?
> There's no install in the CMakeLists from the original package,
> there's already multiple issues in their Github to add it but it
> doesn't seem like the maintainer is resolved to add them. Since I
> don't want to add a patch that'll just rot there, I went this way.

That's not how I interpret the comments in the issue report; on the
contrary, I understand that the maintainer will welcome pull requests
for new features, so if you were to send such a PR, it seems it would
have quite some good chances to get in.

Anyway, OK for the way you'r edoing it for now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
