From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:45:26 +0100
Subject: [Buildroot] [PATCH] openblas: disable OpenMP
In-Reply-To: <20161120160441.29150-1-arnout@mind.be>
References: <20161120160441.29150-1-arnout@mind.be>
Message-ID: <20161121214526.77f04e5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 17:04:41 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> For powerpc (and powerpc only), the openblas build system will enable
> USE_OPENMP when threads are enabled. But the toolchain wasn't
> necessarily built with OpenMP support. So explicitly disable OpenMP -
> for all architectures, not just powerpc, just to keep things simple.
> 
> We could have autodetected whether OpenMP is available at configure
> time, but that would be more of a feature patch, it's up to upstream
> to do that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/423b5e79cd4342d6c160ed478054b294b0826c6a
> http://autobuild.buildroot.net/results/c9e554c8f880b49b3c9203725ac5e6565b7e5c6f
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/openblas/openblas.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
