From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:47:18 +0200
Subject: [Buildroot] [PATCH 1/5] webkitgtk: bump to version 2.22.2
In-Reply-To: <20180922235333.85642-2-aperez@igalia.com>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-2-aperez@igalia.com>
Message-ID: <20180925224718.3fe287e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Sep 2018 02:53:29 +0300, Adrian Perez de Castro wrote:
> Release notes:
> 
>     https://webkitgtk.org/2018/09/03/webkitgtk2.22.0-released.html
>     https://webkitgtk.org/2018/09/20/webkitgtk2.22.1-released.html
>     https://webkitgtk.org/2018/09/21/webkitgtk2.22.2-released.html
> 
> No corresponding security advisories for 2.22.x have been published.
> Nevertheless, due to skipping over versions in the 2.20.x series,
> the following 2.20.x advisories apply:
> 
>     https://webkitgtk.org/security/WSA-2018-0003.html
>     https://webkitgtk.org/security/WSA-2018-0004.html
>     https://webkitgtk.org/security/WSA-2018-0005.html
>     https://webkitgtk.org/security/WSA-2018-0006.html
> 
> This also bumps the required GCC version, due to the WebKit code
> now using more modern C++ features which were introduced in version
> 6.x of the compiler. The dependency is propagated to the midori
> package as well. Last but not least, BR2_PACKAGE_WEBP_DEMUX and
> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX are selected as
> they are unconditionally needed by the newer WebKitGTK+ releases
> when multimedia support is enabled.
> 
> An upstream patch for 32-bit ARM which did not make it to be included
> in this new version is included as well, and can be removed once it
> gets picked in a new release.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/midori/Config.in                      |  6 +--
>  ...ightingNEON.cpp-fails-due-to-missing.patch | 41 +++++++++++++++++++
>  package/webkitgtk/Config.in                   |  9 ++--
>  package/webkitgtk/webkitgtk.hash              |  8 ++--
>  package/webkitgtk/webkitgtk.mk                |  2 +-
>  5 files changed, 55 insertions(+), 11 deletions(-)
>  create mode 100644 package/webkitgtk/0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
