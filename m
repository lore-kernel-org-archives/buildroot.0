From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 20 Jan 2007 18:29:31 +0100
Subject: [Buildroot] Building x86_64 failes
In-Reply-To: <20070120125116.GJ14371@priv.blacknet.de>
References: <20070119133153.GH14371@priv.blacknet.de>
	<20070119150806.GA16887@aon.at>
	<20070120125116.GJ14371@priv.blacknet.de>
Message-ID: <20070120172931.GA23354@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 20, 2007 at 01:51:16PM +0100, Goetz Bock wrote:
>
>On Fri, Jan 19 '07 at 16:08, Bernhard Fischer wrote:
>> On Fri, Jan 19, 2007 at 02:31:53PM +0100, Goetz Bock wrote:
>> > [ ... I'm unable to build buildroot toolchain for x96_64 ... ]
>> >/build/buildroot.amd64/toolchain_build_x86_64/gcc-4.1.1/gcc/config/i386/linux-unwind.h:
>> >In function 'x86_fallback_frame_state':
>> >/build/buildroot.amd64/toolchain_build_x86_64/gcc-4.1.1/gcc/config/i386/linux-unwind.h:152:
>> >error: 'struct sigcontext' has no member named 'esp'
>> >.
>> >. [ more missing e?? members ]
>> >.
>> 
>> Can you check that uClibc has the correct arch set?
>
>The toolchain_build_x86_64/uClibc-0.9.28/.config lists:
>TARGET_x86_64=y
>ARCH_SUPPORTS_LITTLE_ENDIAN=y
>TARGET_ARCH="x86_64"
>ARCH_LITTLE_ENDIAN=y
>KERNEL_SOURCE="/build/buildroot.amd64/toolchain_build_x86_64/linux"
>
>In the KERNEL_SOURCE dir include/asm is linked to asm-x86_64
>
>> What kernel-headers do you use?
>
>I'm using the 2.6.12.0 headers, as my kernel will be 2.6.18 from Etch

I don't use these headers, so can't help you there. The 2.6.19.2 worked
for me for building an x86_64 rootfs, fyi.

HTH,
