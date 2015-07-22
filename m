From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 22:52:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix unmet direct
 dependency
In-Reply-To: <1437428858-31045-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437428858-31045-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150722225235.5bf6cac4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 20 Jul 2015 23:47:38 +0200, J?rg Krause wrote:
> Commit 182520a8af734c735c4dbdff29dc07af1d615a0a adds rpcbind as a dependency
> without properly caring for the thread dependency.
> 
> rpcbind adds libtirpc as a dependendency which fails:
>   fatal error: pthread.h: No such file or directory
> 
> Since we probably don't care much about using nfs-utils in a non-threaded
> scenario, we simply disable nfs-utils for toolchains without thread support.
> 
> Fixes:
> http://autobuild.buildroot.net/results/803/80321de8d4c6c0a00439b07289a5818962128b43/
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/nfs-utils/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
