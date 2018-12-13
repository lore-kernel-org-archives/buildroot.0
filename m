From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:30:54 +0100
Subject: [Buildroot] [PATCH 1/1] libv4l: fix udev build with pkgconf
 1.5.3
In-Reply-To: <20181212213444.4501-1-fontaine.fabrice@gmail.com>
References: <20181212213444.4501-1-fontaine.fabrice@gmail.com>
Message-ID: <20181213213054.7f8c9f0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 22:34:44 +0100, Fabrice Fontaine wrote:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
> 
> libv4l uses the udevdir variable from libudev.pc to decide where
> to install things. Since DESTDIR is prepended to the install
> destination, this will end up in the wrong location.
> 
> Until a better solution is found in pkgconf, pass the udevdir to use
> explicitly instead of relying on libudev.pc.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/597cd814225c2af9b896a1f25f98cdff33fd810a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libv4l/libv4l.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
