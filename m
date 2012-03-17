From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 17 Mar 2012 16:42:46 -0400
Subject: [Buildroot] [PATCH v2 2/2] BeagleBone: new board
In-Reply-To: <201203140119.08639.arnout@mind.be>
References: <1331561609-26989-1-git-send-email-fhunleth@troodon-software.com>
 <201203140119.08639.arnout@mind.be>
Message-ID: <CA+-urNRMBA+7Vwy-a5aeu2JiX+3VotbNj7hEbK7OhLb42fZs0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Mar 13, 2012 at 8:19 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Monday 12 March 2012 15:13:29 Frank Hunleth wrote:
>> ?board/beaglebone/linux-3.2.9.config ? ? ? ? ? ? ? ?| ?820 ++++++++++++++++++++
>
> ?That kernel config looks a bit bloated. ?Is this based on the am33x
> defconfig? ?There are even some modules in there that can't possibly be
> wired to a beaglebone, like a parallel port...

Yes. It is huge. I tried to prepare people for it in a previous email,
but I suspect this was not a possible task.

What I tried to do was make minimal modifications to the defconfig
that is currently in the Beagleboard's "official" kernel repository.
Based on who made it, it is either the same as one in the Angstrom
distribution or heavily inspired by it. Angstrom seems well supported
by the Beaglebone devs which was why I originally picked to make
minimal mods to it. There is another defconfig available for the TI's
AM335x EVM. It looks smaller, but I haven't gone through it in detail
to see if it's missing anything needed for the Beaglebone.

What are your thoughts on the defconfig to use?

  1. Try to remain close to either the Angstrom or AM335x EVM one
  2. Create a minimal one

I have a defconfig that I use for my Beaglebone that is much, much
smaller and could probably chop out some options that I may only care
about if #2 is preferred. Also, if there happens to be a
guide/example/doc somewhere that someone wrote that specifies what a
good buildroot defconfig looks like, I'll follow that for my next
patch submission.

Thanks,
Frank
