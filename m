From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 18:04:06 +0200
Subject: [Buildroot] [PATCH] opencv: Enable NEON flags
In-Reply-To: <CAEj2-1O-xw2ZJoSY=GXj2FBJp_oc7Z81ri3Xe2n_rezP5uhfZw@mail.gmail.com>
References: <CAEj2-1O-xw2ZJoSY=GXj2FBJp_oc7Z81ri3Xe2n_rezP5uhfZw@mail.gmail.com>
Message-ID: <20170709180406.1423fe8b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 07 Jul 2017 02:00:01 +0000, Andre Renaud wrote:
> opencv: Enable NEON optimizations if available
> 
> Signed-off-by: Andre Renaud <andre@ignavus.net>
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 92cfd43..b5b1253 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -79,7 +79,8 @@ OPENCV_CONF_OPTS += \
>         -DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
>         -DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
>         -DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
> -       -DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
> +       -DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF) \
> +       -DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
