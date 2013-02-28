From: James Hogan <james.hogan@imgtec.com>
Date: Thu, 28 Feb 2013 12:11:35 +0000
Subject: [Buildroot] [PATCH] gdb: convert to the package infrastructure
In-Reply-To: <20130228094741.50f605fc@skate>
References: <1361916812-29395-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <512F0EAD.4080406@mind.be> <512F17B6.70501@imgtec.com>
 <20130228094741.50f605fc@skate>
Message-ID: <512F4977.6000402@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 28/02/13 08:47, Thomas Petazzoni wrote:
> On Thu, 28 Feb 2013 08:39:18 +0000, James Hogan wrote:
> 
>>> * It really doesn't make sense to build host-gdb without a
>>> gdbserver for the target. So I would auto-select gdbserver from
>>> host-gdb.
>>
>> Kgdb (kernel debugging) is one use case where you'd want host-gdb
>> without necessarily gdbserver.
> 
> Hum, correct.
> 
>>> * Does it really make sense to keep options for four different gdb
>>> versions? Can't we just remove the user-selectable version
>>> completely?
>>
>> The option is useful for arches which don't have their gdb port
>> upstream yet, giving them a chance to update their patches.
> 
> Not sure to follow here: Arnout mentions the choice list of gdb
> versions, which only have a limited number of choices already. If you
> need Buildroot to use some custom gdb version, then you already have to
> modify Buildroot anyway. Or maybe I'm missing the point you're making?

Yes, but the modification is as simple as adding a patch file in the
right place.

Cheers
James
