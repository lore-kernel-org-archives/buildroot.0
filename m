From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 14 Dec 2013 10:11:59 +0100
Subject: [Buildroot] [PATCH] Add feature removal schedule for deprecated
	features
In-Reply-To: <5eaf52702905558552aa.1386709471@argentina>
References: <5eaf52702905558552aa.1386709471@argentina>
Message-ID: <CAAXf6LWC-U0C9Qm1OAPWvyOJE6MFyees95mAs7yBY8iOQePU3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 10, 2013 at 10:04 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> This patch adds a new file feature-removal-schedule.txt that lists the
> deprecated features in buildroot, and from when they can be removed.
>
> The guideline used is that a deprecated feature will remain available for
> four buildroot releases before it can be removed. For example if a feature
> is deprecated in the context of 2013.05, it is still available in 2013.05,
> 2013.08, 2013.11 and 2014.02. It can then be removed from 2014.05 onwards.
>
> When additional config options are deprecated (for example kernel headers,
> packages, ...) they should be added to the list. When deprecated items are
> removed, they should be removed from the list.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  docs/manual/appendix.txt     |   6 +++-
>  feature-removal-schedule.txt |  52 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 1 deletions(-)
>
>
> This guideline, and the initial list of deprecated features with the date
> they were deprecated, was taken from Arnout Vandecappelle's input in [1]
> (thanks!). The list was updated with the deprecated mips architectures.
>
> [1] http://lists.busybox.net/pipermail/buildroot/2013-November/083024.html
>
> diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
> --- a/docs/manual/appendix.txt
> +++ b/docs/manual/appendix.txt
> @@ -29,6 +29,10 @@ Deprecated features
>  -------------------
>
>  The following features are marked as _deprecated_ in Buildroot due to
> -their status either too old or unmaintained.
> +them being either too old or unmaintained. They will be removed at
> +some point (no earlier than a year after deprecation) so you should
> +stop using them. Refer to file +feature-removal-schedule.txt+
> +in the Buildroot sources for an indication of when these features can
> +be removed.
>
>  include::deprecated-list.txt[]
> diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
> new file mode 100644
> --- /dev/null
> +++ b/feature-removal-schedule.txt
> @@ -0,0 +1,52 @@
> +This file contains a list of deprecated features/packages in buildroot, and when
> +they were deprecated. In general, deprecated features will remain available for
> +at least four buildroot releases (one year). After this time, no guarantees are
> +made.
> +
> +Note that several features/packages have been deprecated for a long time and
> +should have been removed right now. Expect this to be corrected soon.
> +
> +
> +To be removed in 2011.05:
> +BR2_PACKAGE_SQUASHFS3
> +BR2_TARGET_ROOTFS_SQUASHFS3
> +
> +To be removed in 2011.11:
> +BR2_PACKAGE_LZMA
> +
> +To be removed in 2013.05:
> +BR2_PACKAGE_TTCP
> +
> +To be removed in 2013.11:
> +BR2_HAVE_DOCUMENTATION
> +BR2_PACKAGE_PKG_CONFIG
> +BR2_PACKAGE_NETKITBASE
> +BR2_PACKAGE_NETKITTELNET
> +BR2_PACKAGE_AUTOCONF
> +BR2_PACKAGE_AUTOMAKE
> +
> +To be removed in 2014.02:
> +BR2_KERNEL_HEADERS_3_1
> +BR2_KERNEL_HEADERS_3_3
> +BR2_KERNEL_HEADERS_3_5
> +BR2_PACKAGE_CCACHE
> +BR2_PACKAGE_XSTROKE
> +BR2_GDB_VERSION_7_2
> +BR2_GDB_VERSION_7_3
> +
> +To be removed in 2014.05:
> +BR2_KERNEL_HEADERS_3_6
> +BR2_KERNEL_HEADERS_3_7
> +BR2_PACKAGE_VALA
> +
> +To be removed in 2014.08:
> +BR2_KERNEL_HEADERS_3_8
> +
> +To be removed in 2014.11:
> +BR2_KERNEL_HEADERS_3_9
> +BR2_INSTALL_FORTRAN
> +BR2_INSTALL_OBJC
> +BR2_mips_1
> +BR2_mips_2
> +BR2_mips_3
> +BR2_mips_4

ping?
