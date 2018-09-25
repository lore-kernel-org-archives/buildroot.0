From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:52:55 +0200
Subject: [Buildroot] [PATCH 2/5] webkitgtk: add dependency on the woff2
 package
In-Reply-To: <20180922235333.85642-3-aperez@igalia.com>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-3-aperez@igalia.com>
Message-ID: <20180925225255.3fe01107@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Sep 2018 02:53:30 +0300, Adrian Perez de Castro wrote:
> The woff2 dependency is used to support Web fonts in WOFF2 format.
> This is a Web-facing feature that Web sites expect WebKit to support,
> and it is recommended to be unconditionally enabled. While it is
> possible to disable the feature at build time, upstream only recommends
> doing so if the target system cannot provide a woff2 package.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/Config.in    | 1 +
>  package/webkitgtk/webkitgtk.mk | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

In general, we are not really happy with optional dependencies turned
into mandatory dependencies. For example, the EFL package makes a lot
of dependencies optional, even if upstream strongly recommends to have
such dependencies enabled (to the point where efl.mk needs to pass
--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb).

However, since woff2 has very few dependencies, and
woff2+brotli+host-pkgconf build in 19 seconds, it's nothing compared to
webkitgtk, so I applied your patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
