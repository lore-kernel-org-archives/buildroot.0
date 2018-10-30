From: =?UTF-8?Q?I=c3=b1igo_Huguet?= <inigohuguet@fanamoel.com>
Date: Tue, 30 Oct 2018 14:20:18 +0100
Subject: [Buildroot] gcc 8.2.0 support for buildroot 2015.11
In-Reply-To: <87in1kzqjk.fsf@dell.be.48ers.dk>
References: <CALD51P_=q448T76Mi66Sjcy8Lfdhi-UKBn0A33_6isVHU_-bFQ@mail.gmail.com>
 <87in1kzqjk.fsf@dell.be.48ers.dk>
Message-ID: <33b7beca-b21c-4692-034b-c88e72d139a7@fanamoel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I supose that you need gcc 8.2 to build a specific program. If you can't 
move to v2018.08.2, you can compile that program using gcc 8.2 out of 
buildroot, and create your own buildroot package to directly install the 
binaries, without building them from buildroot.

A bit more complex, but cleaner (not very much, though), you can create 
your own buildroot package which requires you to provide the path to an 
external gcc 8.2 compiler in Config.in. Then, pass that compiler path to 
the program from the buildroot package makefile. How to do that depends 
on the program build system, for example if it's an autotools package: 
PACKAGENAME_CONF_OPTS += CC=$(BR2_PACKAGE_PACKAGENAME_EXTERNAL_GCC_PATH)

(BR2_PACKAGE_PACKAGENAME_EXTERNAL_GCC_PATH would be the name of the 
option in Config.in to provide the path to the external compiler)

Of course, you will have less problems if you achieve to upgrade to 
newer versions of Buildroot, instead of trying to keep working an old 
and unsupported project.


El 29/10/18 a las 17:05, Peter Korsgaard escribi?:
>>>>>> "Lijun" == Lijun QIN <lijun.qin2008@gmail.com> writes:
>   > I generated gcc 8.2.0  arm-buildroot-linux-gnueabihf-gcc using
>   > buildroot-2018.08.2.
>   > I need to use arm gcc 8.2 to compile my project (buildroot 2015.11 + C++
>   > Codebase)  to leverage C++17 features.
>   > Buildroot 2015.11 seems to only support gcc up to version 5.x.
>   > Any patch to make 2015.11 to support arm gcc 8.2 as external toolchain ?
>
> Sorry, but you are on your own. Old software is unlikely to build with
> gcc 8.2 out of the box.
>
> Buildroot 2015.11 is (for a long time) no longer supported. What is
> keeping you from moving to Buildroot 2018.08.2?
>
