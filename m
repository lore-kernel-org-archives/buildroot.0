From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:39:50 +0100
Subject: [Buildroot] [PATCH] perl-gd: fix build of native part
In-Reply-To: <1487144532-1818-1-git-send-email-francois.perrad@gadz.org>
References: <1487144532-1818-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20170215223950.3432ecaf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 08:42:12 +0100, Francois Perrad wrote:
> EUMM don't find .xs file in subdirectory (only .pm files are handled)
> So, let move lib/GD.xs in the root directory.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

What is this fixing?

Here, the following defconfig builds just fine:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_PERL=y
BR2_PACKAGE_PERL_GD=y
# BR2_TARGET_ROOTFS_TAR is not set

Is it just that the build succeeds, but it fails at runtime because the
native part has been built/installed ?

Isn't moving GD.xs a dirty hack ? How was it working before ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
