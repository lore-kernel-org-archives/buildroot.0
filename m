From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Jan 2017 10:55:11 -0200
Subject: [Buildroot] Adding kmscube support
In-Reply-To: <CAOMZO5AYjEb56ErnvnAQ-PA4xtZb_97BsGyqYRF2tWSj+Osi-A@mail.gmail.com>
References: <CAOMZO5BDx6SqN-ZxU+ogJNetjtZhDqWrF0cB5YhqC7pW3NwaSA@mail.gmail.com>
 <CAOMZO5AYjEb56ErnvnAQ-PA4xtZb_97BsGyqYRF2tWSj+Osi-A@mail.gmail.com>
Message-ID: <CAOMZO5DdVzn6+p3vDqjRXt=a28NVNAOw84H=-d8zio_J9gyNLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 21, 2017 at 9:57 AM, Fabio Estevam <festevam@gmail.com> wrote:

> +# Autoreconf requires an m4 directory to exist
> +define KMSCUBE_PATCH_M4
> +       mkdir -p $(@D)/m4
> +endef
> +KMSCUBE_POST_PATCH_HOOKS += KMSCUBE_PATCH_M4

Now the following missing requirement is seen:

"checking for DRM... yes
checking for GBM... yes
checking for EGL... yes
checking for GLES2... no
configure: error: Package requirements (glesv2) were not met:

Package glesv2 was not found in the pkg-config search path.
Perhaps you should add the directory containing `glesv2.pc'
to the PKG_CONFIG_PATH environment variable
Package 'glesv2', required by 'world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables GLES2_CFLAGS
and GLES2_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details. "

What would be the correct way to provide glesv2 in Buildroot?

Thanks
