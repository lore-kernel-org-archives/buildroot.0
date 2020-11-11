From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 11:58:53 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: Add xcb-fixes to loader
 when using x11 and dri3
In-Reply-To: <20201108175105.3884636-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 8 Nov 2020 18:51:05 +0100")
References: <20201108175105.3884636-1-romain.naour@gmail.com>
Message-ID: <87o8k4kvma.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > "loader_dr3_helper.c uses xcb_xfixes_create_region() that requires dep_xcb_xfixes to link.
 > This is dependent on with_platform_x11 and with_dri3.
 > But the source meson file does not set this up dependent on with_dri3."

 > i686-buildroot-linux-gnu/bin/ld:
 > src/loader/libloader_dri3_helper.a(loader_dri3_helper.c.o): in
 > function `loader_dri3_swap_buffers_msc':
 > loader_dri3_helper.c:(.text.loader_dri3_swap_buffers_msc+0x33e): undefined reference to `xcb_xfixes_create_region'

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981830

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
