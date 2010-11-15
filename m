From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Nov 2010 13:55:50 -0300
Subject: [Buildroot] making buildroot for arm7tdmi static flat fails
In-Reply-To: <1289739946.19487.28.camel@cecilia.engel.home>
References: <1289712490.19487.13.camel@cecilia.engel.home>
	<1289739946.19487.28.camel@cecilia.engel.home>
Message-ID: <4CE16616.5090905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/14/10 10:05, Dan Engel wrote:

> I have a follow-up:
> 
> In the configuration that led to the above error, I had disabled global
> constructors and destructors in the uclibc configuration ("make
> uclibc-menuconfig").
> 
> If I first try to build with global constructors and destructors
> enabled, it eventually gives an error (I think during gcc construction)
> about missing __fini_array and __init_array stuff. If I then change the
> configuration (using "make uclibc-menuconfig") to disable the global
> ctors and dtors and type "make" again, it builds to completion.
> Something in that two-step process gets me past the above error about
> lib/crti.o.
> 
> However, when I try to compile and link a simple flat "hello," the
> following happens:
> 
> dan at cecilia ~/tmp $ arm-linux-gcc -Wl,-elf2flt hello.c
> /mnt/local/armtc/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.5/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld.real: error: no memory region specified for loadable section `.ARM.extab'
> collect2: ld returned 1 exit status
> dan at cecilia ~/tmp $ 
> 
> Does anyone have any idea what I'm missing?
> 
> Thanks,
> -Dan

Did you disable MMU support in uclibc's config and enable one of the
flat target file formats?
Regards.
