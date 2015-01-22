From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Jan 2015 22:51:54 +0100
Subject: [Buildroot] [PATCH 3/3] use TARGET_CONFIGURE_OPTS instead of
 homegrown ENV
In-Reply-To: <CANxTyt7+xC2zY3W7M-njuAC4P1wP1NKC-wQQt6yM_odzOr7Hsw@mail.gmail.com>
References: <20150117192144.GA2827@tarshish>
 <1421953904-9156-1-git-send-email-codehero@gmail.com>
 <1421953904-9156-3-git-send-email-codehero@gmail.com>
 <CANxTyt7+xC2zY3W7M-njuAC4P1wP1NKC-wQQt6yM_odzOr7Hsw@mail.gmail.com>
Message-ID: <20150122215154.GA3970@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, David,All,

On 2015-01-22 16:32 -0500, Danomi Manchego spake thusly:
> David,
> Seems like you should have squashed this into a single "cigic: new
> package" patch, no?  Forgot to rebase?

In fact, I asked David to send his patches as-is, because we discussed
on IRC an issue remaining about licensing information that did not get
saved for some of the packages while it got saved for the others.

I was supposed to review the patches tonight (UTC+1), but got delayed
due to heavy electricity work in the house...

Of course, you are entirely right: the patches about each single package
should have been squahes. That can be done later when we have solved the
licensing info issue.

Thanks for your early review! ;-)

Regards,
Yann E. MORIN.

> On Thu, Jan 22, 2015 at 2:11 PM, David Bender <codehero@gmail.com> wrote:
> >
> > Signed-off-by: David Bender <codehero@gmail.com>
> > ---
> >  package/cgic/cgic.mk |    7 ++-----
> >  1 files changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
> > index 378e1cd..a575a16 100644
> > --- a/package/cgic/cgic.mk
> > +++ b/package/cgic/cgic.mk
> > @@ -9,14 +9,11 @@ CGIC_SOURCE = cgic206.tar.gz
> >  CGIC_SITE = http://boutell.com/cgic
> >  CGIC_LICENSE = Custom
> >  CGIC_LICENSE_FILES = license.txt
> > -
> > -CGIC_ENV = AR=$(TARGET_CROSS)ar \
> > -       CC=$(TARGET_CROSS)gcc \
> > -       RANLIB=$(TARGET_CROSS)ranlib
> > +CGIC_INSTALL_STAGING = YES
> >
> >  define CGIC_BUILD_CMDS
> >         (cd $(@D); \
> > -               $(CGIC_ENV) \
> > +               $(TARGET_CONFIGURE_OPTS) \
> >                 make libcgic.a \
> >                 )
> >  endef
> > --
> > 1.7.8.6
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
