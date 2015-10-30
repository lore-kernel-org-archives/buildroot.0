From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 30 Oct 2015 11:27:06 +0100
Subject: [Buildroot] [PATCH 3/4] libfslparser: add install hooks to fix
	libraries path
In-Reply-To: <1446149212-12048-4-git-send-email-gary.bisson@boundarydevices.com>
References: <1446149212-12048-1-git-send-email-gary.bisson@boundarydevices.com>
 <1446149212-12048-4-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <2787793.hk6j5KppJf@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Garry,

On Thursday 29 October 2015 21:06:51 Gary Bisson wrote:
[...]
> b/package/libfslparser/libfslparser.mk index 2b53d62..aa02f19 100644
> --- a/package/libfslparser/libfslparser.mk
> +++ b/package/libfslparser/libfslparser.mk
> @@ -20,4 +20,12 @@ endef
> # The Makefile installs several versions of the libraries, but we only 
> # need one of them, depending on the platform.
> 
> +# no need to symlink in target image, just move libraries around
> +define LIBFSLPARSER_FIXUP_TARGET_PATH
> +	find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \ 
> +		-exec mv {} $(TARGET_DIR)/usr/lib \;
> +	rm -fr $(TARGET_DIR)/usr/lib/imx-mm
> +endef
> +LIBFSLPARSER_POST_INSTALL_TARGET_HOOKS += LIBFSLPARSER_FIXUP_TARGET_PATH 
A POST_INSTALL_STAGING_HOOKS is not necessary for libfslparser?


Regards,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
