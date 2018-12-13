From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:30:49 +0100
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: fix build with pkgconf
 1.5.3
In-Reply-To: <20181212205206.32255-1-fontaine.fabrice@gmail.com>
References: <20181212205206.32255-1-fontaine.fabrice@gmail.com>
Message-ID: <20181213213049.5e251078@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 21:52:06 +0100, Fabrice Fontaine wrote:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
> 
> bluez5_utils uses the sysconfdir variable from dbus-1.pc to decide where
> to install things. Since DESTDIR is prepended to the install
> destination, this will end up in the wrong location.
> 
> Until a better solution is found in pkgconf, pass the sysconfdir to use
> explicitly instead of relying on dbus-1.pc.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/498e7e368fbb3d69c2f311e3e5bc213e507b8023
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bluez5_utils/bluez5_utils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
