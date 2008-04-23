From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 23 Apr 2008 21:43:31 +1000
Subject: [Buildroot] Error:"Staging_dir/lib/libc.so.0: could not
	read	symbols:file in wrong format" while "make" buildroot
	with xscale, gcc-4.2.3
In-Reply-To: <1208921910.480eaf36b427a@www.server101.com>
References: <1208876655.480dfe6f0bef5@www.server101.com>
	<6311fe0b0804220845q232b2ce3h41713d533eeb40f@mail.gmail.com>
	<1208921910.480eaf36b427a@www.server101.com>
Message-ID: <20080423114331.GA15032@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 23, 2008 at 01:38:30PM +1000, Li Liang wrote:
> The same error message appeared again as following while I executed "make" after
> "make menuconfig"
> 
> /home/user/workspace/MFSP/uCroot/buildroot/build_armeb/staging_dir/lib/libc.so.0:
> could not read symbols: File in wrong format
> collect2: ld returned 1 exit status

So can you run "file" on the libc.so.0? It should say 32-bit ARM MSB.

> I am using the following packages to build the tool-chain:
> 
> kernel 2.6.24
> uClibc 0.9.29
> binutils 2.18
> gcc 4.2.3

I'm using gcc 4.1.x here. I couldn't get 4.2.3 built successfully for
armeb, but that was months ago and it might be fixed by now. Also I'm
still using OABI rather than EABI because I couldn't get the latter
compiled either.

Unless you really need 4.2.x you could try the older version.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
