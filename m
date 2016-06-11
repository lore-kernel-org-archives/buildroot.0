From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:03:04 +0200
Subject: [Buildroot] [PATCH v4 1/1] erlang: use erlang's native atomic
 ops
In-Reply-To: <1457569325-32477-1-git-send-email-fhunleth@troodon-software.com>
References: <1457569325-32477-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160611160304.6637b9d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Mar 2016 19:22:05 -0500, Frank Hunleth wrote:
> Now that we're using Erlang 18, the preferred atomic ops implementation
> for Erlang is its own built-in implementation, so use it instead of
> libatomic_ops. BR2_PACKAGE_ERLANG_ARCH_SUPPORTS is added now that
> BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS can no longer be used for
> checking whether the package can be built.
> 
> This fixes autobuilder failures on aarch64 and sparc_v8:
> 
> http://autobuild.buildroot.net/results/0cd/0cd22eb74fa29e5a85bf897762e16ab3daf33962/
> http://autobuild.buildroot.net/results/688278236e6d5bcd63b7d4413303eb115a38f3a7/
> http://autobuild.buildroot.net/results/7875a7425bfe1f43d46c9a1db9f96b54f7a99b19/
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v3->v4:
>   - Majorly simplified patch since libatomic_ops is effectively
>     not used anymore and providing an option seems unnecessary.
>     See comment chain from Arnout Vandecappelle.
>   - Fix line wrapping

Applied to master, thanks. This is indeed much simpler than previous
iterations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
