From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 21 Mar 2016 12:38:35 +0100
Subject: [Buildroot] [PATCH v4 0/7] Support building a second Barebox
	config (incl. BBB)
In-Reply-To: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
Message-ID: <CAGm1_kt3uK6rVzFvCjWy0rnANPEqrC4GRVFS5NUJzXjp2ddpGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 20, 2016 at 11:35 PM, Pieter Smith <pieter@boesman.nl> wrote:
> This patch-set adds support for building barebox with up to 2 configurations.
> It can be used to build the barebox x-loader or MLO (also called Secondary
> Program Loader) in addition to the standard barebox build (Tertiary Program
> Loader). This implements the design proposed in
> http://elinux.org/Buildroot#Todo_list, with minor adjustments:
> 1. Have boot/barebox/barebox.mk contain the common stuff.
> 2. Add a second package boot/barebox/barebox-2.
> 3. There is only one version selection, but each package allows to
>    define the configuration to be used.
> 4. Design is a little bit like package/gcc, where we have multiple gcc builds,
>    but share a lot of common definitions between the packages.
>
> To demonstrate that it works as advertized, the last patch adds a defconfig for
> the beaglebone that makes use of the added functionality.
>
> Revision history:
> v4: Introduces barebox-package function to reduce duplication and maintenance
>     Simplifies built image selection
>     Ease review with smaller patches
>     Review re-work: Special thanks to Arnout Vandecappelle and Yegor Yefremov
> v3: Updated for master at 544e2c5871f223facd1ab3c2853cd07ad70dd9d1
> v2: Dropped x-loader build specialization in favor of 2 generic barebox builds
> v1: Initial posting
>
> Pieter Smith (7):
>   barebox: support multi-image-build image selection
>   barebox: friendly error on missing built image
>   barebox: support custom barebox output image name
>   barebox: introduce barebox-package function
>   barebox: extract package name argument
>   barebox: support 2nd config build
>   beaglebone: adds barebox bootloader defconfig
>
>  board/beaglebone/barebox.env/boot/sd      |   6 +
>  board/beaglebone/barebox.env/config-board |   4 +
>  boot/barebox/Config.in                    |  18 +++
>  boot/barebox/barebox-2/Config.in          |  79 +++++++++++++
>  boot/barebox/barebox-2/barebox-2.hash     |   1 +
>  boot/barebox/barebox-2/barebox-2.mk       |   9 ++
>  boot/barebox/barebox.mk                   | 178 ++++++++++++++++++------------
>  configs/beaglebone_barebox_defconfig      |  41 +++++++
>  8 files changed, 266 insertions(+), 70 deletions(-)
>  create mode 100644 board/beaglebone/barebox.env/boot/sd
>  create mode 100644 board/beaglebone/barebox.env/config-board
>  create mode 100644 boot/barebox/barebox-2/Config.in
>  create mode 120000 boot/barebox/barebox-2/barebox-2.hash
>  create mode 100644 boot/barebox/barebox-2/barebox-2.mk
>  create mode 100644 configs/beaglebone_barebox_defconfig

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

for the whole series.

Yegor
