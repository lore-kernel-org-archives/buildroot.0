From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:23:10 +0100
Subject: [Buildroot] [PATCH] package/kf5/kf5-kcoreaddons: don't treat ld
 warnings as errors
In-Reply-To: <20191218161957.110979-1-giulio.benetti@benettiengineering.com>
References: <20191218161957.110979-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191218232310.0f8ac34d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Dec 2019 17:19:57 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Microblaze ld emits warnings like:
> '
> FDE encoding in
> CMakeFiles/KF5CoreAddons.dir/KF5CoreAddons_autogen/mocs_compilation.cpp.o(.eh_frame)
> prevents .eh_frame_hdr table being created
> '
> Since '-Wl,--fatal-warnings' is passed by default, build fails, so don't
> treat warnings as errors by appending "-Wl,--no-fatal-warnings" to
> CMAKE_SHARED_LINKER_FLAGS that is previously defined in package
> dependency kf5-extra-cmake-modules.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f19/f198c86930535c50393e17fc7a70fb4f27b096ee/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
