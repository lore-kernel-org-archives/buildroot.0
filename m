From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 16:21:18 +0200
Subject: [Buildroot] [PATCHv2] core: distclean is a noconfig target
In-Reply-To: <1473602146-2675-1-git-send-email-yann.morin.1998@free.fr>
References: <1473602146-2675-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160917162118.6b04b97d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 15:55:46 +0200, Yann E. MORIN wrote:
> When the .config contains invalid configuration *(e.g. two providers for
> a same virtual package), it is not possible to run "make distclean"
> because the .config file is sourced and packages interpreted in this
> case.
> 
> Add distclean to the noconfig list, so that we can run it in all cases.
> 
> However, this meand that DL_DIR is no longer set, and thus the default
> download location never removed. We fix that by always removing the
> download location, so that if it is the one configured we still remove
> it (no change) and if it is not the one configured, we remove an
> non-existing location and leave the user's location intact (no change
> either).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v1 -> v2:
>   - don't forget to remove the default download location  (Thomas)
>   - typoes  (Thomas)
> ---
>  Makefile | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
