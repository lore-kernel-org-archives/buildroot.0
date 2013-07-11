From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 10:47:44 +0200
Subject: [Buildroot] [PATCH v4 2/2] qt: add powervr and opengl
In-Reply-To: <51DDAF1A.5040602@carallon.com>
References: <1373479838-8288-1-git-send-email-spenser@gillilanding.com>
 <51DDAF1A.5040602@carallon.com>
Message-ID: <20130711104744.7fa84966@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Wagner,

On Wed, 10 Jul 2013 19:59:38 +0100, Will Wagner wrote:

> > +config BR2_PACKAGE_QT_GFX_POWERVR
> > +	depends on BR2_PACKAGE_QT_OPENGL_ES
> > +	depends on BR2_PACKAGE_TI_GFX
> > +	bool "powervr"
> > +
> 
> I don't like that this depends on the TI_GFX package. When I added 
> powervr support to Qt I added a powervr virtual package the same as 
> opengl_es or opengl_egl. This allows Qt to not contain anything specific 
> to the hardware graphics package.

I don't quite understand this. The Qt code that gets enabled with this
option *is* specific to this very driver, so it makes a lot of sense to
have this dependency.

If at some point in the future, we have a different package that is
API-compatible with the ti-gfx package and allows the same Qt PowerVR
code to be enabled, then it will be good time to have a virtual
package. Virtual packages have not impact on the Config.in options
stored in .config, so moving things to a virtual package does not break
the .config API, so we can safely do that in the future, when needed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
