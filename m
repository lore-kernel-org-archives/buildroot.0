From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 17 Sep 2018 23:44:11 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix static build with openssl
In-Reply-To: <20180917232217.456114cf@windsurf>
References: <20180909085119.27976-1-fontaine.fabrice@gmail.com>
 <20180909141612.43915a59@windsurf.home>
 <CAPi7W81tAT9=LeVBT6gCR7a57S72ynpganrm4rSLq5viv4oUqw@mail.gmail.com>
 <20180909150919.546beda4@windsurf.home>
 <c7ee69a4-ece1-2161-f0a4-d0bbb5dc14ad@micronovasrl.com>
 <20180917232217.456114cf@windsurf>
Message-ID: <46326894-d52f-5597-66aa-a3b4903967e3@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 17/09/2018 23:22, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Mon, 17 Sep 2018 22:37:30 +0200, Giulio Benetti wrote:
> 
>> During this day I've submit a patch to net-snmp upstream,
>> then they've corrected it.
>> After they committed another patch.
>> And now I'm waiting for Merge Request to be accepted to fix this bug.
>>
>> It was a mixture of problem:
>> - lack of -lssl in checking during configure(mainly DTLS support)
>> - lack of -lz in checking during configure for a bunch of functions
>>
>> I'm going to take over and send BR patch I've done in-reply-to this.
> 
> And they still don't want to use pkg-config instead of this mess of
> checking transitive dependencies manually ?

Judging from their master branch and checking the other branches it 
seems not.

If they use pkg-config for libnl as Fabrice mentioned maybe they would 
consider the idea.
Maybe they only need some help from someone else(sure more experienced 
than me).

I could open a "Feature Request" on Source Forge after this bug
is solved also for them and upstream my last patch.
I've seen they are responsive today.
What do you think?

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
