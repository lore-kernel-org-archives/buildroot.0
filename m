From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Wed, 18 Sep 2013 13:20:31 +0200
Subject: [Buildroot] [PATCH v2] gpu-viv-bin-mx6q: add pkgconfig files
 for EGL, OpenGLESv2 and OpenVG
In-Reply-To: <1379502224-4999-1-git-send-email-fatih.asici@gmail.com>
References: <1379502224-4999-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <8bf55b2e7b82a691d6e61fe3bcb843c2@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fatih,

On 2013-09-18 13:03, Fatih A??c? wrote:
[...]
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
> b/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
> new file mode 100644
> index 0000000..c984247
> --- /dev/null
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=${exec_prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: egl
> +Description: Freescale gpu-viv-bin-mx6q implementation of EGL
> +Version: 1.0
> +Libs: -L${libdir} -lGAL -lEGL
> +Cflags: -I${includedir}/ -DEGL_API_FB=1
IFAIK, -DEGL_API_FB=1 must be used only if GPU_VIV_BIN_MX6Q_LIB_TARGET
== fb.

> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
> b/package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
[...]
> +Cflags: -I${includedir}/ -DEGL_API_FB=1
Ditto.

[...]
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc
> b/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc
> new file mode 100644
> index 0000000..fb14005
> --- /dev/null
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/vg.pc
[...]
> +Cflags: -I${includedir}/ -DEGL_API_FB=1
Ditto.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
