From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:44:31 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.51
In-Reply-To: <20200312180629.7972-1-giulio.benetti@benettiengineering.com>
References: <20200312180629.7972-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200314154431.3df21f85@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 19:06:29 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Release notes:
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.51_release_notes
> 
> Remove upstreamed patch but add another patch to allow disable Neon
> acceleration while building gcm on Arm32. This patch adds
> NSS_DISABLE_GCM_ARM32_NEON variable that is set to 1 if
> BR2_ARM_CPU_HAS_NEON is not set to y.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> New patch is pending upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1620799
> ---
>  ...heck-if-PPC-__has_include-sys-auxv.h.patch |  51 -------
>  ...Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch | 127 ++++++++++++++++++
>  package/libnss/libnss.hash                    |   4 +-
>  package/libnss/libnss.mk                      |   7 +-
>  4 files changed, 135 insertions(+), 54 deletions(-)
>  delete mode 100644 package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
>  create mode 100644 package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
