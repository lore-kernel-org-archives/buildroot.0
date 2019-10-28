From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:41:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: fix libftdi support
In-Reply-To: <20191028112411.18817-1-fontaine.fabrice@gmail.com>
References: <20191028112411.18817-1-fontaine.fabrice@gmail.com>
Message-ID: <46976404-702a-be20-d8a0-02ac0272b534@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 12:24, Fabrice Fontaine wrote:
> libsigrok optionally depends on libftdi1 not libftdi
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/ec1f9f57944139b24738c1be529c4fc4b128a516
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks, with an extended commit log based on the explanation
you gave by mail.

 Regards,
 Arnout

> ---
>  package/libsigrok/libsigrok.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
> index c65d63eb2a..aa79191e94 100644
> --- a/package/libsigrok/libsigrok.mk
> +++ b/package/libsigrok/libsigrok.mk
> @@ -19,9 +19,9 @@ else
>  LIBSIGROK_CONF_OPTS += --without-libserialport
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBFTDI),y)
> +ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
>  LIBSIGROK_CONF_OPTS += --with-libftdi
> -LIBSIGROK_DEPENDENCIES += libftdi
> +LIBSIGROK_DEPENDENCIES += libftdi1
>  else
>  LIBSIGROK_CONF_OPTS += --without-libftdi
>  endif
> 
