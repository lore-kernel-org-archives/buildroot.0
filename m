From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 23:04:02 +0200
Subject: [Buildroot] [PATCH 3/3] package/wvstreams: add argp-standalone
 as optionnal dependency
In-Reply-To: <1430498686-10719-3-git-send-email-romain.naour@openwide.fr>
References: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
 <1430498686-10719-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150501230402.57253929@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri,  1 May 2015 18:44:46 +0200, Romain Naour wrote:
> This ensures the build reproducibility.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/wvstreams/wvstreams.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
> index bc7c5d4..3db317a 100644
> --- a/package/wvstreams/wvstreams.mk
> +++ b/package/wvstreams/wvstreams.mk
> @@ -32,6 +32,11 @@ ifneq ($(BR2_STATIC_LIBS),y)
>  WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
>  endif
>  
> +# wvstreams use argp.h which can be provided by argp-standalone package.
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +WVSTREAMS_DEPENDENCIES += argp-standalone
> +endif

Applied after fixing typos in the commit title and comment.

I wonder if we shouldn't make the argp-standalone package only
available on !glibc builds, since glibc provides its own argp
implementation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
