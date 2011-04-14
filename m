From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 14 Apr 2011 11:04:47 +0200
Subject: [Buildroot] Booting with ramdisk
In-Reply-To: <8739m8mfn0.fsf@macbook.be.48ers.dk>
References: <201103211546.22271.dargaud@lpsc.in2p3.fr>
	<8739m8mfn0.fsf@macbook.be.48ers.dk>
Message-ID: <201104141104.47593.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 27 March 2011 23:12:51 Peter Korsgaard wrote:

>  Guillaume> The kernel stops instantly without even a blip on the
>  Guillaume> console. A debugger reveals that it stops at 0x401718... I
>  Guillaume> have no idea what's going on at this stage.
> 
> Strange. What architecture/system is this? How much did the (compressed)
> kernel grow? Perhaps it's too big / you'll need to load it higher. For
> most archs, the kernel want to decompress into address 0, so if you load
> it too low, you might end up overwriting the compressed kernel as you're
> decompressing it.

Absolutely correct. I used:
powerpc-linux-objcopy --change-addresses 0x400000 simpleImage.virtex405-ml405.elf reloc800000.elf
And it booted fine afterwards at the new 0x800000 load address.
-- 
Guillaume Dargaud
http://www.gdargaud.net/Climbing/
