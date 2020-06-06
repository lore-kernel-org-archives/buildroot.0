From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 22:15:52 +0200
Subject: [Buildroot] [PATCH] package/libxml2: remove helper script from
 target
In-Reply-To: <20200605225719.13836-1-nolange79@gmail.com>
References: <20200605225719.13836-1-nolange79@gmail.com>
Message-ID: <20200606221552.2cb93d51@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 00:57:18 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/libxml2/libxml2.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index ea6a8c1f6d..a0efe041a5 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -49,6 +49,12 @@ else
>  LIBXML2_CONF_OPTS += --without-iconv
>  endif
>  
> +define LIBXML2_INSTALL_TARGET_POST

LIBXML2_INSTALL_TARGET_POST is really not a great name: we want a name
that is more descriptive of what the hook is doing. So I renamed to
LIBXML2_CLEANUP_XML2CONF, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
