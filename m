From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 14:01:41 +0200
Subject: [Buildroot] [PATCH v2] libdrm: disable drivers for sparcv8
In-Reply-To: <20160119070304.GA27854@waldemar-brodkorb.de>
References: <20160119070304.GA27854@waldemar-brodkorb.de>
Message-ID: <20160526140141.576b1bb1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jan 2016 08:03:04 +0100, Waldemar Brodkorb wrote:
> The drivers use atomic ops as CAS, which fails
> to compile for sparcv8, but works fine for leon3.
> 
> Fixes following autobuild error:
> http://autobuild.buildroot.net/results/fa0ac44d3c7953b2e2afa03cd7570d8a5d49fcc4/
> 
> Disable all sub packages using the DRM drivers.
> 
> As SPARC systems normally have SBUS graphic cards and I think nobody
> cares about 3D graphics on these machines, all gallium drivers
> are disabled for simplification, even if swrast might be used.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've sent what I believe is a better patch, which makes libdrm drivers
build on SPARCv8 using libatomic_ops. See
http://patchwork.ozlabs.org/patch/626636/.

I've marked your previous patch as Superseded.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
