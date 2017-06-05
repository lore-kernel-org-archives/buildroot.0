From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:51:01 +0200
Subject: [Buildroot] [PATCH] package/doxygen: bump to 1.8.13
In-Reply-To: <20170604201642.28799-1-romain.naour@gmail.com>
References: <20170604201642.28799-1-romain.naour@gmail.com>
Message-ID: <20170605115101.63e3c92a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 22:16:42 +0200, Romain Naour wrote:
> The version 1.8.9.1 of Doxygen doesn't support flex >= 2.5.33, so bump
> to 1.8.13 and switch to CMake build system.
> 
> Also backport an upstream patch fixing a segfault in xmlgen [1].
> 
> [1] https://github.com/doxygen/doxygen/pull/555
> 
> Fixes:
> http://autobuild.buildroot.net/results/43d/43de5eb7282ec8283ad2744309b91addf7cce0d3
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  ...1.8.13-Regression-Segfault-building-the-b.patch | 30 ++++++++++++++++++++++
>  package/doxygen/doxygen.hash                       |  2 +-
>  package/doxygen/doxygen.mk                         | 19 ++------------
>  3 files changed, 33 insertions(+), 18 deletions(-)
>  create mode 100644 package/doxygen/0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch

Since I've applied Bernd's patch first, I have reworked your patch to
only add the patch fixing the segfault, and dropped the other changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
