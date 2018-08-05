From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 12:55:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5base: fix
 PKG_CONFIG_LIBDIR
In-Reply-To: <20180802180944.26935-1-bernd.kuhls@t-online.de>
References: <20180802180944.26935-1-bernd.kuhls@t-online.de>
Message-ID: <20180805125539.7bff50c7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Aug 2018 20:09:44 +0200, Bernd Kuhls wrote:
> By default pkgconf searches "${libdir}/pkgconfig:${datadir}/pkgconfig"
> for .pc files:
> https://github.com/pkgconf/pkgconf/blob/844f0a66621629a65e3cbf3c3ca47185602e9df5/configure.ac#L41
> 
> The new xorgproto package installs .pc files to ${datadir}/pkgconfig
> whichs translates to $(STAGING_DIR)/usr/share/pkgconfig, for example
> dri3proto:
> https://cgit.freedesktop.org/xorg/proto/xorgproto/tree/Makefile.am#n65
> 
> whereas the old xproto_ packages installed their .pc files to
> ${libdir}/pkgconfig:
> https://cgit.freedesktop.org/xorg/proto/dri3proto/tree/Makefile.am?id=3937f72040b79c7245b261da880364177cc40a6e#n4
> 
> Normally this upstream change is not a problem because pkgconf searches
> both paths for .pc files, unless we define PKG_CONFIG_LIBDIR with
> something else like we did for the last six years ;)
> https://github.com/buildroot/buildroot/blame/master/package/qt5/qt5base/qt5base.mk#L280
> 
> This patch removes all variables concerning pkgconf paths. At the time
> the qt5base package was introduced the pkgconf wrapper did not exist.
> Today these variables are not necessary anymore.
> 
> Fixes
> http://autobuild.buildroot.net/results/061/06159500c27026d56a772fafbb0d956c72dd4e6c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Removed PKG_CONFIG_* variables (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
