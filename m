From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:26:01 +0100
Subject: [Buildroot] [PATCH master] net-tools: fix field with incomplete
 type error
In-Reply-To: <20161107151814.48924-1-Vincent.Riera@imgtec.com>
References: <20161107151814.48924-1-Vincent.Riera@imgtec.com>
Message-ID: <20161107222601.3527fcff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 Nov 2016 15:18:14 +0000, Vicente Olivert Riera wrote:
> Update 0002 patch to match the one sent as a pull request. The previous
> one introduced a new problem that has been addressed in the new version.
> 
> Some Linux headers included in certain toolchains may not have an
> updated linux/if_tunnel.h which includes linux/ip.h, so we need to
> include it unconditionally otherwise linux/if_tunnel.h will use the
> struct iphdr before being defined and the compilation will fail in this
> way:
> 
> In file included from iptunnel.c:33:0:
> /usr/include/linux/if_tunnel.h:37:16: error: field 'iph' has incomplete
> type
>   struct iphdr  iph;
>                   ^
> 
> Pull request URL:
>   https://sourceforge.net/p/net-tools/code/merge-requests/4/
> 
> Fixes:
>   http://autobuild.buildroot.net/results/34f/34f9b10ef6a613057e8f6457d8a0a2fa142ad123/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...02-iptunnel.c-do-not-include-netinet-ip.h.patch | 30 +++++++++++++++++-----
>  1 file changed, 24 insertions(+), 6 deletions(-)

Applied to master, thanks. However, note that this package still fails
to build with musl, even with this patch applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
