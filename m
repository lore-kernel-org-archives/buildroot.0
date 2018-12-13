From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:20:41 +0100
Subject: [Buildroot] [PATCH v2,1/1] ccid: fix build with pkgconf 1.5.3
In-Reply-To: <20181212091517.23861-1-fontaine.fabrice@gmail.com>
References: <20181212091517.23861-1-fontaine.fabrice@gmail.com>
Message-ID: <20181213212041.21000c96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 12 Dec 2018 10:15:17 +0100, Fabrice Fontaine wrote:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
> 
> ccid uses the usbdropdir variable from libpcsclite.pc to decide where to
> install things. Since DESTDIR is prepended to the install destination,
> this will end up in the wrong location.
> 
> Until a better solution is found in pkgconf, pass the usbdropdir to use
> explicitly instead of relying on libpcsclite.pc.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4d4c1ba7f5d00d1b927ac01ef9851468abfbdff2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Drop patch to remove DESTDIR and use --enable-usbdropdir

Applied to master, thanks. I'd like to take this opportunity to thank a
lot for the work you've done on fixing the fallouts/consequences of the
pkg-config 1.5.3, which I authored and committed. I have been busy the
last few evenings, and couldn't help much with that, so I'm glad you've
been here to help with this. Many thanks for that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
