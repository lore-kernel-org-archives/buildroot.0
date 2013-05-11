From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 May 2013 11:07:35 +0200
Subject: [Buildroot] [PATCH 1/1] Disable building of cups driver in
 host-gutenprint
In-Reply-To: <1368259049-27252-1-git-send-email-olivier.schonken@gmail.com>
References: <1368259049-27252-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130511110735.36112d4f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sat, 11 May 2013 09:57:29 +0200, Olivier Schonken wrote:
> This should fix http://autobuild.buildroot.org/results/d2e386b50744aeda7257a0b78aafe90ba4da697c/
> Because there is no host-cups package, host-gutenprint cant build the
> host-cups drivers - missing includes and libs.  Host gutenprint only
> built to get the xml. Thus not a loss.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/gutenprint/gutenprint.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
> index 0463771..49816f6 100644
> --- a/package/gutenprint/gutenprint.mk
> +++ b/package/gutenprint/gutenprint.mk
> @@ -29,7 +29,7 @@ GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
>                        --disable-escputil \
>                        --disable-test \
>                        --disable-testpattern \
> -                      --with-cups="/usr" \
> +                      --without-cups \
>                        --with-sysroot="$(STAGING_DIR)" \
>                        --disable-cups-ppds
>  

Hum, in your commit description, you're mentionning "host-cups" does
not exist, so host-gutenprint shouldn't try to build with CUPS support.
But in your patch, you're changing GUTENPRINT_CONF_OPT, i.e the
configuration option of gutenprint for the target.

Could you explain in a few more details the relation between your
commit log and the patch itself?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
