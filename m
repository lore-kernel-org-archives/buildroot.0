From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Thu, 08 Dec 2011 12:26:11 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <87pqfzbaq9.fsf@macbook.be.48ers.dk>
References: <4EDE32C3.7020400@neotion.com>	<201112060956.07523.minimod@morethan.org>	<4EDE57E6.4040007@neotion.com>	<201112061216.46659.minimod@morethan.org>	<4EE091EE.2010504@neotion.com>
 <87pqfzbaq9.fsf@macbook.be.48ers.dk>
Message-ID: <4EE09ED3.5060102@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/08/2011 11:48 AM, Peter Korsgaard wrote:

>  Emmanuel> The only remaining problem is that the whole filesystem is
>  Emmanuel> read-only despite the 'rw' including /var and /tmp.
> 
> That's because you're using squashfs. Squashfs is a readonly
> filesystem. Either move to initramfs or use ext2 in your initrd.
> 

> /tmp should be a tmpfs though (check /etc/fstab), and most of /var
> symlinks to /tmp/.
> 

Oh that's rigth, it's writable, I mixed with another directory that I wanted to write to (/usr/local). I mounted it as
tmpfs too and everything's fine now. Thanks a lot for your help :)

Well, I'll switch back to initramfs anyway since it's less tricky.

regards,
-- 
Emmanuel
