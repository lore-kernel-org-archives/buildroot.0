From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 23:14:56 +0200
Subject: [Buildroot] [PATCH 1/3] package/libgeotiff: fix static linking
 with tiff
In-Reply-To: <20191009170325.24709-1-fontaine.fabrice@gmail.com>
References: <20191009170325.24709-1-fontaine.fabrice@gmail.com>
Message-ID: <20191010231456.7250309a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 19:03:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Put back patch that was wrongly removed when bumping libgeotiff to
> version 1.5.1 in commit	1edf0383a6a9d17a27d831bb02833870655d43d9
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3eb3d41d3288c08616b68d52fdc7525c57c8e023
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...Use-pkg-config-for-libtiff-detection.patch | 49 +++++++++++++++++++
>  package/libgeotiff/libgeotiff.mk              |  2 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 package/libgeotiff/0001-Use-pkg-config-for-libtiff-detection.patch

Series applied, thanks. In PATCH 2/3, the solution to add -lstdc++ is
not great, as we really hardcode something that is quite internal to
the toolchain, but there's no other easy way to solve this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
