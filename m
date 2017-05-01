From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 21:27:07 +0200
Subject: [Buildroot] [PATCH 1/1] libcsv: new package
In-Reply-To: <1493660240-45710-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1493660240-45710-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170501212707.2729be64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution, see some comments below.

On Mon,  1 May 2017 12:37:20 -0500, Matt Weber wrote:

>  package/Config.in          |  1 +
>  package/libcsv/Config.in   | 10 ++++++++++
>  package/libcsv/libcsv.hash |  2 ++
>  package/libcsv/libcsv.mk   | 15 +++++++++++++++

Please add an entry to the DEVELOPERS file.

> +LIBCSV_VERSION = 3.0.3
> +LIBCSV_SITE = http://sourceforge.net/projects/libcsv/files
> +LIBCSV_SOURCE = libcsv-$(LIBCSV_VERSION).tar.gz

Not needed, this is the default value.

> +LIBCSV_LICENSE = LGPLv2.1+

Please use the SPDX license code: LGPL-2.1+

> +LIBCSV_LICENSE_FILES = COPYING.LESSER
> +LIBCSV_INSTALL_STAGING = YES
> +
> +$(eval $(host-autotools-package))

Why are you adding a host package ? If you don't intend to use it as a
dependency for another package or don't have a good reason to have a
host package, please don't add a host variant.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
