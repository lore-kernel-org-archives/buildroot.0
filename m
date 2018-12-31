From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:02:05 +0100
Subject: [Buildroot] [RFC 2/3] wpebackend-fdo: new package
In-Reply-To: <20181228015802.GF19602@momiji>
References: <20181223154845.23556-1-francois.perrad@gadz.org>
 <20181223154845.23556-3-francois.perrad@gadz.org>
 <20181228015802.GF19602@momiji>
Message-ID: <20181231150205.2a68a09b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

Thanks for the review!

On Fri, 28 Dec 2018 01:58:02 +0100, Adrian Perez de Castro wrote:

> > diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
> > new file mode 100644
> > index 000000000..9025834e1
> > --- /dev/null
> > +++ b/package/wpebackend-fdo/Config.in
> > @@ -0,0 +1,17 @@
> > +comment "wpebackend-fdo needs an OpenEGL-capable backend"
> > +	depends on !BR2_PACKAGE_HAS_LIBEGL
> > +  
> 
> The dependency line for the comment needs to be updated to be the reverse
> of the list of dependencies for the BR2_PACKAGE_WPEBACKEND_FDO symbol below.
> 
> Also, the comment text should follow the Buildroot style:
> 
>     foo needs a toolchain w/ featA, featB, featC

Actually this form applies to toolchain features. For something like
OpenGL, we do use a comment similar to what Fran?ois has used. See:

$ git grep "comment.*OpenGL"

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
