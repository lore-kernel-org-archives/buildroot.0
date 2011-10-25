From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Oct 2011 08:24:55 +0200
Subject: [Buildroot] [PATCH 5/6] qemu_sh4_r2d: update to kernel 3.1 and
	update readme
In-Reply-To: <1319485334-15790-5-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 24 Oct 2011 16:42:13 -0300")
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
 <1319485334-15790-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehy1y4eg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> +++ b/configs/qemu_sh4_r2d_defconfig
 Gustavo> @@ -2,6 +2,10 @@
 Gustavo>  BR2_sh=y
 Gustavo>  BR2_sh4=y
 
 Gustavo> +# system
 Gustavo> +BR2_TARGET_GENERIC_GETTY=y
 Gustavo> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"

No serial port emulated? From the defconfig I see:

CONFIG_SERIAL_8250=y
CONFIG_SERIAL_SH_SCI=y
CONFIG_SERIAL_SH_SCI_NR_UARTS=1

I prefer to run the getty on the serial port for the qemu defconfigs,
because it's closer to what is typically done on hw (and makes it easier
to reuse rootfs on real hw).

-- 
Bye, Peter Korsgaard
