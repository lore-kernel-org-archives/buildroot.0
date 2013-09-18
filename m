From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 07:18:54 +0200
Subject: [Buildroot] [PATCH v2 15/17] pcre: Add host build support
In-Reply-To: <1378936777-28308-16-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-16-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130918071854.3ca69edf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 11 Sep 2013 16:59:35 -0500, Clayton Shotwell wrote:
> 
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
> Changes v1 -> v2:
>   - No changes
> 
>  package/pcre/pcre.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
> index bf86a3d..1b59dbc 100644
> --- a/package/pcre/pcre.mk
> +++ b/package/pcre/pcre.mk
> @@ -21,3 +21,4 @@ PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
>  PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

This comment applies to patches 15, 16 and 17. Since the host variant
of those packages are used by earlier patches in your series, then
these patches should appear before they are used. Otherwise, your
patch series is not bisectable.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
