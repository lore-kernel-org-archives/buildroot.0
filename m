From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:39:59 +0100
Subject: [Buildroot] [PATCH 1/1] vdr-plugin-vnsiserver: fix build with
 pkgconf 1.5.3
In-Reply-To: <20181214212551.10081-1-fontaine.fabrice@gmail.com>
References: <20181214212551.10081-1-fontaine.fabrice@gmail.com>
Message-ID: <20181214223959.75d9b500@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Dec 2018 22:25:51 +0100, Fabrice Fontaine wrote:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
> 
> vdr-plugin-vnsiserver uses the locdir variable from vdr.pc to decide
> where to install things. Since DESTDIR is prepended to the install
> destination, this will end up in the wrong location.
> 
> Until a better solution is found in pkgconf, pass the LOCDIR to use
> explicitly instead of relying on vdr.pc.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9be3719f7b2137a5f039f3c4209c3bc7edeae2b4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
