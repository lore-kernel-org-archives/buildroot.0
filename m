From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 11:31:59 +0200
Subject: [Buildroot] [PATCHv4] Makefile: fix performance regression
 casued by the umask handling
In-Reply-To: <1437085987-4512-1-git-send-email-yann.morin.1998@free.fr>
References: <1437085987-4512-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150718113159.4c8da6ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 17 Jul 2015 00:33:07 +0200, Yann E. MORIN wrote:
> From: Guido Mart?nez <guido@vanguardiasur.com.ar>
> 
> Commit bee5745c introduced an extra level of 'make' when the umask is
> different from 0022. However, when several targets were specified on
> the command line, a new make instance would be called for each target.
> This introduces a huge performance overhead when many targets are
> specified on the command line.
> 
> To fix this, use the same approach as used in the mkmakefile script:
> an addition target on which the MAKECMDGOALS depend, so that this
> target is run only once.
> 
> Note that the mkmakefile script contains a special exception for
> Makefile, because the Makefile in the output directory is generated.
> Since the top-level Makefile is not generated, this exception is not
> needed here.
> 
> While we're at it, also fix the whitespace in the UMASK assignment.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [yann.morin.1998 at free.fr: aggregate patches from Arnout and Guido]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Changes v0 -> v4:
>   - aggregate Arnout's and Guido's patches together, keepign the best of
>     both patches
>   - fix the spaces in UMASK assignment
> ---
>  Makefile | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
