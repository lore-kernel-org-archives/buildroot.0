From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 09:43:42 +0100
Subject: [Buildroot] [PATCH] ncurses: remove
 BR2_PACKAGE_NCURSES_TARGET_{FORM, MENU, PANEL} options
In-Reply-To: <20170222211702.GB3569@free.fr>
References: <1487713193-3469-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170222211702.GB3569@free.fr>
Message-ID: <20170223094342.2072de65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 22:17:02 +0100, Yann E. MORIN wrote:

> Impressive xommit log. Great! :-)

Thanks!

> >  NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
> >  NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_PC
> > +NCURSES_POST_INSTALL_TARGET_HOOKS += NCURSES_LINK_TARGET_LIBS  
> 
> Would do you need to create the symlinks in target/ ?
> 
> When a program (or lib) is linked to a library, its DT_SONAME is used,
> not the filename.
> 
> So if you have this chain of symlink, with the last element being an
> actual file:
> 
>     libform.so -> libformw.so -> libformw.so.6 -> libformw.so.6.0
> 
> Then 'ld -lform' will in fact use the file libformw.so.6.0, extract its
> DT_SONAME, and use that as a DT_NEEDED in the executable.
> 
> In this case, the DT_SONAME is libformw.so.6

Hum, that's right. Those symlinks are not needd. They were here before,
so I just kept them, but you are indeed right.

> Ditto the syminks about the static libs: they are totally useless in
> target/

Well, static libs are not installed at all on the target, so indeed,
symlinks are useless.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
