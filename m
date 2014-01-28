From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 23:20:19 +0100
Subject: [Buildroot] [PATCH 2/2] linux: only depend on host-lzop if
	needed
In-Reply-To: <87ha8nzr7n.fsf@dell.be.48ers.dk>
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
 <20140128231437.22b6a7ee@skate> <87ha8nzr7n.fsf@dell.be.48ers.dk>
Message-ID: <20140128232019.6136bcaf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 28 Jan 2014 23:17:32 +0100, Peter Korsgaard wrote:

>  > Do this works reliably? KERNEL_SOURCE_CONFIG typically points to a
>  > minimal defconfig file (say arch/arm/configs/mvebu_defconfig). So if
>  > CONFIG_KERNEL_LZO is the default choice for the kernel, it will not
>  > appear in the defconfig, and therefore the piece of code above will not
>  > realize that we need host-lzop, because the test is done before "make
>  > mvebu_defconfig" is executed and turns it back into a full
>  > configuration file.
> 
> The commit message contained:
> 
> Since LZO is not the default compression option in the kernel (and there
> is not sign that will change in the foreseeable future), it will always
> appear in a condif file, whether it is a complete config file or it is
> only a defconfig.
> 
> So I believe the answer is yes, it will work.

Ok, thanks, I missed that. I believe it's a little bit fragile to rely
on the assumption that it will not become the default, but since the
breakage will be very clear if this ever changes, I think Yann's
proposal is a good compromise. I was also annoyed by host-lzop always
being built, even if useless. Seemed like Buildroot was turning into
this other build system that builds gazillions of useless
dependencies :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
