From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:01:16 +0100
Subject: [Buildroot] [PATCH 1/1] qt: disable static build for qt-zlib
In-Reply-To: <20181108192829.17014-1-fontaine.fabrice@gmail.com>
References: <20181108192829.17014-1-fontaine.fabrice@gmail.com>
Message-ID: <20181108210116.59332e38@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Nov 2018 20:28:29 +0100, Fabrice Fontaine wrote:
> Static build of applications using qt-zlib and zlib (such as mpv) will
> fail because zlib and qt-zlib defines the same functions (inflateReset,
> inflatePrime ...)
> 
> So add a dependency on !BR2_STATIC_LIBS on BR2_PACKAGE_QT_QTZLIB
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0be6e359d46a8a701006305c32b514687854b035
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
