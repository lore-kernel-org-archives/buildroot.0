From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 21 Sep 2015 09:44:18 +0100
Subject: [Buildroot] [PATCH v7 1/1] squeezelite: new package
In-Reply-To: <201509210347.t8L3lcth017495@ms-omx02.plus.so-net.ne.jp>
References: <201509210347.t8L3lcth017495@ms-omx02.plus.so-net.ne.jp>
Message-ID: <55FFC362.8050106@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

comments below.

On 09/21/2015 04:47 AM, kei-k at ca2.so-net.ne.jp wrote:
[snip]
> diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
> new file mode 100644
> index 0000000..681bb46
> --- /dev/null
> +++ b/package/squeezelite/squeezelite.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# squeezelite
> +#
> +################################################################################
> +
> +SQUEEZELITE_VERSION = v1.8
> +SQUEEZELITE_SITE = https://code.google.com/p/squeezelite
> +SQUEEZELITE_SITE_METHOD = git
> +SQUEEZELITE_LICENSE = GPLv3
> +SQUEEZELITE_LICENSE_FILE = LICENSE.txt
> +SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123 libsoxr
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE),y)
> +	SQUEEZELITE_MAKE_OPTS += -DRESAMPLE
> +	ifeq ($(BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP),y)
> +		SQUEEZELITE_MAKE_OPTS += -DRESAMPLE_MP
> +	endif
> +endif

I think the Buildroot style is to not indent this code. Can other dev
tell me if I'm wrong?

> +
> +define SQUEEZELITE_BUILD_CMDS
> +    $(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \

You should indent this command with one tab instead of four spaces.

> +	CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

And this line indented with two tabs as is the continuation of the above
command.

> +endef
> +
> +define SQUEEZELITE_INSTALL_TARGET_CMDS
> +    $(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin

Same here. This command should be indented with one tab instead of four
spaces.

Regards,

Vincent.

> +endef
> +
> +$(eval $(generic-package))
> 
