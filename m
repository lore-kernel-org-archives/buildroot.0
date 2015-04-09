From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:47:11 +0200
Subject: [Buildroot] [PATCH 2/2] libsigrok: add host-doxygen dependency
 for C++ bindings
In-Reply-To: <1428574743-32177-3-git-send-email-bgolaszewski@baylibre.com>
References: <1428574743-32177-1-git-send-email-bgolaszewski@baylibre.com>
 <1428574743-32177-3-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150409214711.5d9fa8df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Thu,  9 Apr 2015 12:19:03 +0200, Bartosz Golaszewski wrote:
> Doxygen is required to generate xml files required by libsigrokcxx
> build system.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/libsigrok/libsigrok.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
> index 1e6080d..4309480 100644
> --- a/package/libsigrok/libsigrok.mk
> +++ b/package/libsigrok/libsigrok.mk
> @@ -48,7 +48,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
>  LIBSIGROK_CONF_OPTS += --enable-cxx
> -LIBSIGROK_DEPENDENCIES += host-autoconf-archive glibmm
> +LIBSIGROK_DEPENDENCIES += host-autoconf-archive glibmm host-doxygen
>  else
>  LIBSIGROK_CONF_OPTS += --disable-cxx
>  endif

Thanks, but please include in your series a revert of
http://git.buildroot.net/buildroot/commit/?id=41e81b7ae149319950814efe3c39acb1200167d2.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
