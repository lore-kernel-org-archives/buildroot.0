From: luke <skywal_l@hotmail.com>
Date: Mon, 20 Mar 2017 12:36:21 +0000
Subject: [Buildroot] [PATCH] Enable UART on raspberry pi zero
In-Reply-To: <20170319132745.GB3734@free.fr>
References: <DB5PR03MB13342317D9FB07E001D16231E7380@DB5PR03MB1334.eurprd03.prod.outlook.com>,
 <20170319132745.GB3734@free.fr>
Message-ID: <DB5PR03MB13340AA1B7DB55B8854CF981E73A0@DB5PR03MB1334.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maybe my message wasn't clear.

This is for the raspberry PI Zero W.

The UART is taken over by the wifi chip, so the software UART is now used for the TX/RX GPIO pin. But to be reliable, the CPU freq is supposed to be limited in some way.

It's all here: https://www.raspberrypi.org/forums/viewtopic.php?f=28&t=141195

Pi3 UART stopped working? Read this. - Raspberry Pi<https://www.raspberrypi.org/forums/viewtopic.php?f=28&t=141195>
www.raspberrypi.org
I have followed this post and others related to the issue and am still stumped by the serial corruption issue. I have a pi 3 flashed with 2016-03-18-raspbian-jessie.




JD


________________________________
De : Yann E. MORIN <yann.morin.1998@gmail.com> de la part de Yann E. MORIN <yann.morin.1998@free.fr>
Envoy? : dimanche 19 mars 2017 13:27
? : luke
Cc : buildroot at busybox.net
Objet : Re: [Buildroot] [PATCH] Enable UART on raspberry pi zero

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
>        sed -i '/GENERIC_SERIAL/a\
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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170320/c6bfb648/attachment.html>
