From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2015 10:37:21 +0200
Subject: [Buildroot] [PATCH 1/1] powerpc: disable binutils 2.24 for
 little endian
In-Reply-To: <23a478891368b4f2ac37e747f55075c6c563efc3.1435886550.git.sam.bobroff@au1.ibm.com>
References: <23a478891368b4f2ac37e747f55075c6c563efc3.1435886550.git.sam.bobroff@au1.ibm.com>
Message-ID: <20150703103721.46844f04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sam Bobroff,

On Fri,  3 Jul 2015 11:22:34 +1000, Sam Bobroff wrote:
> Binutils 2.24 produces broken code when compiling the kernel for
> ppc64le, so prevent this combination. See:
> 
> https://sourceware.org/ml/binutils/2013-12/msg00200.html
> 
> The problem manifests early in the boot process with "Kernel access of
> bad area, sig: 11" in arch_match_cpu_phys_id().
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---

Applied, thanks. I've only added a small indication in the commit log:
the upstream binutils fix, and clearly said it was available since
binutils 2.25.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
