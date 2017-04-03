From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 21:19:54 +0200
Subject: [Buildroot] [PATCH v2] uhttpd: fix TCP_FASTOPEN related compile
 error
In-Reply-To: <20170403172908.10642-1-ps.report@gmx.net>
References: <20170403172908.10642-1-ps.report@gmx.net>
Message-ID: <20170403211954.34d4ab7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Apr 2017 19:29:08 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   .../uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82/listen.c: In function 'uh_setup_listeners':
>   .../uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82/listen.c:120:30: error: 'TCP_FASTOPEN' undeclared (first use in this function)
> 
> [1] http://autobuild.buildroot.net/results/56e/56e0727ccd1255b05e03d1b79dc238bd88701230
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - use conditional define for TCP_FASTOPEN (Baruch Siach, Thomas Petazzoni)
>   - fix subject typo (Thomas Petazzoni)
> ---
>  ...02-Fix-TCP_FASTOPEN-related-compile-error.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch

Applied to master, thanks. Baruch: I read your comment about whether
the #ifndef TCP_FASTOPEN...#endif should be inside a #ifdef
linux...#endif condition or not. I believe there are arguments both
ways, so I'm not sure it's really worth to bikeshed on this too much.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
