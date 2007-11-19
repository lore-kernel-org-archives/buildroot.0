From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 19 Nov 2007 13:36:58 +0200
Subject: [Buildroot] SDL fails for Buildroot arm926ejs toolchain
In-Reply-To: <13830846.post@talk.nabble.com>
References: <13830846.post@talk.nabble.com>
Message-ID: <4741755A.5010404@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hebbar wrote:
> Hi all,
> 
> I am trying to build arm926ejs toolchain (little endian, uclibc 0.9.29, gcc
> 4.2.1) with sdl enabled.
> While building sdl fails with below error. Kindly help me to solve it. I
> searched google and  found from link that its related to machine hardware
> name. 
> 
> http://www.gp32x.com/board/index.php?showtopic=38956&pid=562697&mode=threaded&show=&st=&
> 
> 
> /usr/include/asm/errno.h:9:4: warning: #warning This machine appears to be
> neither x86_64 nor i386.
> ./src/stdlib/SDL_iconv.c: In function 'SDL_iconv':
> ./src/stdlib/SDL_iconv.c:54: error: 'E2BIG' undeclared (first use in this
> function)
> ./src/stdlib/SDL_iconv.c:54: error: (Each undeclared identifier is reported
> only once
> ./src/stdlib/SDL_iconv.c:54: error: for each function it appears in.)
> ./src/stdlib/SDL_iconv.c:56: error: 'EILSEQ' undeclared (first use in this
> function)
> ./src/stdlib/SDL_iconv.c:58: error: 'EINVAL' undeclared (first use in this
> function)
> make[1]: *** [build/SDL_iconv.lo] Error 1
> make[1]: Leaving directory
> `/home/guru/project/original/bldrt/buildroot/build_arm/SDL-1.2.12'
> make: ***
> [/home/guru/project/original/bldrt/buildroot/build_arm/SDL-1.2.12/.compiled]
> Error 2
> 
>    Also when i looked inside "/usr/include/asm" of buildrrot toolchain
> directory i found that SDL is presently taking /usr from root of my linux OS
> and not from Buildroot toolchain /usr directory.
> 
> 
> 
> Thanks in advance
> 
> Regards
> Gururaja

Hi,

Please post your output of configure. I have SDL-1.2.12 built ok and headers are taken from staging_dir.

Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
