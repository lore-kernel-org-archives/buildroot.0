From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 10:08:15 +0100
Subject: [Buildroot] [PATCH v2] libnspr: Add dependency on !BR2_xtensa
In-Reply-To: <20131127090215.GX32436@tarshish>
References: <d1411c9410eaa1ebe9389cb5c20f4209b96a041f.1385530164.git.baruch@tkos.co.il>
 <20131127092720.77f97fd0@skate> <20131127090215.GX32436@tarshish>
Message-ID: <20131127100815.040fe17a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 27 Nov 2013 11:02:15 +0200, Baruch Siach wrote:

> > Thanks! However, I wonder if it's not actually easier to include a
> > patch to libnspr to add Xtensa support. See
> > http://patchwork.ozlabs.org/patch/291080/ for a patch that adds
> > NIOS2 support, for example.
> 
> That would obviously be better, but I can't properly test a patch
> adding libnspr xtensa support at the moment. Note that xtensa has BE
> and LE variants, so it's a little more involved that the nios patch.
> 
> > That being said, I'm fine with having libnspr disabled on Xtensa,
> > as I don't believe that many people will care about
> > libnspr/libnss/ecryptfs-utils.
> 
> It seems like blackfin needs the same treatment 
> (http://autobuild.buildroot.net/results/dd353703ed94cec48cd126d80cd2f1b039811be4/).

Ok, then maybe we want something similar to what I've done for Qt:
http://git.buildroot.net/buildroot/commit/package/qt?id=01f99d284fd51bd149e7a92d0e9e7fc368cd0e99.
So a BR2_PACKAGE_LIBNSPR_ARCH_SUPPORTED hidden kconfig knob that is
only enabled for those architectures that support nspr. Therefore, when
we need to change which architectures are supported by nspr, we don't
have to go edit all the reverse dependencies of nspr.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
