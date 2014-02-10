From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Feb 2014 12:22:49 +0100
Subject: [Buildroot] [PATCH v7 2/4] udev: convert to virtual package.
In-Reply-To: <CAHXCMMJ6aOmS+BN9vXNNeC1UBym6SbzZoHdX4eFa37CmsWWo1w@mail.gmail.com>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-3-git-send-email-eric.le.bihan.dev@free.fr>
 <CAHXCMMJ6aOmS+BN9vXNNeC1UBym6SbzZoHdX4eFa37CmsWWo1w@mail.gmail.com>
Message-ID: <20140210112249.GB22843@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Fri, Feb 07, 2014 at 10:30:15PM +0100, Samuel Martin wrote:
> > diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> > index e157ca8..fe60850 100644
> > --- a/package/modem-manager/Config.in
> > +++ b/package/modem-manager/Config.in
> > @@ -1,6 +1,6 @@
> >  config BR2_PACKAGE_MODEM_MANAGER
> >         bool "modemmanager"
> > -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> > +       depends on BR2_PACKAGE_HAS_UDEV
> >         select BR2_PACKAGE_DBUS
> >         depends on BR2_INET_IPV6
> >         depends on BR2_LARGEFILE # acl
> > @@ -8,8 +8,6 @@ config BR2_PACKAGE_MODEM_MANAGER
> >         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
> >         depends on BR2_USE_MMU # dbus
> >         select BR2_PACKAGE_DBUS_GLIB
> > -       select BR2_PACKAGE_UDEV
> > -       select BR2_PACKAGE_UDEV_ALL_EXTRAS
>
> When removing BR2_PACKAGE_UDEV_ALL_EXTRAS, you should certainly
> replace it by the
> "select ..." statements done in the BR2_PACKAGE_UDEV_ALL_EXTRAS
> symbol, ie: acl and libglib2 (if I understood correctly hwdata is no
> longer needed).
In fact BR2_PACKAGE_DBUS_GLIB already selects BR2_PACKAGE_LIBGLIB2, so only
BR2_PACKAGE_ACL is needed. I will fix this.

Thanks for your review.

Best regards,
ELB
