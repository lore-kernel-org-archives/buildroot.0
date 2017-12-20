From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Dec 2017 16:23:54 +0100
Subject: [Buildroot] [PATCH 1/2] libdrm-armada: new package
In-Reply-To: <20171220150843.21154-2-didin@synopsys.com>
References: <20171220150843.21154-1-didin@synopsys.com>
 <20171220150843.21154-2-didin@synopsys.com>
Message-ID: <20171220162354.21092f36@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(In addition to the comments from Yann).

On Wed, 20 Dec 2017 18:08:42 +0300, Evgeniy Didin wrote:

>  package/Config.in                        |  1 +
>  package/libdrm-armada/Config.in          |  7 +++++++
>  package/libdrm-armada/libdrm-armada.hash |  2 ++
>  package/libdrm-armada/libdrm-armada.mk   | 24 ++++++++++++++++++++++++

Entry in DEVELOPERS file missing.


> +LIBDRM_ARMADA_VERSION = 6b461c

Please use a full Git hash.

> +LIBDRM_ARMADA_SOURCE = libdrm-armada-$(LIBDRM_ARMADA_VERSION).tar.gz
> +LIBDRM_ARMADA_SITE = http://git.arm.linux.org.uk/cgit/libdrm-armada.git
> +LIBDRM_ARMADA_SITE_METHOD = git
> +LIBDRM_ARMADA_DEPENDENCIES = libdrm
> +LIBDRM_ARMADA_INSTALL_STAGING = YES

It is a problem that this package has no license information
whatsoever. No COPYING file, no LICENSE file, no header in the source
file that indicates the license (except for
http://git.arm.linux.org.uk/cgit/libdrm-armada.git/tree/libdrm_lists.h).

Could you ask upstream to add appropriate licensing information ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
