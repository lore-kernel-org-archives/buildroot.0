From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 29 Mar 2017 12:01:28 -0400
Subject: [Buildroot] [PATCHv4] package: add qt5virtualkeyboard
In-Reply-To: <20170327171929.389034de@gmx.net>
References: <20170324195255.13756-1-gael.portay@savoirfairelinux.com>
 <20170327171929.389034de@gmx.net>
Message-ID: <20170329160128.wriyqt6hsb6kow2a@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon, Mar 27, 2017 at 05:19:29PM +0200, Peter Seiderer wrote:
> Hello Ga?l,
> 
> n Fri, 24 Mar 2017 15:52:55 -0400, Ga?l PORTAY <gael.portay@savoirfairelinux.com> wrote:
> 
> > This patch adds the Qt virtualkeyboard package.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > 
> [...]
> > 
> > +
> > +LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> > +ALL = $(findstring all,$(LANGUAGE_LAYOUTS))
> > +ifneq ($(strip $(LANGUAGE_LAYOUTS)),)
> > +QMAKEFLAGS += CONFIG+="$(foreach lang,$(LANGUAGE_LAYOUTS),lang-$(lang))"
> 
> All variables must start with the same package prefix, here QT5VIRTUALKEYBOARD_ (see [1], I think
> this is to avoid name clashes between the different package makefiles which are loaded for
> all (enabled) packages)...
> 

Fixed.

I guess you are right, it is about naming collision.

> > +
> > +OPENWNN = $(findstring ja_JP,$(LANGUAGE_LAYOUTS))
> > +ifneq ($(strip $(OPENWNN)$(ALL)),)
> > +QT5VIRTUALKEYBOARD_LICENSE += Apache-2.0
> > +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
> > +endif
> > +
> > +PINYIN = $(findstring zh_CN,$(LANGUAGE_LAYOUTS))
> > +ifneq ($(strip $(PINYIN)$(ALL)),)
> > +THIRD_PARTS += pinyin
> 
> Nitpick: 
> 
> QT5VIRTUALKEYBOARD_3RDPARTY_PARTS ?
> 

Fixed.

> > +QT5VIRTUALKEYBOARD_LICENSE += Apache-2.0
> > +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
> > +endif
> > +
> > 
> [...]
> > 
> > +
> > +$(eval $(generic-package))
> 
> Otherwise looks good, with the above fixed you can add my
> 
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> 
> Regards,
> Peter
> 
> [1] http://nightly.buildroot.org/manual.html#_infrastructure_for_packages_with_specific_build_systems

Thanks you very much for your review.

Regards,
Gael
