From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Jan 2017 12:37:56 -0200
Subject: [Buildroot] Adding kmscube support
In-Reply-To: <87y3y4pnrk.fsf@dell.be.48ers.dk>
References: <CAOMZO5BDx6SqN-ZxU+ogJNetjtZhDqWrF0cB5YhqC7pW3NwaSA@mail.gmail.com>
 <CAOMZO5AYjEb56ErnvnAQ-PA4xtZb_97BsGyqYRF2tWSj+Osi-A@mail.gmail.com>
 <CAOMZO5DdVzn6+p3vDqjRXt=a28NVNAOw84H=-d8zio_J9gyNLg@mail.gmail.com>
 <87y3y4pnrk.fsf@dell.be.48ers.dk>
Message-ID: <CAOMZO5Az55JR=3ao1d5khYTtybqeJZXK8SkTDB_kxfmGQvEPyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, Jan 21, 2017 at 11:04 AM, Peter Korsgaard <peter@korsgaard.com> wrote:

> This is handled through the the BR2_PACKAGE_HAS_LIBGLES / libgles
> virtual package (as we have several packages providing GL support).
>
> See E.G. the efl or cairo packages for examples. You might also be
> missing our pkg-config (add host-pkgconf to dependencies).

Thanks for the hints. Selecting BR2_PACKAGE_MESA3D_OPENGL_ES=y did the trick.

kmscube builds, but there is one gbm issue I need to investigate:

# kmscube
trying to load module i915...failed.
trying to load module radeon...failed.
trying to load module nouveau...failed.
trying to load module vmwgfx...failed.
trying to load module omapdrm...failed.
trying to load module exynos...failed.
trying to load module msm...failed.
trying to load module imx-drm...success.
MESA-LOADER: failed to retrieve device information
gbm: failed to open any driver (search paths /usr/lib/dri)
gbm: Last dlopen error: File not found
failed to load driver: imx-drm
gbm: failed to open any driver (search paths /usr/lib/dri)
gbm: Last dlopen error: File not found
failed to load driver: kms_swrast
gbm: failed to open any driver (search paths /usr/lib/dri)
gbm: Last dlopen error: File not found
failed to load swrast driver
Segmentation fault
#
