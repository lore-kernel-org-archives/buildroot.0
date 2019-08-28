From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 28 Aug 2019 22:20:19 +0200
Subject: [Buildroot] [PATCH buildroot-test] autobuild-run: add
 --flush-downloads argument to prevent false NOK due to not enough space on
 hard drive
In-Reply-To: <1acee2c7-86f0-ff53-71ae-79b3809f7657@mind.be>
References: <20180919114541.17670-1-giulio.benetti@micronovasrl.com>
 <1acee2c7-86f0-ff53-71ae-79b3809f7657@mind.be>
Message-ID: <13232fd8-6d40-5025-a7f4-b175203ccbb2@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Il 03/08/2019 14:46, Arnout Vandecappelle ha scritto:
>   Hi Giulio,
> 
>   Sorry to be so late in responding to this...

No problem!

> On 19/09/2018 13:45, Giulio Benetti wrote:
>> Some server/pc can have little hard drive, but high speed internet
>> connection. If disk is little, autobuild-run could generate some false
>> NOK reporting:
>> Fatal error: ...: No space left on device
>>
>> Add --flush-downloads argument to autobuild-run to delete entire
>> instance-*/dl/ folder everytime it creates a new instance.
> 
>   This probably doesn't *completely* solve the issue, because a single download
> can be very large as well.

Right.

>   We discussed this at the hackaton and decided that it would be more appropriate
> to instead tweak the number of files to delete from the download directory. By
> setting that number very high, you can approximate the same result (except that
> the git repos will never be touched). The code changes for that would be a lot
> simpler we think, and we think it's more suitable as an option.

Ok, I will do that.

Kind regards
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
