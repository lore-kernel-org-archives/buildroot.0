From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Mar 2017 14:27:45 +0100
Subject: [Buildroot] [PATCH] Enable UART on raspberry pi zero
In-Reply-To: <DB5PR03MB13342317D9FB07E001D16231E7380@DB5PR03MB1334.eurprd03.prod.outlook.com>
References: <DB5PR03MB13342317D9FB07E001D16231E7380@DB5PR03MB1334.eurprd03.prod.outlook.com>
Message-ID: <20170319132745.GB3734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luke, All,

On 2017-03-18 18:22 +0000, luke spake thusly:
> From 9c77dfd825bebbf02e3b2837dacb9ae4873c9ec8 Mon Sep 17 00:00:00 2001
> From: Luke <skywal_l@hotmail.com>
> Date: Sat, 18 Mar 2017 18:17:24 +0000
> Subject: [PATCH 1/1] Modify post-build.sh for raspberry pi zero so that it
>  activates the UART serial console in config.txt
> 
> Signed-off-by: Luke <skywal_l@hotmail.com>
> ---
>  board/raspberrypi/post-build.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
> index 5e5eb71..6d2f0d1 100755
> --- a/board/raspberrypi/post-build.sh
> +++ b/board/raspberrypi/post-build.sh
> @@ -9,3 +9,6 @@ if [ -e ${TARGET_DIR}/etc/inittab ]; then
>  	sed -i '/GENERIC_SERIAL/a\
>  tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
>  fi
> +
> +# Activate the console
> +echo "enable_uart=1" | cat >> config.txt

I have a rpi-0 here, and I do not need that config option to get the UART
working.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
