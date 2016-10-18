From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 12:02:52 +0200
Subject: [Buildroot] [PATCH v1] motion: fix sdl-config detection
In-Reply-To: <1476737088-1492-1-git-send-email-ps.report@gmx.net>
References: <1476737088-1492-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161018120252.2e27edf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 22:44:48 +0200, Peter Seiderer wrote:
> Overwrite ac_cv_path_CONFIG_SDL in case sdl development is
> installed on the host.
> 
> Fixes [1]:
> 
>   ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/SDL'
> 
> [1] http://autobuild.buildroot.net/results/459/4592eb83efa393f77f5ee014f93a271f2313bee6
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied to master, however, one question below.


>  ifeq ($(BR2_PACKAGE_SDL),y)
>  MOTION_DEPENDENCIES += sdl
>  MOTION_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr

With the ac_cv_path_CONFIG_SDL, is this --with-sdl still really
necessary?

If it uses the sdl-config script to get the SDL path, then it should
theoretically no longer be needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
