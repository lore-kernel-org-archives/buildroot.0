From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 11 Mar 2008 15:51:11 +0100
Subject: [Buildroot] build for AT91 fails
References: <d449ded70803110527t3ea96b09r78dec92cb72beea3@mail.gmail.com>
	<04c101c88381$c24bda70$090514ac@atmel.com>
	<d449ded70803110746t6dc07450gc297414415fdb1da@mail.gmail.com>
Message-ID: <000501c8838b$d3be3550$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 2008/3/11, Ulf Samuelsson <ulf.samuelsson@atmel.com>:
>>
>>
>>  > Hi all !
>>  >
>>  > I'm facing a problem with targeting 'at91sam9261ek'
>>  >
>>  >
>>  >
>>  > Checking build system dependencies:
>>  > BUILDROOT_DL_DIR clean:                         Ok
>>  > CC clean:                                       Ok
>>  > CXX clean:                                      Ok
>>  > CPP clean:                                      Ok
>>  > CFLAGS clean:                                   Ok
>>  > INCLUDES clean:                                 Ok
>>  > CXXFLAGS clean:                                 Ok
>>  > which installed:                                Ok
>>  > sed works:                                      Ok (/bin/sed)
>>  > GNU make version '3.81':                        Ok
>>  > C compiler '/usr/bin/gcc'
>>  > C compiler version '4.1.2':                     Ok
>>  > C++ compiler '/usr/bin/g++'
>>  > C++ compiler version '4.1.2':                   Ok
>>  > bison installed:                                Ok
>>  > flex installed:                                 Ok
>>  > gettext installed:                              Ok
>>  > makeinfo installed:                             Ok
>>  > Build system dependencies:                      Ok
>>  >
>>  > rm -rf /home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/buildroot-config
>>  > mkdir -p /home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC
>>  > cp -dpRf package/config/buildroot-config
>>  > /home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/buildroot-config
>>  > toolchain/patch-kernel.sh
>>  > /home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/linux-2.6.24
>>  > toolchain/kernel-headers \
>>  >                linux-2.6.24-\*.patch{,.gz,.bz2}
>>  > toolchain/patch-kernel.sh
>>  > /home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/linux-2.6.24
>>  > target/device/Atmel/at91sam9261ek/kernel-patches linux-2.6.24-\*.patch
>>  > ;
>>  > Aborting.  'target/device/Atmel/at91sam9261ek/kernel-patches' is not a
>>  > directory.
>>
>>
>> When you build against a new kernel, you have to make sure that
>>  you generate the appropriate directories.
>>  Also, the latest maxim.org.za patches should be present.
> 
> I though that make creates appropriate directories for kernel patches.
> 
> Ok John suggest me to create 'kernel-patches' directory but you know
> that there is a directory
> 'target/device/Atmel/Linux/kernel-patches-2.6.20.4/' in within some
> patches are already present
> 

You should  create 
'target/device/Atmel/arch-arm/kernel-patches-2.6.24/'
not
'target/device/Atmel/Linux/kernel-patches-2.6.24/'

"Linux" is for merged avr32/arm patches.

You need then to download the patch from maxim.org.za/at91_26.html
and put in that directory.


Best Regards
Ulf Samuelsson 
