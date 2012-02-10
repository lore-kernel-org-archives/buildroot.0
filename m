From: J.C. Woltz <jwoltz@gmail.com>
Date: Fri, 10 Feb 2012 09:28:09 -0500
Subject: [Buildroot] [PATCH] [PATCH] usb_modeswitch: upgrade to 1.2.3
In-Reply-To: <CAAXf6LV0=icDwrE8doD+TkxJBFMcCfbKnnwLNPH=bNdJ5m5-2Q@mail.gmail.com>
References: <1328830956-11154-1-git-send-email-jwoltz@gmail.com>
 <CAAXf6LV0=icDwrE8doD+TkxJBFMcCfbKnnwLNPH=bNdJ5m5-2Q@mail.gmail.com>
Message-ID: <CAC78GpfLO9XPZh4gU8ShTR9i8vBMaZQ6HQ0Uwfpf6xwPw-aJLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 2:29 AM, Thomas De Schampheleire <
patrickdepinguin+buildroot@gmail.com> wrote:

> Hello,
>
> On Fri, Feb 10, 2012 at 12:42 AM, J.C. Woltz <jwoltz@gmail.com> wrote:
> > From: "J.C. Woltz" <jwoltz@gmail.com>
> >
> > Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
>
> You shouldn't include a From: line. The Signed-off-by: is the one that
> should be present.
>
>
Will fix.


>
> > --- a/package/usb_modeswitch/Config.in
> > +++ b/package/usb_modeswitch/Config.in
> > @@ -7,3 +7,4 @@ config BR2_PACKAGE_USB_MODESWITCH
> >          Used to switch mode on multiple-function devices
> >
> >          http://www.draisberghof.de/usb_modeswitch/
> > +
>
> Why is this change needed? I think it should be removed from the patch.
>
> Will remove, accidental change.


> > diff --git a/package/usb_modeswitch/usb_modeswitch.mkb/package/usb_modeswitch/
> usb_modeswitch.mk
> > index 7b982d8..3d03888 100644
> > --- a/package/usb_modeswitch/usb_modeswitch.mk
> > +++ b/package/usb_modeswitch/usb_modeswitch.mk
> > @@ -4,22 +4,22 @@
> >  #
> >  #############################################################
> >
> > -USB_MODESWITCH_VERSION = 1.1.2
> > +USB_MODESWITCH_VERSION = 1.2.3
> >  USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
> >  USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
> >  USB_MODESWITCH_DEPENDENCIES = libusb-compat
> >
> >  define USB_MODESWITCH_BUILD_CMDS
> > -       $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> > +       $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
> >  endef
>
> Is there a particular reason why you changed this?
>
> And to other buildroot developers: what is the policy regarding
> directly specifying CC and LD, instead of using variables like
> TARGET_CONFIGURE_OPTS ?
>
>
Yes, I changed that line since usb_modeswitch would not compile. I was
following the example from:
http://buildroot.uclibc.org/buildroot.html#generic-tutorial

Please let me know how or what you want changed, and I will re-submit.

Thank you,
J.C. Woltz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/a21eecc3/attachment.html>
