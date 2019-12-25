From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 23:11:13 +0100
Subject: [Buildroot] [PATCH v3] package/gst1-plugins-bad: wayland plugin
 needs libdrm
In-Reply-To: <20191217191501.4848-1-ps.report@gmx.net>
References: <20191217191501.4848-1-ps.report@gmx.net>
Message-ID: <20191225231113.0e37332f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Dec 2019 20:15:01 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
>   http://autobuild.buildroot.net/results/e06fbed25fc8369c2ff1f3d89b8800766e365ea3
>   http://autobuild.buildroot.net/results/252d2d247339ee6f89ae2b813d33518d612dd9b3
> 
>   Run-time dependency wayland-client found: YES 1.17.0
>   Run-time dependency libdrm found: NO (tried pkgconfig)
>   gst-libs/gst/wayland/meson.build:3:0: ERROR: Dependency "libdrm" not found, tried pkgconfig
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - changed from depends to select libdrm as the alternative patch which
>     removes the wayland plugin dependency did not please upstream
>     (see [2] and [3]) with the argument all wayland implementation do/will
>     depend on libdrm

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
