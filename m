From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 3 Aug 2015 23:14:40 +0300
Subject: [Buildroot] [PATCH v2 1/1] dawgdic: new package
In-Reply-To: <1438593363-32653-1-git-send-email-yba@tkos.co.il>
References: <1438593363-32653-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150803201440.GK3345@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Mon, Aug 03, 2015 at 12:16:03PM +0300, Jonathan Ben-Avraham wrote:
> diff --git a/package/dawgdic/dawgdic.mk b/package/dawgdic/dawgdic.mk
> new file mode 100644
> index 0000000..f9b468e
> --- /dev/null
> +++ b/package/dawgdic/dawgdic.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# dawgdic
> +#
> +################################################################################
> +
> +#DAWGDIC_SITE = http://dawgdic.googlecode.com/svn/trunk

Please remove.

> +DAWGDIC_SITE = https://github.com/stil/dawgdic.git
> +DAWGDIC_SITE_METHOD = git
> +DAWGDIC_VERSION = 16ac537ba9883ff01b63b6d1fdc3072150c68fee

Please use the github helper. See 
http://nightly.buildroot.org/manual.html#github-download-url.

> +DAWGDIC_LICENSE = GPLv3
> +DAWGDIC_LICENSE_FILES = COPYING
> +
> +DAWGDIC_AUTORECONF = YES

Why is that needed? Please explain in a comment.

> +DAWGDIC_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
