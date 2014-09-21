From: Alan Yaniger <alan@tkos.co.il>
Date: Sun, 21 Sep 2014 11:29:32 +0300
Subject: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in
 eclipse integration
In-Reply-To: <29f0b41a7df34e8297bdc9049e5a3add@DBXPR07MB142.eurprd07.prod.outlook.com>
References: <8cbab74434594ef7ab6e81bc2eb88441@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140916175503.7fdd3a7d@free-electrons.com>
 <56a77dc5115b45f194ca8744a6962fac@DBXPR07MB142.eurprd07.prod.outlook.com>
 <29f0b41a7df34e8297bdc9049e5a3add@DBXPR07MB142.eurprd07.prod.outlook.com>
Message-ID: <541E8C6C.7030608@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Oded,

This workaround worked for me without the full path as well.

Alan

On 09/20/2014 12:43 PM, Oded Hanson wrote:
> BTW. As an interim workaround, I just manually change the linker command to:
>
> /home/oded/dev/buildroot-2014.08/output/host/usr/bin/x86_64-buildroot-linux-gnu-ar
>
> And this builds my library.
>
> Oded
>
> -----Original Message-----
> From: Oded Hanson
> Sent: Saturday, September 20, 2014 10:57 AM
> To: 'Thomas Petazzoni'
> Cc: 'buildroot at busybox.net'; 'M?lanie Bats'
> Subject: RE: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in eclipse integration
>
> Hello All
>
> I would like to update you that I retried this on a clean install.
>
> I installed eclipse Kepler 4.3 SR2.
>
> I installed the latest release of buildroot 2014.08 and created a output target and set it to integrate with buildroot.
>
> I installed the plugin from http://buildroot.org/downloads/eclipse/kepler-sr2
>
> I created an empty C static library project and choose the buildroot toolchain (it appears there in the list as expected).
>
> I added a simple C file and tried to build the project. This is what I received in the console:
>
> 10:39:38 **** Incremental Build of configuration debug for project TestStaticLib2 **** make all Building file: ../Test.c
> Invoking: Buildroot X86_64 C Compiler (/home/oded/dev/buildroot-2014.08/output)
> /home/oded/dev/buildroot-2014.08/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"Test.d" -MT"Test.d" -o "Test.o" "../Test.c"
> Finished building: ../Test.c
>
> Building target: TestStaticLib2.a
> Invoking: Buildroot X86_64 C Linker (/home/oded/dev/buildroot-2014.08/output)
> /home/oded/dev/buildroot-2014.08/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc  -o "TestStaticLib2.a"  ./Test.o
> /home/oded/dev/buildroot-2014.08/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/crt1.o: In function `_start':
> (.text+0x20): undefined reference to `main'
> collect2: error: ld returned 1 exit status
> make: *** [TestStaticLib2.a] Error 1
>
> 10:39:38 Build Finished (took 228ms)
>
> As you can see it tried to create an executable and not a static library and failing because it cannot find the main symbol.
>
> Where I go to project properties. To C/C++ Build. Settings and Build Artifact tab, in the artifact type list I can only see executable and shared library. There is no artifact for static library.
>
> Any ideas ?
>
> Oded
>
> -----Original Message-----
> From: Oded Hanson
> Sent: Tuesday, September 16, 2014 7:24 PM
> To: Thomas Petazzoni
> Cc: buildroot at busybox.net; M?lanie Bats
> Subject: RE: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in eclipse integration
>
> Hi Thomas
>
> I am not using autotools or a Makefile based project. I am creating a simple project based on the eclipse project wizards:
>
> 1. File -> New -> C++ Project
> 2.  Static Library -> Empty Project -> Choose Buildroot x86_64 toolchain 3. Finish
>
> Once the project is created, I go to Project properties -> C/C++ Build -> Settings -> Build Artifacts. I see there that there is only a shared object and executable option. No static library.
>
> When I go to the toolchain editor, I can see the list of tools (compiler, linker, etc.) but I don't see the archiver tool.. thus.. obviously that?s why we cannot build the static library.
>
> I will maybe try to uninstall everything and reinstall and see if it helps...
>
> Oded
>
>
>
> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Tuesday, September 16, 2014 10:55 PM
> To: Oded Hanson
> Cc: buildroot at busybox.net; M?lanie Bats
> Subject: Re: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in eclipse integration
>
> Dear Oded Hanson,
>
> On Fri, 5 Sep 2014 18:55:00 +0000, Oded Hanson wrote:
>
>> I am trying to build a static library in eclipse using the buildroot toolchain and the buildroot eclipse plugin.
>>
>> I have successfully created shared objects and executables but now
>> when I am trying to create a static library, I see that the eclipse
>> plugin doesn't identify the archiver tool, all though the
>> x86_64-buildroot-linux-gnu-ar tool was generated in my buildroot
>> output directory.
>
> Could you give a few more details about how you're building your static library? Are you using an autotools based project, a Makefile based project, or a "managed build" project (where Eclipse takes care of the build system) ? M?lanie has tested a "managed build" project for a static library, and apparently, it worked fine. So maybe you're using your own Makefile or autotools based build system?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Alan Yaniger
Tk Open Systems, Ltd
Telephone: 0546-841-481
Skype: alanyaniger
http://tkos.co.il
