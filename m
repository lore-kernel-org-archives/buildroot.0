From: daggs <daggs@gmx.com>
Date: Fri, 29 Dec 2017 14:57:59 +0100
Subject: [Buildroot] [PATCH] tvheadend: add dependency on udev based
 rootfs creation
In-Reply-To: <20171229144031.798b5f81@windsurf.lan>
References: <20171229130604.9897-1-daggs@gmx.com>
 <20171229144031.798b5f81@windsurf.lan>
Message-ID: <trinity-7a471839-219c-4b6c-945d-9f235fe5b75a-1514555879257@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Friday, December 29, 2017 at 3:40 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] tvheadend: add dependency on udev based rootfs creation
>
> Hello,
> 
> On Fri, 29 Dec 2017 15:06:04 +0200, Dagg Stompler wrote:
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is needed for tvheadend inorder
> > for the program to see usb based DVB cards.
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  package/tvheadend/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> > index 44a69a27ba..2a497b481d 100644
> > --- a/package/tvheadend/Config.in
> > +++ b/package/tvheadend/Config.in
> > @@ -9,6 +9,7 @@ config BR2_PACKAGE_TVHEADEND
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> >  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> > +	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> 
> You should use BR2_PACKAGE_HAS_UDEV instead. Indeed udev can be
> provided by either eudev or systemd.
does using BR2_PACKAGE_HAS_UDEV means rootfs dev creation will use udev?

> 
> This change will also require a change in the Config.in comment. See
> package/dt-utils/Config.in for an example.
will look into it.

> 
> Also, does tvheadend needs to link with libudev ? If so, it should have
> udev in its <pkg>_DEPENDENCIES. If it doesn't link with libudev, then
> I'm not sure to see how udev helps for tvheadend to detect USB DVB
> cards.
it doesn't, frankly I don't understand it too, I'm wrestling this for 3 weeks now, without udev, tvheadend didn't listed my adapter in the webui.
on the desktop it did, after some thinking I've decided to try building udev and it worked.
maybe Bernd might have some ideas on the matter. 

Dagg.
