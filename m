From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Jul 2013 18:23:05 +0200
Subject: [Buildroot] [PATCH v4 1/2] ti-gfx: add new package
In-Reply-To: <CAEBucnAmh-ihLbEvCV+P81kcRYkC7EacYz+HQ6NkUg+tidMtGw@mail.gmail.com>
References: <1373479755-8086-1-git-send-email-spenser@gillilanding.com>
 <20130711114129.346bc011@skate>
 <CAEBucnAmh-ihLbEvCV+P81kcRYkC7EacYz+HQ6NkUg+tidMtGw@mail.gmail.com>
Message-ID: <20130712162305.GA3329@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spenser, All,

On 2013-07-11 11:07 -0500, Spenser Gilliland spake thusly:
[--SNIP--]
> >> +define TI_GFX_INSTALL_LIBS_CMDS
> >> +     # create symlinks and install libraries.  these libraries do not have a
> >> +     # SONAME defined; therefore, they will not be automatically renamed and
> >> +     # must be renamed manually.
> >
> > I still don't understand this "automatically renamed" comment here.
> 
> i remember hearing that in some rootfs fixup, the libraries are
> renamed with symlinks according to the SONAME.  However, I can't find
> it in the code so maybe this was just bad information.

No, that's not done.

I suggested the idea that, by renaming the libraries to their SONAME, we
could get rid of the symlinks (since we do not need them at runtime), and
thus reduce the number of inodes needed (since symlinks take one inode
each), and thus reduce the filesystem size.

But the gain would be small, and almost un-noticeable on large
filesystem with biggish libs (Qt, Xorg...), so doing it in Buildroot has
been deemed too complex given the small size it would gain.

If anyone wants to do it, it would be fit for a post-build script.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
