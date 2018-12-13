From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:19:32 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_beforelight: fix build with
 pkgconf 1.5.3
In-Reply-To: <20181213205952.29015-1-fontaine.fabrice@gmail.com>
References: <20181213205952.29015-1-fontaine.fabrice@gmail.com>
Message-ID: <20181213221932.422dbdcd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Dec 2018 21:59:52 +0100, Fabrice Fontaine wrote:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
> 
> xapp_beforelight uses the appdefaultdir variable from xt.pc to decide
> where to install things. Since DESTDIR is prepended to the install
> destination, this will end up in the wrong location.
> 
> Until a better solution is found in pkgconf, pass the appdefaultdir to
> use explicitly instead of relying on xt.pc.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/164bb80f261f48525de508b5f74321f2fec91cce
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11r7/xapp_beforelight/xapp_beforelight.mk | 1 +
>  1 file changed, 1 insertion(+)

I have applied the entire series of xapp_* fixes. I find it a bit
annoying that we have to spread this workaround in so many places, but
OK we don't have a good alternative option for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
