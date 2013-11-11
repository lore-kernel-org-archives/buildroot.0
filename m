From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Nov 2013 17:47:49 +0200
Subject: [Buildroot] [PATCH] libqmi: fix autobuild failures
In-Reply-To: <1384184627-8102-1-git-send-email-spdawson@gmail.com>
References: <1384184627-8102-1-git-send-email-spdawson@gmail.com>
Message-ID: <20131111154749.GT4581@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Mon, Nov 11, 2013 at 03:43:47PM +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> The libqmi build specifies -Werror in the CFLAGS by default. This causes
> build failures such as the following.
> 
>   http://autobuild.buildroot.net/results/070/070449299aa9025c4bc6769524a6e22d66c92a65/
> 
> The -Werror flag can be disabled using a configuration switch.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/libqmi/libqmi.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 911b1a7..8bd4577 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -13,4 +13,6 @@ LIBQMI_INSTALL_STAGING = YES
>  
>  LIBQMI_DEPENDENCIES = libglib2
>  
> +LIBQMI_CONF_OPT = --enable-more-warnings=yes

A comment would be nice. Something like:

# Disable -Werror

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
