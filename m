From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:52:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/patchelf: Pull in upstream
 bugfixes
In-Reply-To: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
References: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
Message-ID: <20201014235220.3f64ed33@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 Oct 2020 13:50:34 -0500
Conrad Ratschan <conrad.ratschan@rockwellcollins.com> wrote:

> On Buildroot 2020.02.6 when building iputils for powerpc with
> BR2_PIC_PIE enabled, the arping/rdisc/tftpd binaries will segfault at
> runtime. This can be traced back to a few bugs in patchelf corrupting
> the ELFs when resizing the RPATH to replace "$ORIGIN/" with "/usr/sbin".
> 
> This patch pulls in upstream fixes to prevent the binaries from being
> needlessly inflated, prevent the startPage from always being adjusted,
> fix a few minor bugs, and fix incorrect endianness handling.
> 
> Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
> ---
>  ...file-sizes-needlessly-and-allow-bina.patch | 176 ++++++++++++++++++
>  ...ry-corruption-when-rerunning-patchel.patch |  55 ++++++
>  .../0007-fix-adjusting-startPage.patch        |  45 +++++
>  ...stead-of-sh_addr-when-checking-alrea.patch |  38 ++++
>  ...ignoring-the-first-section-header-wh.patch |  41 ++++
>  ...ix-endianness-issues-for-powerpc-PIE.patch |  80 ++++++++
>  6 files changed, 435 insertions(+)
>  create mode 100644 package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch
>  create mode 100644 package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch
>  create mode 100644 package/patchelf/0007-fix-adjusting-startPage.patch
>  create mode 100644 package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch
>  create mode 100644 package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch
>  create mode 100644 package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
