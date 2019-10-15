From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:55:08 +0200
Subject: [Buildroot] [PATCH] package/meson: bump version to 0.52.0
In-Reply-To: <facb0988-a634-9b7d-5218-ce5179023e5a@mind.be>
References: <20191014130053.2061929-1-m.niestroj@grinn-global.com>
 <CAFSsvmqmQB3EA1JFVGOD_XPvS_j_kMc=Lk+8pP+_VYeBQ-mKXA@mail.gmail.com>
 <20191014172551.GD14656@scaer>
 <facb0988-a634-9b7d-5218-ce5179023e5a@mind.be>
Message-ID: <20191015095508.7a302d24@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 09:41:16 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  meson at least has good support for cross-compilation, including support for
> building tools for the build machine as part of the compilation process.
> However, that currently doesn't work completely because of pkg-config. Indeed,
> the same pkg-config will be used for build and for target.
> 
>  This sys_root option could help with that, because we could set pkgconfig
> directly to $(HOST_DIR)/bin/pkgconf instead of the wrapper (and configure
> pkgconf with $(HOST_DIR) as sysroot by default; the actual sysroot is anyway
> going to be set by the wrapper script).
> 
>  Unfortunately, this is not a complete solution because we still have the
> -static flag that we add in the wrapper script. I don't know if meson has
> support for that.

I haven't thought this through completely, but I believe that
per-package support also requires some flexibility that the wrapper
provides. But again, I haven't thought this through entirely, maybe it
would be doable with the meson sys_root option.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
