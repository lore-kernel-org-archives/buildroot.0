From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:16:16 +0100
Subject: [Buildroot] [PATCHv2] package/libbsd: not available for ARC
In-Reply-To: <20171029170041.13206-1-yann.morin.1998@free.fr>
References: <20171029170041.13206-1-yann.morin.1998@free.fr>
Message-ID: <20171029181616.74c07e10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 18:00:41 +0100, Yann E. MORIN wrote:
> libbsd has explicit, hard-coded checks about the architectures it can
> work on, and ARC is not one of those.
> 
> We did not notice so far, because we only recently added support for
> glibc on ARC (and only for a single variant) in 0633eb58a291 (toolchain:
> add glibc support for ARCv2).
> 
> Add an explicit exclusion on arc.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/603baa77e95620ad1416e0d1dc4202c334801efc
>     http://autobuild.buildroot.org/results/8a2ee5431501615cb150233e6d7bc9e7c3c5c1eb
>     http://autobuild.buildroot.org/results/ea52364f536485ff4e43e3bc37f2175eb6178c5a
>     http://autobuild.buildroot.org/results/32581f7a79372b525e4ad21e029ff0ede743ba94
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v1 -> v2:
>   - fix and simplify dependency !BR2_arc  (Thomas)
>   - enhance commit log  (Thomas)
> ---
>  package/libbsd/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
