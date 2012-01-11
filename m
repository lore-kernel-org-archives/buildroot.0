From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 15:51:16 +0100
Subject: [Buildroot] [PATCH 1/2] unionfs: new package
In-Reply-To: <1326291119-24184-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Jan 2012 11:11:58 -0300")
References: <1326291119-24184-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ty429tsr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add the unionfs FUSE unification filesystem.
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/Config.in                         |    1 +
 Gustavo>  package/unionfs/Config.in                 |   12 ++++++++++++
 Gustavo>  package/unionfs/unionfs-make-mandir.patch |   15 +++++++++++++++
 Gustavo>  package/unionfs/unionfs.mk                |   20 ++++++++++++++++++++
 Gustavo>  4 files changed, 48 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/unionfs/Config.in
 Gustavo>  create mode 100644 package/unionfs/unionfs-make-mandir.patch
 Gustavo>  create mode 100644 package/unionfs/unionfs.mk

 Gustavo> diff --git a/package/Config.in b/package/Config.in
 Gustavo> index 6c8a9ed..5016dc7 100644
 Gustavo> --- a/package/Config.in
 Gustavo> +++ b/package/Config.in
 Gustavo> @@ -212,6 +212,7 @@ source "package/sysstat/Config.in"
 Gustavo>  source "package/ti-utils/Config.in"
 Gustavo>  source "package/uboot-tools/Config.in"
 Gustavo>  source "package/udev/Config.in"
 Gustavo> +source "package/unionfs/Config.in"
 Gustavo>  source "package/usb_modeswitch/Config.in"
 Gustavo>  source "package/usbmount/Config.in"
 Gustavo>  source "package/usbutils/Config.in"
 Gustavo> diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..0c330c9
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/unionfs/Config.in
 Gustavo> @@ -0,0 +1,12 @@
 Gustavo> +config BR2_PACKAGE_UNIONFS
 Gustavo> +	bool "unionfs (FUSE)"
 Gustavo> +	select BR2_PACKAGE_LIBFUSE
 Gustavo> +	depends on BR2_LARGEFILE
 Gustavo> +	help
 Gustavo> +	  

This line shouldn't be here.

 Gustavo> +	  A userspace unionfs implementation.
 Gustavo> +
 Gustavo> +	  http://http://podgorny.cz/moin/UnionFsFuse

And a http:// too many.

Other than that it looks good, committed - Thanks.

-- 
Bye, Peter Korsgaard
