From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 10:04:03 +0200
Subject: [Buildroot] [PATCH v2] package/librtlsdr: bump to last commit
In-Reply-To: <20200727163039.15873-1-gwenj@trabucayre.com>
References: <20200727163039.15873-1-gwenj@trabucayre.com>
Message-ID: <20200806100403.44f021e5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jul 2020 18:30:39 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Last official release is 2 years ago.
> 
> Current master branch provides fixes and improvements:
> - fix crash with usbfs mmap with usb controler has no DMA support and kernel < 5.6 [1].
> - better SDR dongle configuration
> 
> This patch:
> - bump librtlsdr to d794155ba65796a76cd0a436f9709f4601509320 (2020/03/18)
> - adapt 0001-disable_shared_library_target_in_build.patch
>   (http://lists.osmocom.org/pipermail/osmocom-sdr/2020-May/002075.html)
> - add option to enable/disable zerocopy buffer on non arm platform
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/core?h=v5.8-rc3&id=a0e710a7def471b8eb779ff551fc27701da49599
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
> - update BR2_PACKAGE_LIBRTLSDR_ZEROCOPY option. Now it's enabled by default.
> - Message updated to inform about potential crash.
> ---
>  ...sable_shared_library_target_in_build.patch | 94 ++++++++++++-------
>  package/librtlsdr/Config.in                   |  8 ++
>  package/librtlsdr/librtlsdr.hash              |  2 +-
>  package/librtlsdr/librtlsdr.mk                |  8 +-
>  4 files changed, 75 insertions(+), 37 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
