From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Nov 2017 10:37:10 +0200
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <20171122085327.084ef828@windsurf.lan>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
 <20171122041747.11363-1-yurovsky@gmail.com>
 <20171122085327.084ef828@windsurf.lan>
Message-ID: <20171122083709.lwprqlkpjcyzour3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 22, 2017 at 08:53:27AM +0100, Thomas Petazzoni wrote:
> On Tue, 21 Nov 2017 20:17:47 -0800, Andrey Yurovsky wrote:
> 
> > diff --git a/package/rauc/Config.in.host b/package/rauc/Config.in.host
> > index a58685a..1bd9a79 100644
> > --- a/package/rauc/Config.in.host
> > +++ b/package/rauc/Config.in.host
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_HOST_RAUC
> >  	bool "host rauc"
> > +	select BR2_PACKAGE_HOST_SQUASHFS # run-time dependency
> 
> If it's a runtime dependency...
> 
> > -HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
> > +HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs
> 
> ...you don't need to list it in <pkg>_DEPENDENCIES.

This is probably right in this case, since there is no in-tree host-rauc 
dependency. But in the general case a host package might be used at any point 
in the build. So you need to make sure that, e.g., host-squashfs is ready when 
host-rauc is to run, right?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
