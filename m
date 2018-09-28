From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 28 Sep 2018 09:07:22 +0200
Subject: [Buildroot] [PATCH] android-tools: fix minor()/major() build
 failure due to glibc 2.28
In-Reply-To: <20180909151918.0d640d18@windsurf.home>
References: <20180909095939.17089-1-giulio.benetti@micronovasrl.com>
 <20180909151918.0d640d18@windsurf.home>
Message-ID: <6983ec9a-9530-5966-d256-64ee31c8d11e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 09/09/2018 15:19, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Sun,  9 Sep 2018 11:59:39 +0200, Giulio Benetti wrote:
>> glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
>> and therefore <sys/sysmacros.h> must be included explicitly when
>> major()/minor() are used.
>>
>> This commit adds a patch to directly include <sys/sysmacros.h> into
>> all usb_linux.c files where minor() and major() macros are used.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/901/9011c6af71fb81988c2a05f2acee913a2bae2eff//
>> http://autobuild.buildroot.net/results/142/142c5672fdc44f2d68f18df3509e5051b3295df5//
>> http://autobuild.buildroot.net/results/b55/b55aa69654e758af5232ae69618ba1ea5c245074//
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   ...smacros.h-to-compile-with-glibc-2.28.patch | 42 +++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>   create mode 100644 package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
> 
> Applied to master, thanks.
> 
> Thomas
> 

This can be applied to 2018.02.x too and fixes:
http://autobuild.buildroot.net/results/84da49002f16c9b294ac8c896f53718b90543100/

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
