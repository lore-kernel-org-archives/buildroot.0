From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Feb 2016 09:34:25 +0100
Subject: [Buildroot] [PATCH 1/2] Update libaio to 0.3.110
In-Reply-To: <CAKmqyKMxwhK--iuO-nVBzx-=rmgr9dLWNasLE=Jn3eo99YoC9g@mail.gmail.com>
References: <1454719042-6185-1-git-send-email-alistair.francis@xilinx.com>
 <1454719042-6185-2-git-send-email-alistair.francis@xilinx.com>
 <56BBB13B.9060000@mind.be>
 <CAKmqyKMxwhK--iuO-nVBzx-=rmgr9dLWNasLE=Jn3eo99YoC9g@mail.gmail.com>
Message-ID: <56BC4791.3080909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-02-16 23:43, Alistair Francis wrote:
> On Wed, Feb 10, 2016 at 1:52 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 06-02-16 01:37, Alistair Francis wrote:
>>> Update libaio from 0.3.108 to 0.3.110. This adds AArch64 support.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>>  package/libaio/0001-arches.patch | 671 ---------------------------------------
>>>  package/libaio/Config.in         |   2 +-
>>>  package/libaio/libaio.hash       |   4 +-
>>>  package/libaio/libaio.mk         |   2 +-
>>>  4 files changed, 4 insertions(+), 675 deletions(-)
>>>  delete mode 100644 package/libaio/0001-arches.patch
>>>
>>> diff --git a/package/libaio/0001-arches.patch b/package/libaio/0001-arches.patch
>>> deleted file mode 100644
>>> index c85568c..0000000
>>> --- a/package/libaio/0001-arches.patch
>>> +++ /dev/null
>>> @@ -1,671 +0,0 @@
>>> -Patch borrowed from OpenEmbedded, available at
>>> -recipes/libaio/libaio-0.3.106/00_arches.patch in their source
>>> -tree. The patch has been adapted to remove the ARM-related
>>> -definitions, since they have been merged in later versions of libaio.
>>> -
>>> -The patch adds various architecture specific definitions (syscall
>>> -number and macros) for m68k, MIPS, PA/RISC and Sparc. Amongst these,
>>> -Buildroot mostly only cares about MIPS, but it was just easier to take
>>> -the whole OpenEmbedded patch.
>>> -
>>> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>
>>  Why did you remove this patch? As far as I can see, there is nothing upstream
>> that adds mips support. Or is syscall-generic good enough?
> 
> This patch no longer applies, so I just assumed that it had been merged.
> 
> Just for the record this is the error I get:
> 
> Applying 0001-arches.patch using patch:
> patching file src/libaio.h
> Hunk #1 FAILED at 83.
> 1 out of 1 hunk FAILED -- saving rejects to file src/libaio.h.rej
> patching file src/syscall-m68k.h
> patching file src/syscall-mips.h
> patching file src/syscall-parisc.h
> The next patch would create the file src/syscall-sparc.h,
> which already exists!  Skipping patch.
> 1 out of 1 hunk ignored
> patching file src/syscall.h
> Hunk #1 FAILED at 24.
> 1 out of 1 hunk FAILED -- saving rejects to file src/syscall.h.rej
> Patch failed!  Please fix 0001-arches.patch!

 Looks like it was partially merged then. You'll have to rework the patch so it
applies to the new version. We're only interested in the mips bit, so that
should be easy to do.

 Please also do at least a build test (and preferably a runtime test using qemu)
on MIPS. Or you can ask one of the imgtec people to do a runtime test. (Putting
Vicente in Cc for that.)


 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
