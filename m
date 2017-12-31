From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:24:36 +0100
Subject: [Buildroot] [RFCv3 02/15] toolchain: post-pone evaluation of
 TOOLCHAIN_EXTERNAL_BIN
In-Reply-To: <20171201205352.24287-3-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-3-thomas.petazzoni@free-electrons.com>
Message-ID: <20171231182436.5022f74b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 21:53:39 +0100, Thomas Petazzoni wrote:
> The upcoming per-package SDK functionality is heavily based on the
> fact that HOST_DIR, STAGING_DIR and TARGET_DIR are evaluated during
> the configure/build/install steps of the packages. Therefore, any
> evaluation-during-assignment using := is going to cause problems, and
> need to be turned into evaluation-during-use using =.
> 
> This patch fix up one such instance in the external toolchain code.
> 
> This change is independent from the per-package SDK functionality, and
> could be applied separately.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes since v2:
>  - None
> Changes since v1:
>  - Added Arnout Reviewed-by.
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
