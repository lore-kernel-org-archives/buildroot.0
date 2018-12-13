From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:31:46 +0100
Subject: [Buildroot] [PATCH 1/1] clamav: add optional systemd dependency
In-Reply-To: <20181212222238.23908-1-fontaine.fabrice@gmail.com>
References: <20181212222238.23908-1-fontaine.fabrice@gmail.com>
Message-ID: <20181213213146.23236807@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 23:22:38 +0100, Fabrice Fontaine wrote:
> clamav has an optional systemd dependency
> 
> Moreover, since the bump to 1.5.3, pkgconf prepends the sysroot to all
> absolute paths found in the .pc file. This is correct when the paths
> refer to something in STAGING_DIR (e.g. libdir, includedir), but not
> when it refers to something used for the target.
> 
> clamav uses the systemdsystemunitdir variable from systemd.pc to decide
> where to install things. Since DESTDIR is prepended to the install
> destination, this will end up in the wrong location.
> 
> Until a better solution is found in pkgconf, pass the
> systemdsystemunitdir to use explicitly instead of relying on systemd.pc.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fe526c60542527112e6441e453b4df5de49242d9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/clamav/clamav.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
