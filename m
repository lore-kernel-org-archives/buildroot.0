From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 08:55:33 +0200
Subject: [Buildroot] [PATCH 1/1] Revert "package/opencv3: bump to
 version 4.2.0"
In-Reply-To: <20200310223132.668486-1-fontaine.fabrice@gmail.com>
References: <20200310223132.668486-1-fontaine.fabrice@gmail.com>
Message-ID: <20200330085533.70a71b9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 23:31:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 5e51bb2756ee5063eff9a45a46033a449e2a6195.
> Indeed, version 4.x is not backward with opencv 3.x, most of the C API
> has been removed as stated in https://opencv.org/opencv-4-0.
> 
> Moreover, these issues should also be fixed:
>  - pkg-config file is not installed by default since
>  https://github.com/opencv/opencv/commit/e755a2a6e48ae02dd5136a628cc4148566a08225
>  - layout of include files and pkg-config file name are different since
>  https://github.com/opencv/opencv/commit/a95673287433fc810eda2d88b94bb234298c4cd5
> 
> As a result, ffmpeg fails to build with opencv 4.2.0.
> 
> Moreover, it should be noted that -DPROTOBUF_UPDATE_FILES=ON should be
> applied in a separate patch to fix existing build failure with 3.4.9 as
> stated in https://patchwork.ozlabs.org/patch/1222308
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ef1d09d8b234807dcd993422f9557e5c34506013
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opencv3/opencv3.hash | 4 ++--
>  package/opencv3/opencv3.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
