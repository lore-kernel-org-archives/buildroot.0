From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 13:35:09 +0200
Subject: [Buildroot] [PATCH v5 02/13] package/opencv: alphabetically
 sorted each _CONF_OPTS group
In-Reply-To: <1433672799-21387-3-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607113509.GC3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
> No new option added nor removed.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 9967abc..4d08481 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
[--SNIP--]
> @@ -71,14 +71,14 @@ OPENCV_CONF_OPTS += \
>  # * PowerPC support is turned off since its only effect is altering CFLAGS,
>  #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
>  OPENCV_CONF_OPTS += \
> +	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
> +	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
>  	-DENABLE_POWERPC=OFF \
> -	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
>  	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
>  	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
>  	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
>  	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
> -	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
> -	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
> +	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
>  	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)

I don't know how you sorted, but for me, SSE sorts before SSE2.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
