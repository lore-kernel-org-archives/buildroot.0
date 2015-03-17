From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 17 Mar 2015 16:05:31 +0100
Subject: [Buildroot] [PATCH v4] package/sysdig: New package
In-Reply-To: <20150317160119.465eb8eb@free-electrons.com>
References: <1426603727-4895-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150317160119.465eb8eb@free-electrons.com>
Message-ID: <CA+TH9VnGGLwUO+fscw0-LzrQ0LBSurRQD1BA4yO7kiCaimQQRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

> Unless I missed it, you did not reply to my question: is LuaJIT
> mandatory, or can sysdig use the normal Lua interpreter as well?

Sorry, you are right. Unfortunately sysdig depend on Luajit, you can
find more info here [1].

>
>> +     select BR2_PACKAGE_LIBJSON
>> +     depends on BR2_LINUX_KERNEL
>> +     depends on BR2_INSTALL_LIBSTDCPP #Libjson
>
> Nitpick: # libjson
>
> (i.e space after #, and lowercase package name)

Ok!

>
>> +     depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') \
>> +             || BR2_powerpc || BR2_arm || BR2_armeb \
>> +             || ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT) #Luajit
>
> Please introduce a BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS hidden option in
> luajit/Config.in, and use it in both luajit/Config.in and here. See
> what Samuel did with the BR2_PACKAGE_CMAKE_ARCH_SUPPORTS option today.

Ok!

>
>> +comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
>> +     depends on !BR2_LINUX_KERNEL
>> +     depends on !BR2_INSTALL_LIBSTDCPP
>
>         depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>
>> +SYSDIG_VERSION = 0.1.99
>> +SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
>> +SYSDIG_LICENSE = GPLv2
>> +SYSDIG_LICENSE_FILES = COPYING
>> +SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF
>> +SYSDIG_DEPENDENCIES += zlib luajit libjson linux
>
> Replace += by = here.

Ok!

>
> Thanks!

Thank you too!

Sincerely, Angelo

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

[1] http://www.sysdig.org/wiki/how-to-install-sysdig-from-the-source-code/



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
