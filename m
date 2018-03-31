From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 08:20:16 +0200
Subject: [Buildroot] [PATCH 11/36] linux/linux.mk: use namespace for
 internal variables
In-Reply-To: <20180331022301.27501-12-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
 <20180331022301.27501-12-ricardo.martincoski@gmail.com>
Message-ID: <20180331082016.18291f11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this great cleanup series!

On Fri, 30 Mar 2018 23:22:36 -0300, Ricardo Martincoski wrote:
> These three symbols:
> KERNEL_ARCH_PATH
> KERNEL_DTBS
> KERNEL_DTS_NAME
> are defined and used only inside this file, so use the LINUX_ namespace
> for them.

Should we name them just LINUX_ARCH_PATH, LINUX_DTBS and
LINUX_DTS_NAME, instead of LINUX_KERNEL_ARCH_PATH, LINUX_KERNEL_DTBS,
etc. ? This would make them more consistent with the other variables
that already exist: LINUX_VERSION_PROBE, LINUX_IMAGE_NAME, etc.

I.e, the prefix should be just LINUX_ and not LINUX_KERNEL_.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
