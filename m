From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:15:32 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-28
In-Reply-To: <CA+BsyQ7SgoOs4GT0AFrqbdc+DWLG2+CyMA6EN+Oqbob1LR9OoQ@mail.gmail.com>
References: <20151129073018.04C72101FF6@stock.ovh.net>
 <1448791721.2011.9.camel@embedded.rocks>
 <20151129150031.5f26aeba@free-electrons.com>
 <CA+BsyQ7SgoOs4GT0AFrqbdc+DWLG2+CyMA6EN+Oqbob1LR9OoQ@mail.gmail.com>
Message-ID: <20151129151532.4d11d3b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Sun, 29 Nov 2015 14:06:01 +0000, Brendan Heading wrote:
> >  1/ We have two patches in package/arptables/ that were meant to fix
> >     the build of arptables with musl, so we should get rid of them. Or
> >     instead, you can contact Brendan Heading
> >     <brendanheading@gmail.com>, who did commit
> >     61fe902bacaca7c5fdcc7d3a68ded95a835fe2e1, which was supposed to
> >     make arptables build properly with musl. Brendan ?
> 
> Hmm, I'm wondering why the problem is showing up again. I will see if
> I can reproduce it.

It is easily reproducible with:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_EABIHF=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ARPTABLES=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
