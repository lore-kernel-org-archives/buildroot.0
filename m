From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Dec 2015 11:11:50 +0000
Subject: [Buildroot] [PATCH v1] edid-decode: new package
In-Reply-To: <1449522884-8290-1-git-send-email-ps.report@gmx.net>
References: <1449522884-8290-1-git-send-email-ps.report@gmx.net>
Message-ID: <56680C76.7040909@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On 07/12/15 21:14, Peter Seiderer wrote:

[snip]

> diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
> new file mode 100644
> index 0000000..da6a1d1
> --- /dev/null
> +++ b/package/edid-decode/edid-decode.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# edid-decode
> +#
> +################################################################################
> +
> +EDID_DECODE_VERSION = 681153145d5e05ee15032ea792e967cda06e7622
> +EDID_DECODE_SITE = git://anongit.freedesktop.org/git/xorg/app/edid-decode.git
> +EDID_DECODE_LICENSE = MIT

I'm not sure if we should write MIT or MIT-like here. Can anyone else
have a look to this, please?

> +EDID_DECODE_LICENSE_FILES = edid-decode.c
> +
> +define EDID_DECODE_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC="$(TARGET_CC)" edid-decode

You are missing the $(TARGET_MAKE_ENV) variable in front of $(MAKE).

Also, if you want, you can use $(TARGET_CONFIGURE_OPTS) which will do
the CC="$(TARGET_CC)" (among other things) for you.

Regards,

Vincent.

> +endef
> +
> +define EDID_DECODE_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +$(eval $(generic-package))
> 
