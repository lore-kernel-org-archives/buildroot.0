From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Aug 2015 16:09:37 +0100
Subject: [Buildroot] [PATCH 1/1] gnuradio: stat.h is need for mode_t
In-Reply-To: <1440773264-14999-1-git-send-email-gwenj@trabucayre.com>
References: <1440773264-14999-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <55E079B1.80305@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On 08/28/2015 03:47 PM, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fix :
> http://autobuild.buildroot.net/results/8e3/8e3afd5f22312f0660f631fdb82bbb64eda913fb/build-end.log
> 
> error: 'mode_t' has not been declared
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gnuradio/0002-stat_t-is-need-for-mode_t.patch | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/gnuradio/0002-stat_t-is-need-for-mode_t.patch
> 
> diff --git a/package/gnuradio/0002-stat_t-is-need-for-mode_t.patch b/package/gnuradio/0002-stat_t-is-need-for-mode_t.patch
> new file mode 100644
> index 0000000..391a12f
> --- /dev/null
> +++ b/package/gnuradio/0002-stat_t-is-need-for-mode_t.patch
> @@ -0,0 +1,13 @@
> +Index: gnuradio-3.7.5/gnuradio-runtime/include/gnuradio/logger.h.in
> +===================================================================
> +--- gnuradio-3.7.5.orig/gnuradio-runtime/include/gnuradio/logger.h.in
> ++++ gnuradio-3.7.5/gnuradio-runtime/include/gnuradio/logger.h.in
> +@@ -44,6 +44,8 @@
> + 
> + #ifdef _MSC_VER
> + typedef unsigned short mode_t;
> ++#else
> ++#include <sys/stat.h>
> + #endif
> + 
> + #include <gnuradio/api.h>
> 

I cannot see that change upstream, so I will assume that you haven't
backported this patch from it:

http://gnuradio.org/redmine/projects/gnuradio/repository/revisions/master/entry/gnuradio-runtime/include/gnuradio/logger.h.in

Have you tried to submit it your patch upstream? It would be nice if the
upstream package is fixed as well, so we can just backport the patch
from it, or even better, bump our version to one which has that problem
fixed.

Regards,

Vincent.
