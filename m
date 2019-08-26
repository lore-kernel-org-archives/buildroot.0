From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 26 Aug 2019 21:57:18 +0200
Subject: [Buildroot] Latest stable Buildroot version 2019.05.1 -
 qt5webengine builderror
In-Reply-To: <4583c78b-fde3-3167-8f0e-55398d6f483c@stettbacher.ch>
References: <4583c78b-fde3-3167-8f0e-55398d6f483c@stettbacher.ch>
Message-ID: <44fb361a-f109-f35d-abaf-fac7869d54d3@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

Il 21/08/2019 15:10, Patrick Koller ha scritto:
> Hi buildroot team :)
> 
> I am using the latest stable Buildroot version 2019.05.1, but I am
> facing a builderror with the qt5webengine and I hope, that someone could
> help me out with this issue.
> 
> My setup:
>   From a hardware point of view, I am using a Ka-Ro TX6QP
> computer-on-module with an i.mx6 (ARM Cortex-A9) processor. For this
> reason, I am using the Linaro ARM 2018.05 toolchain (Proposed by
> Buildroot 2019.05.1). The goal is to build the qt5webengine (Latest:
> Qt5.12.2) successfully.
> 
> The challenge, I am facing right now:
> I wanted to build the qt5webengine, but I got several error messages in
> this style:
> 
>> /home/patrickk/tmp/buildroot/buildroot-2019.05.1/buildroot-2019.05.1/output/host/opt/ext-toolchain/arm-linux-gnueabihf/include/c++/7.3.1/cstdlib:75:15:
>> fatal error: stdlib.h: No such file or directory
>>  ?#include_next <stdlib.h>
>>  ?????????????? ^~~~~~~~~~
>> compilation terminated.
> 
> A quick google search (https://bugreports.qt.io/browse/QTBUG-53367)
> showed a known problem with new GCC > 4.8 versions in respect of the
> argument "-isystem". Nevertheless, I was not able to solve my described
> problem at the source.
> 
> Next, I tried to update the linaro toolchain to the newest available
> version, but the same error showed off...
> Link:
> https://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz
> 
> My last attempt was to update Qt5 to version 5.13.0. This showed the
> following error:
>> In file included from
>> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_parameters_restrictions.cc:25:0:
>> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_parameters_restrictions.cc:
>> In function ?sandbox::bpf_dsl::ResultExpr sandbox::RestrictPtrace()?:
>> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_parameters_restrictions.cc:401:9:
>> error: ?PTRACE_GET_THREAD_AREA? was not declared in this scope
>>  ???????? PTRACE_GET_THREAD_AREA,
>>  ???????? ^
> I am not sure, if my update from Qt5.12..2 to Qt5.13.0 solved the first
> error or even introduced a second error...
> 
> It would be awesome, if someone could help me out or give me a hint. I
> appreciate every support I get :)
> I attached my .config file to this e-mail. If you need additional
> information, please do not hesitate to contact me.
> Thanks in advance.
> 
> 
> Best regards
> 
> Patrick
> 
> ===================================================
> Stettbacher Signal Processing
> Patrick Koller
> 
> Office:
> Neugutstrasse 54
> CH-8600 D?bendorf - Switzerland
> Phone +41 - 43 299 57 23
> Web: www.stettbacher.ch
> ===================================================
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

I was on holiday, I'm going to dig into this bug asap.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
