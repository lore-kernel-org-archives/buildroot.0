From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Mon, 25 Apr 2016 16:10:05 +0100
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
	with symlink
In-Reply-To: <87oa8xpx9j.fsf@dell.be.48ers.dk>
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk> <81b71ac5323b1793405c3192b6ac5264@eja.it>
 <20160425161610.4e5cbe87@armant.core.local.os.greenbone.net>
 <7c641e674768b186ec37e275adbd41da@eja.it> <87oa8xpx9j.fsf@dell.be.48ers.dk>
Message-ID: <ec8ee5807de2689a472b1c402ede6709@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 2016-04-25 15:40 Peter Korsgaard ha scritto:
>>>>>> "Ubaldo" == Ubaldo Porcheddu <ubaldo@eja.it> writes:
> 
> Hi,
> 
>>>> I just tested the new kernel version but it doesn't give me the 
>>>> login
>  >>> prompt, the kernel seems to be booting fine as it can recognize my
>  >>> keyboard but it doesn't accept any input.
>  >>>
>  >>
>  >> I had something similar, removed the 'console=ttyAMA0...' from the
>  >> cmdline.txt file, and it booted through. Mine was not able to 
> recognize
>  >> my keyboard, but with dropbear and an extra user I was able to 
> login.
> 
>  > after removing the extra console declaration I can also get the 
> login,
>  > my keyboard get recognized by the kernel but it doesn't work 
> properly,
>  > seems to be adding extra characters after any key press.
> 
> Funky. Removing console=ttyAMA0 (or console=ttyS0) would mean that tty1
> becomes /dev/console, so we end up having two gettys running on tty1
> which could explain the double characters.
> 
> I'm not sure why it doesn't work with console= pointing at the serial
> port. Luca, you added the serial console handling, any idea what might
> be going wrong?

You are right about the double getty, indeed if I set console=tty2 I end 
up with a working getty/login on tty1 and tty2 and error messages on 
tty2.

Maybe the problem is in /etc/inittab using "console" in place of ttyS0?
