From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 09:27:20 +0100
Subject: [Buildroot] [PATCH v2] libnspr: Add dependency on !BR2_xtensa
In-Reply-To: <d1411c9410eaa1ebe9389cb5c20f4209b96a041f.1385530164.git.baruch@tkos.co.il>
References: <d1411c9410eaa1ebe9389cb5c20f4209b96a041f.1385530164.git.baruch@tkos.co.il>
Message-ID: <20131127092720.77f97fd0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 27 Nov 2013 07:29:24 +0200, Baruch Siach wrote:
> From: Chris Zankel <chris@zankel.net>
> 
> Xtensa is not yet supported in libnspr. Also add dependencies to
> libnss, which requires libnspr, and ecryptfs-utils, which requires
> libnss.
> 
> Fixes
> http://autobuild.buildroot.net/results/14b/14ba6426edbffa100de924aa69157b3f59368ff2/
> 
> [baruch: fix summary, add autobuild referench, add comment dependency]
> 
> Signed-off-by: Chris Zankel <chris@zankel.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks! However, I wonder if it's not actually easier to include a
patch to libnspr to add Xtensa support. See
http://patchwork.ozlabs.org/patch/291080/ for a patch that adds NIOS2
support, for example.

That being said, I'm fine with having libnspr disabled on Xtensa, as I
don't believe that many people will care about
libnspr/libnss/ecryptfs-utils.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
