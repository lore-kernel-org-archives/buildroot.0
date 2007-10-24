From: =?ISO-8859-1?Q?Kim_Str=F8ger?= <ks@sfktech.com>
Date: Wed, 24 Oct 2007 13:18:30 +0200
Subject: [Buildroot] Can not build toolchain for arm or armed
In-Reply-To: <20071022132753.GA27339@cloud.net.au>
References: <20071021120218.1C89BA4A39@busybox.net>	<471C7307.1020204@sfktech.com>
	<471C9104.5000005@promwad.com>	<471C7798.3030005@sfktech.com>
	<20071022132753.GA27339@cloud.net.au>
Message-ID: <471F2A06.6060206@sfktech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for the delay....was out of the office for a bit.

Yes I did try to disable the threading, but then I got an error about an 
abject neeeded threading, so I enable it again.

So once more I started all over. Just want to build the uclibc with 
buildroot.

ARCH=armed
Threads=disable.
Kernel=none
Builtroot svn version: 20319

I have attach the full config file.

But I still end up with this.

make[2]: Leaving directory 
`/home/cz2/Crossdev/buildroot/toolchain_build_armeb/gcc-4.2.1-initial/gcc'
make[1]: Leaving directory 
`/home/cz2/Crossdev/buildroot/toolchain_build_armeb/gcc-4.2.1-initial'
touch 
/home/cz2/Crossdev/buildroot/toolchain_build_armeb/gcc-4.2.1-initial/.installed
/usr/bin/make MAKE="/usr/bin/make -j1" -C 
/home/cz2/Crossdev/buildroot/toolchain_build_armeb/uClibc-0.9.29 \
                PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="/usr/bin/gcc" \
                all
make[1]: Entering directory 
`/home/cz2/Crossdev/buildroot/toolchain_build_armeb/uClibc-0.9.29'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -MM *.c > .depend 
2>/dev/null || :
make[2]: `conf' is up to date.
  CC ldso/ldso/ldso.oS

cc1: error: unrecognized command line option "-mfdpic"

make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory 
`/home/cz2/Crossdev/buildroot/toolchain_build_armeb/uClibc-0.9.29'
make: *** 
[/home/cz2/Crossdev/buildroot/toolchain_build_armeb/uClibc-0.9.29/lib/libc.a] 
Error 2


Help......?????

Thanks, Kim S.

Hamish Moffatt wrote:
> On Mon, Oct 22, 2007 at 12:12:40PM +0200, Kim Str?ger wrote:
>   
>> Kuten Ivan wrote:
>>     
>>> Kim Str?ger wrote:
>>>       
>>>> I am trying to build just the toolchain for the arm processor,  using
>>>> buildroot:  At revision 20315
>>>> but I am stock with this error ??
>>>>
>>>> /home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:2124:
>>>> error: '__mf_biglock' undeclared (first use in this function)
>>>> make[5]: *** [pth/mf-runtime.lo] Error 1
>>>> make[5]: Leaving directory
>>>> `/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
>>>>         
>>> Please provide your .config
>>> I have built 4.2.1 armv4 920t  with soft-float and without soft-float successfully.
>>>       
>> my .config
>>     
>
> How about config.log from somewhere in
> /home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap ?
>
> I built gcc-4.2.1 + armeb + soft-float + oabi last week ok.
>
> Did you tweak your uClibc configuration at all, eg to disabling
> threading?
>
> Hamish
>   
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
Url: http://busybox.net/lists/buildroot/attachments/20071024/01fd2705/attachment.diff 
