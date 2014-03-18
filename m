From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Mar 2014 23:28:03 +0100
Subject: [Buildroot] [PATCH] pkg-perl: prevents the interactive prompts
In-Reply-To: <1395169199-31890-1-git-send-email-francois.perrad@gadz.org>
References: <1395169199-31890-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140318232803.361f7abf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue, 18 Mar 2014 19:59:59 +0100, Francois Perrad wrote:
> during configure and build steps of Perl/CPAN package.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-perl.mk |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> index fdf1580..b5fada1 100644
> --- a/package/pkg-perl.mk
> +++ b/package/pkg-perl.mk
> @@ -19,6 +19,9 @@
>  #
>  ################################################################################
>  
> +# prevents the interactive prompts
> +export PERL_MM_USE_DEFAULT=1

Instead of exporting globally this variable, I believe I would prefer
to see it passed only in the configure and build steps of the
appropriate package infrastructure, passed explicitly. Like what we do
for all autoconf arguments and environment variables, for example.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
