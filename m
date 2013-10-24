From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Oct 2013 09:10:17 +0200
Subject: [Buildroot] [PATCH] stress: disable documentation
In-Reply-To: <1382571802-23306-1-git-send-email-arnout@mind.be>
References: <1382571802-23306-1-git-send-email-arnout@mind.be>
Message-ID: <CAAXf6LXmuFppc4473+KC73LZmUjgk4h32p9Lx_6hANKmudRdDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 24, 2013 at 1:43 AM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> It fails to build with my makeinfo version. Note that the autobuilders don't
> see this, probably because they don't have makeinfo installed.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/stress/stress.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/stress/stress.mk b/package/stress/stress.mk
> index 63efb66..b058031 100644
> --- a/package/stress/stress.mk
> +++ b/package/stress/stress.mk
> @@ -17,7 +17,10 @@ STRESS_AUTORECONF = YES
>  #
>  # If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
>  # --disable-static explicitly to get stress linked dynamically.
> +#
> +# Also, disable documentation by undefining makeinfo
>  STRESS_CONF_OPT = \
> -       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
> +       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
> +       MAKEINFO=:

What is the significance of this colon?

Thanks,
Thomas
