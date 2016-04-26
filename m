From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 26 Apr 2016 16:22:01 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
 with symlink
In-Reply-To: <87oa8xpx9j.fsf@dell.be.48ers.dk>
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk> <81b71ac5323b1793405c3192b6ac5264@eja.it>
 <20160425161610.4e5cbe87@armant.core.local.os.greenbone.net>
 <7c641e674768b186ec37e275adbd41da@eja.it> <87oa8xpx9j.fsf@dell.be.48ers.dk>
Message-ID: <571F7989.4040807@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Ubaldo,

On 25/04/2016 16:40, Peter Korsgaard wrote:
>>>>>> "Ubaldo" == Ubaldo Porcheddu <ubaldo@eja.it> writes:
> 
> Hi,
> 
>>>> I just tested the new kernel version but it doesn't give me the login
>  >>> prompt, the kernel seems to be booting fine as it can recognize my
>  >>> keyboard but it doesn't accept any input.
>  >>> 
>  >> 
>  >> I had something similar, removed the 'console=ttyAMA0...' from the
>  >> cmdline.txt file, and it booted through. Mine was not able to recognize
>  >> my keyboard, but with dropbear and an extra user I was able to login.
> 
>  > after removing the extra console declaration I can also get the login,
>  > my keyboard get recognized by the kernel but it doesn't work properly,
>  > seems to be adding extra characters after any key press.
> 
> Funky. Removing console=ttyAMA0 (or console=ttyS0) would mean that tty1
> becomes /dev/console, so we end up having two gettys running on tty1
> which could explain the double characters.
> 
> I'm not sure why it doesn't work with console= pointing at the serial
> port. Luca, you added the serial console handling, any idea what might
> be going wrong?

At first sight, no. But I experienced a similar issue while I was
testing my patch [0].

I was able to login on tty1 with a USB keyboard, but typing a few
characters such as "ls<ENTER>" just after login would do weird things
like logging me out. This was using a super-cheap keyboard I had never
used before. I retried with a trusted one, and it was working just fine.
This got me clueless, so I triple-checked, and the problem was always
happening with the cheap keyboard, never with the trusted one.

I thought the cheap keyboard must be broken and "archived" it.

I would be surprised if you could solve your issues by changing
keyboard, but it's worth giving it a try...

[0]
https://git.buildroot.net/buildroot/commit/?id=20878a1017e2bf7eb8c5f870dc6d2641493cb0f9

-- 
Luca
