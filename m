From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:19:06 +0200
Subject: [Buildroot] [PATCHv2] core/download: don't be needlessly
 verbose in backends
In-Reply-To: <1437906386-31727-1-git-send-email-yann.morin.1998@free.fr>
References: <1437906386-31727-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150726151906.3b3c0570@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 26 Jul 2015 12:26:26 +0200, Yann E. MORIN wrote:
> In 50c8b7e (support/download: support -q in all download backends), the
> backend were made to respect the quietness of the main Makefile, when -s
> is poassed on the 'make' command line. In doing so, they were all made
> to be verbose by default.
> 
> However, the verbosity of some of the tools, like scp, is very high, and
> is in fact intended for debug purposes.
> 
> Drop being verbose by default, just use whatever each tool deems normal
> output. Only respect the quietness requested by the user.
> 
> Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Change v1 -> v2:
>   - fix all backends, not just scp
> ---
>  support/download/bzr  | 2 +-
>  support/download/cp   | 5 +++++
>  support/download/git  | 2 +-
>  support/download/hg   | 2 +-
>  support/download/scp  | 2 +-
>  support/download/wget | 2 +-
>  6 files changed, 10 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
