From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 24 May 2019 22:05:12 +0200
Subject: [Buildroot] [PATCH v2 05/12] package/flare-engine: fix
 BUG_85180 build timeout
In-Reply-To: <20190524215853.4ee3ddbc@windsurf.home>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-6-giulio.benetti@micronovasrl.com>
 <20190524215853.4ee3ddbc@windsurf.home>
Message-ID: <6fbb9a9d-b836-97dd-5bd2-f9d3dcb06a57@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 24/05/2019 21:58, Thomas Petazzoni ha scritto:
> On Tue, 21 May 2019 15:39:25 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> With Microblaze Gcc version < 8.x build hangs on compiling last files.
>> This is due to bug 85180:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
>> Bug shows up building flare-engine with optimization but not when
>> building with -O0.
>>
>> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 by:
>> - setting CMAKE_BUILD_TYPE to Dummy to avoid CMakeLists.txt to impose
>>    -O* and -g* flags
> 
> Why does flare-engine need this, but not jasper, which is also a
> CMake-based package ?

Because in flare-engine CMakeLists.txt there is no fallback to -O0, so 
that was the only decent way to force CMake to generate Makefiles 
without optimizations. I don't like it very much but it was the only way 
I've found.

Thank you for reviewing and improving all commit logs!

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

> Thanks,
> 
> Thomas
> 
