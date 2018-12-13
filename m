From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:21:43 +0100
Subject: [Buildroot] [PATCH 1/1] acsccid: fix build with pkgconf 1.5.3
In-Reply-To: <20181212195256.4217-1-fontaine.fabrice@gmail.com>
References: <20181212195256.4217-1-fontaine.fabrice@gmail.com>
Message-ID: <20181213212143.6d1c44cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 20:52:56 +0100, Fabrice Fontaine wrote:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
> 
> acsccid uses the usbdropdir variable from libpcsclite.pc to decide where
> to install things. Since DESTDIR is prepended to the install
> destination, this will end up in the wrong location.
> 
> Until a better solution is found in pkgconf, pass the usbdropdir to use
> explicitly instead of relying on libpcsclite.pc.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9dc76478d81ea2469900a4b4aab0e31fee9c4032
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/acsccid/acsccid.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
