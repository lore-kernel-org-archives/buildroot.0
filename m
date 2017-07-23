From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 22 Jul 2017 21:03:18 -0500
Subject: [Buildroot] [PATCH v3 1/1] paxtest: new package
In-Reply-To: <CANQCQpbcDe37x4wUh15OYoNSodeYXCdyN0skPfF+TYq53pHQxw@mail.gmail.com>
References: <1499427897-36149-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170722153534.16f24300@windsurf>
 <CANQCQpbcDe37x4wUh15OYoNSodeYXCdyN0skPfF+TYq53pHQxw@mail.gmail.com>
Message-ID: <CANQCQpZwZDS18rK96Pm_mRGODAXPR395EcC3DfBqwJ-143eD6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Jul 22, 2017 at 4:42 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Thomas,
>
> On Sat, Jul 22, 2017 at 8:35 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Fri,  7 Jul 2017 06:44:57 -0500, Matt Weber wrote:
>>> PaX regression test suite
>>>
>>> Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
>>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>> ---
>>> Changes v2 -> v3
>>> [Arnout V
>>>  - Add Config.in comment when glibc toolchain not used
>>>  - Removed PAXTEST_SOURCE assignment as it was default
>>>  - Updated ARMv# patch to be anything less then v7 instead of
>>>    a range from 4-7
>>>  - Tested that TARGET_CONFIGURE_OPTS could be used and added it in
>>>  - Updated LD= to use TARGET_CC and enclosed in quotes
>>
>> Applied to master, thanks. However, I have to say I very much dislike
>> the fact that a bunch of executable programs are installed right
>> into /usr/lib and not /usr/lib/paxtest or something like that. But
>> apparently RUNDIR is used to install both an actual shared library
>> (which must be in /usr/lib) and those executable programs.
>>
>> Perhaps we could set RUNDIR=/usr/lib/paxtest, and as a post install
>> hook, move the single shared library being installed back
>> into /usr/lib ?
>>
>> Could you test doing this ?
>>
>

Looks like the /usr/bin/paxtest script (which uses the items installed
into RUNDIR) includes handling for LD_LIBRARY_PATH.  So we can just
update the RUNDIR location and everything falls into place for test
apps and shared libs.

https://patchwork.ozlabs.org/patch/792516/

Matt
