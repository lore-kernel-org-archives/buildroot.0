From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:23:18 +0100
Subject: [Buildroot] [PATCHv3 06/74] busybox: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <20141130145506.GK4124@free.fr>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141130145506.GK4124@free.fr>
Message-ID: <20141130172317.GF4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:55 +0100, Yann E. MORIN spake thusly:
> On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/busybox/busybox.mk | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> > index f0fa851..eb2f3f1 100644
> > --- a/package/busybox/busybox.mk
> > +++ b/package/busybox/busybox.mk
> > @@ -218,8 +218,11 @@ define BUSYBOX_INSTALL_TARGET_CMDS
> >  		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
> >  			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
> >  	fi
> > -	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
> >  	$(BUSYBOX_INSTALL_MDEV_CONF)
> > +endef
> > +
> > +define BUSYBOX_INSTALL_INIT_SYSV
> > +	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
> 
> The installation of the script is stil conditional:
[--SNIP--]

OK, I saw you added a fix for that latter in the series. So:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
