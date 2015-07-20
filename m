From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 15:31:09 +0200
Subject: [Buildroot] [PATCHv2] core/pkg-generic: host variants inherits
 target's override-srcdir
In-Reply-To: <1437311728-31289-1-git-send-email-yann.morin.1998@free.fr>
References: <1437311728-31289-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150720153109.2b1677bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 19 Jul 2015 15:15:28 +0200, Yann E. MORIN wrote:
> When a package has both a target and a host variants, and there is an
> override-srcdir set for the target variant, the host variant should
> inherit the target's override-srcdir, unless explicitly set, like we do
> for all other target-variant properties.
> 
> However, do not override it if expressly set to empty (i.e. when the
> user wants to override only the target variant).
> 
> Also, as we do for the other variables, the target variant never
> inherits from the host variant.
> 
> Reported-by: Mike <mikez@OpenPlayer.org>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - really do not override the host variant if expressly set to empty
>     (Arnout)
> ---
>  package/pkg-generic.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
