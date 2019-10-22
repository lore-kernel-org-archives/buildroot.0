From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:02:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-headers: fix install of
 dri.pc
In-Reply-To: <20191012173011.11419-1-bernd.kuhls@t-online.de>
References: <20191012173011.11419-1-bernd.kuhls@t-online.de>
Message-ID: <20191022230239.5de5d75b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Oct 2019 19:30:11 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Due to the switch of mesa3d to the meson build system the upstream
> tarball does not include dri.pc.in anymore, it is created during the
> build now:
> https://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/drivers/dri/meson.build?h=19.2#n93
> 
> In order to provide dri.pc we need to add a version taken from a dri-
> based mesa3d build to our source repository, by doing so we can reduce
> the number of sed commands.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

But does it make sense for mesa3d-headers to install dri.pc in the
first place ? mesa3d-headers is normally only supposed to install the
Khronos headers that some OpenGL implementation do not provide.

I'm not sure it makes sense for it to install dri.pc.

Could you give more details about the situation you've encountered
where dri.pc was missing, and that let you to propose this patch ? This
might help figuring out what is the right solution (which may turn out
to be your proposal, but I'd like to understand better).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
