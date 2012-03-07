From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Mar 2012 20:23:04 +0100
Subject: [Buildroot] New package protobuf
In-Reply-To: <CAHt8ZCM9ZD=VSEc5UJ+98NTiwhYsAz0sGXCt+yNPVMAKCB8qtg@mail.gmail.com>
References: <CAHt8ZCM9ZD=VSEc5UJ+98NTiwhYsAz0sGXCt+yNPVMAKCB8qtg@mail.gmail.com>
Message-ID: <20120307202304.19ec2f11@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

Thanks for your patches!

Le Wed, 7 Mar 2012 18:06:29 +0000,
Simon Dawson <spdawson@gmail.com> a ?crit :

> Patch to add protobuf package (Google protocol buffers) to buildroot.
> 
> http://code.google.com/p/protobuf/

Please add your Signed-off-by line here.

> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> new file mode 100644
> index 0000000..6a7447f
> --- /dev/null
> +++ b/package/protobuf/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PROTOBUF
> +	bool "protobuf"
> +	help
> +	Protocol buffers are Google's language-neutral, platform-neutral,
> +	extensible mechanism for serializing structured data.
> +
> +	 http://code.google.com/p/protobuf/

Indentation for the help text is one tab + 2 spaces.

> +#############################################################
> +#
> +# protobuf
> +#
> +#############################################################
> +PROTOBUF_VERSION = 2.4.1
> +PROTOBUF_SITE = http://protobuf.googlecode.com/files/
> +
> +# N.B. Need to use host protoc during cross compilation.
> +PROTOBUF_DEPENDENCIES = host-protobuf
> +PROTOBUF_CONF_OPT = --with-protoc=$(HOST_DIR)/usr/bin/protoc
> +
> +$(eval $(call AUTOTARGETS))
> +$(eval $(call AUTOTARGETS,host))

Otherwise looks good.

Just curious, what does protobuf installs on the target? Is it a
library? A utility?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
