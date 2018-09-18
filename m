From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 18 Sep 2018 10:01:40 +0200
Subject: [Buildroot] [PATCH 1/2] at: change upstream site, bump version
In-Reply-To: <20180918095726.50623f29@windsurf>
References: <20180917211219.17868-1-giulio.benetti@micronovasrl.com>
 <20180917211219.17868-2-giulio.benetti@micronovasrl.com>
 <20180918095726.50623f29@windsurf>
Message-ID: <34001101-5184-40d5-6234-ff89929b6c58@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 18/09/2018 09:57, Thomas Petazzoni ha scritto:
> Hello,
> 
> Thanks for working on this! This was definitely something that needed
> to be done for a long time!
> 
> On Mon, 17 Sep 2018 23:12:18 +0200, Giulio Benetti wrote:
>> Minicom is now available on a git repository at:
> 
> Minicom ? :-)

Oops.

> 
>> https://salsa.debian.org/debian/at
>> Main changes 3.1.16 -> 3.1.23:
>> - add support for SELinux, multiple files
>> - improve atd.service, see bug report 892819
>> - fix various bugs and warnings
>> - finalized script to release software
>>
>> So:
>> - change AT_SITE_METHOD to git pointing to release/3.1.23
>> - update tarball sha256 in hash file
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   ...-Makefile-fix-parallel-build-failure.patch | 33 +++++++++++++++++++
> 
> Is it really necessary to have a patch that fixes parallel build, if
> parallel build is not entirely fixed and you need $(MAKE1) anyway ?
> 
> I believe the patch is not necessary. Let's keep MAKE1 for now, and
> maybe report the parallel build issue upstream.

Ok, I'm going to submit v2.

By the way, testing it on qemu and also a colleague found that on arm 
board, atd needs .SEQ file before starting.
Do I have to add this to package?
I mean, if that file doesn't exists in target, then let's create it?

Thanks
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
