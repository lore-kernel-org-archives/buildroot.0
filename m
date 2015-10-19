From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 22:41:32 +0200
Subject: [Buildroot] [PATCH 1/2] xdriver_xf86-video-intel: add upstream
 patches fixing fstat build errors
In-Reply-To: <1445275224-3928-1-git-send-email-james.knight@rockwellcollins.com>
References: <1445275224-3928-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151019224132.27bf4b6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Mon, 19 Oct 2015 13:20:23 -0400, James Knight wrote:
> Attempting to build xdriver_xf86-video-intel version 2.99.917 with udev
> results in compilation failures. The provided patches ([1], [2])
> corrects the `implicit declaration of function 'fstat'` occurrences
> during the building of this driver.
> 
> [1] http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=12af8a575d1518d40416f83195049157c3a062a5
> [2] http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=369ceec0e4910ba2c37736a59c55c0d6c26433bf
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  .../0001-sna-udev-fstat.patch                      | 57 ++++++++++++++++++++++
>  .../0002-uxa-udev-fstat.patch                      | 27 ++++++++++
>  .../xdriver_xf86-video-intel.mk                    |  1 +
>  3 files changed, 85 insertions(+)
>  create mode 100644 package/x11r7/xdriver_xf86-video-intel/0001-sna-udev-fstat.patch
>  create mode 100644 package/x11r7/xdriver_xf86-video-intel/0002-uxa-udev-fstat.patch

Applied with a few tweaks:

    [Thomas:
     - add upstream link to the git commits in the patches themselves
     - add James SoB line inside the patches themselves
     - add a comment above AUTORECONF = YES to indicate why it was added]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
