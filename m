From: Pink Boy <dasfoo@yahoo.com>
Date: Wed, 23 Apr 2008 17:07:20 -0700 (PDT)
Subject: [Buildroot] Buildroot for AT91RM9200EK?
In-Reply-To: <844460.38324.qm@web31807.mail.mud.yahoo.com>
Message-ID: <974174.17096.qm@web31809.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Found one issue,

The version of mkimage that I had installed was from the jiget
package not the one that comes with UBoot.  I uninstalled
jiget and mkImage and then tried getting menu config to build 
UBoot and hopefully the mkImage utility, but I get the following,

-bris--
u-boot-1.2.0-atmel/lib_nios2/cache.S
u-boot-1.2.0-atmel/lib_nios2/board.c
u-boot-1.2.0-atmel/.patched.u-boot-1.2.0-atmel-patch.tar.bz2
u-boot-1.2.0-atmel/CREDITS
u-boot-1.2.0-atmel/blackfin_config.mk
touch /home/tu/workspace/arm920_tool/buildroot/build_arm/u-boot-1.2.0-atmel/.unpacked
wget --passive-ftp -nd  -P /home/tu/workspace/arm920_tool/buildroot/dl ftp://www.at91.com/pub/buildroot//u-boot-1.2.0-atmel-patch.tar.bz2
--16:00:37--  ftp://www.at91.com/pub/buildroot//u-boot-1.2.0-atmel-patch.tar.bz2
           => `/home/tu/workspace/arm920_tool/buildroot/dl/u-boot-1.2.0-atmel-patch.tar.bz2'
Resolving www.at91.com... 194.2.24.29
Connecting to www.at91.com|194.2.24.29|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /pub/buildroot/ ... done.
==> PASV ... done.    ==> RETR u-boot-1.2.0-atmel-patch.tar.bz2 ... done.
Length: 242 (unauthoritative)

100%[=====================================================================================>] 242           --.--K/s             

16:00:39 (9.53 MB/s) - `/home/tu/workspace/arm920_tool/buildroot/dl/u-boot-1.2.0-atmel-patch.tar.bz2' saved [242]

mkdir -p /home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/u-boot-patches
bzcat /home/tu/workspace/arm920_tool/buildroot/dl/u-boot-1.2.0-atmel-patch.tar.bz2 | tar -C /home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/u-boot-patches -xvf -
u-boot-1.2.0-atmel-patch/README.txt
u-boot-1.2.0-atmel-patch/README.txt~
touch /home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/u-boot-patches/.unpacked
toolchain/patch-kernel.sh /home/tu/workspace/arm920_tool/buildroot/build_arm/u-boot-1.2.0-atmel /home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/u-boot-patches \*.patch
touch /home/tu/workspace/arm920_tool/buildroot/build_arm/u-boot-1.2.0-atmel/.patched.u-boot-1.2.0-atmel-patch.tar.bz2
cp target/device/Atmel/at91rm9200ek/u-boot/at91rm9200ek.h /home/tu/workspace/arm920_tool/buildroot/build_arm/u-boot-1.2.0-atmel/include/configs/.
cp: cannot stat `target/device/Atmel/at91rm9200ek/u-boot/at91rm9200ek.h': No such file or directory
make: *** [/home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/u-boot-1.2.0-atmel/.configured] Error 1
tu at Matt-LinuxDev:~/workspace/arm920_tool/buildroot$ 

Looking there seems there is no at91rm9200ek.h file


I did try and build the tool chain and UBoot for the Atmel AT91rm9260
dev board and it built without an error.

I think this means that build root support for the Atmel AT91rm9200ek
dev board is currently broken

I'm also thinking that Linux support for the Atmel AT91rm9200
microprocessor is spotty at best and maybe I should switch
parts?  (I feel after banging on this that without an experience
with a working tool chain built with buildroot, there is realy
no way I can fix this)

Mr Foo

-----




--- On Sat, 4/19/08, Pink Boy <dasfoo@yahoo.com> wrote:

> From: Pink Boy <dasfoo@yahoo.com>
> Subject: Re: [Buildroot] Buildroot for AT91RM9200EK?
> To: buildroot at uclibc.org
> Date: Saturday, April 19, 2008, 7:42 PM
> Hi,
> 
> One more thing, the command that seems to bomb,
> 
> 
> cp -pf
> /home/tu/workspace/arm920_tool/buildroot/project_build_arm/uclibc/linux-2.6.22.1/arch/arm/boot/uImage
> /home/tu/workspace/arm920_tool/buildroot/binaries/uclibc/at91rm9200ek-linux-2.6.22.1-20080420.gz
> 
> The is no uImage in the source folder, there is however a
> zImage.
> 
> ???
> 
> Mr Foo
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
