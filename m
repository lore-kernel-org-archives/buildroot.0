From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:26:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: More fixes to static
 compile
In-Reply-To: <1438203871-8548-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438203871-8548-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829232625.214c5b01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 29 Jul 2015 23:04:31 +0200, Bernd Kuhls wrote:
> libz is needed by libid3tag, fixes
> http://autobuild.buildroot.net/results/85e/85e53f2b30f107f486be08549ce6df08953ea499/
> 
> libm is needed by libexif, changes
> 
> checking for exif_data_new_from_file in -lexif... no
> checking for exif_data_new_from_file in -lexif... no
> 
> from the forementioned autobuilder config.log to
> 
> checking for exif_data_new_from_file in -lexif... yes
> 
> The pkgconfig file of libvorbis is called vorbis.pc, fix wrong naming. Also
> we need to link against libsqlite3, so add that lib to the pkgconf call.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/minidlna/minidlna.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

It's now too late for 2015.08. Therefore, could you engage the process
of moving minidlna (and its dependencies to use pkg-config), in order
to fix this properly? minidlna Git repository seems to be active, so
there is a chance of getting such changes merged.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
