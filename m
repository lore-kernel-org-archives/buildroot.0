From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Dec 2011 08:32:34 +0200
Subject: [Buildroot] ST-Ericsson Snowball
In-Reply-To: <CADcT_i0WXyEU2D88=_iD5Zntem+GpBqeoK1hHRuq_L=oVGv42w@mail.gmail.com>
References: <CADcT_i0WXyEU2D88=_iD5Zntem+GpBqeoK1hHRuq_L=oVGv42w@mail.gmail.com>
Message-ID: <20111207063234.GA29860@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi sangam,

On Wed, Dec 07, 2011 at 11:39:51AM +0530, sangam shetty wrote:
> Hi All,
>     I got a snowball board recently. I downloaded the Latest buildroot and
> built the cross_compiler for the same(arm-cortex-A9). I wrote a simple
> hello world program to see if i have build the things correctly. When i
> execute the hello world on the snowball board it is coming up with the
> following error :
> 
> root at linaro-desktop:/home/linaro# ls -l hello
> -rwxrwxrwx 1 root root 4346 2000-01-01 00:04 hello
> root at linaro-desktop:/home/linaro# file hello
> hello: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked
> (uses shared libs), not stripped
> root at linaro-desktop:/home/linaro# ./hello
> -bash: ./hello: No such file or directory

Make sure that all shared libraries this 'hello' depends on are present. Use 
"ldd hello" or "${CROSS_COMPILE}-objdump -x hello |grep NEEDED" to find out 
what libraries your 'hello' binary needs.

> root at linaro-desktop:/home/linaro# ls -l ./hello
> -rwxrwxrwx 1 root root 4346 2000-01-01 00:04 ./hello
> root at linaro-desktop:/home/linaro#

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
