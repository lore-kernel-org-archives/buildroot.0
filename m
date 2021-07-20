From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:36:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/granite: link with -lintl if
 needed
In-Reply-To: <20210704123206.3278173-1-fontaine.fabrice@gmail.com>
References: <20210704123206.3278173-1-fontaine.fabrice@gmail.com>
Message-ID: <20210720223600.0da5693c@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun,  4 Jul 2021 14:32:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Link with TARGET_NLS_LIBS if needed to avoid the following build
> failure:
> 
> /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: lib/libgranite.so.5.4.0.p/meson-generated_Application.c.o: in function `_vala_array_free.constprop.0':
> Application.c:(.text+0x340): undefined reference to `libintl_bindtextdomain'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d754cb776a1e11031cef4e66d45619aad5c4575d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/granite/granite.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
