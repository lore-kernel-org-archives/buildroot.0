From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:58:53 +0200
Subject: [Buildroot] [PATCH] qt53d: fix install issue with qt5.6
In-Reply-To: <20180611135655.22300-1-gael.portay@savoirfairelinux.com>
References: <20180611135655.22300-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180617145853.13e109b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jun 2018 09:56:55 -0400, Ga?l PORTAY wrote:
> Both plugins `geometryloaders' and `renderplugins' are available since
> Qt 5.9.
> 
> Fixes:
> 
> 	>>> qt53d 5.6.3 Installing to target  
> 	cp -dpf /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt53D*.so.*
> /home/gportay/src/buildroot/output/target/usr/lib
> 	cp -dpfr /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/plugins/geometryloaders
> /home/gportay/src/buildroot/output/target/usr/lib/qt/plugins
> 	cp: cannot stat '/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/plugins/geometryloaders': No such file or directory
> 	package/pkg-generic.mk:310: recipe for target '/home/gportay/src/buildroot/output/build/qt53d-5.6.3/.stamp_target_installed' failed
> 	make[2]: *** [/home/gportay/src/buildroot/output/build/qt53d-5.6.3/.stamp_target_installed] Error 1
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt53d/qt53d.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
