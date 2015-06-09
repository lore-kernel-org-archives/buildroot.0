From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 09:01:19 +0200
Subject: [Buildroot] [PATCH 1/2] gflags: new package
In-Reply-To: <1433831250-31968-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1433831250-31968-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1433831250-31968-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20150609090119.1523b5f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

Thanks for this contribution. A few comments below.

On Tue, 9 Jun 2015 11:57:29 +0530, Rahul Bedarkar wrote:

> diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
> new file mode 100644
> index 0000000..9c8b27a
> --- /dev/null
> +++ b/package/gflags/gflags.hash
> @@ -0,0 +1,2 @@
> +# No hash for v2.1.2, comes from the github-helper:
> +none	xxx	gflags-v2.1.2.tar.gz

I believe in this case, we generally do not provide a hash file at all.
Though maybe in the future we will want to have a hash file for *all*
packages. Yann, what is our policy on this?

> +GFLAGS_VERSION = v2.1.2
> +GFLAGS_SITE = $(call github,gflags,gflags,$(GFLAGS_VERSION))
> +GFLAGS_INSTALL_STAGING = YES
> +GFLAGS_LICENSE = BSD-3c
> +GFLAGS_LICENSE_FILES = COPYING.txt
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),n)

This should be:

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
