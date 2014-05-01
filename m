From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 1 May 2014 21:16:42 +0200
Subject: [Buildroot] [PATCH 02/29] ARC: [eznps] support OVERRIDE_SRCDIR
 feature for uclibc
In-Reply-To: <CAAXf6LU5jFOfQEA9xehYRe7HQP4S+Yc8xOeVZxWcd_i3k7vaqA@mail.gmail.com>
References: <264C179F799EF24AB26D5319053335E80E59BD78A3@ezexch.ezchip.com>
 <20131223085236.4da230a4@skate>
 <884EA965490E3C4D8E66AEF41E980250060E6E@ezex10.ezchip.com>
 <20140217113219.5da02ed6@skate>
 <CAAXf6LU5jFOfQEA9xehYRe7HQP4S+Yc8xOeVZxWcd_i3k7vaqA@mail.gmail.com>
Message-ID: <CAAXf6LV-+ZmBGPq9ROO4nUOQirrFEC3qbgPCYVnL5FaaRjdo3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Feb 17, 2014 at 11:36 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi,
>
> On Mon, Feb 17, 2014 at 11:32 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Noam Camus,
>>
>> On Mon, 17 Feb 2014 08:10:17 +0000, Noam Camus wrote:
>>
>>> Is there anything I can do to help in applying those commits?
>>>
>>> Noam
>>> Note: at the moment only one out of five was applied.
>>
>> Yes, I believe you could resend them, rebased on top of the current
>> -next branch, in a patch series that only includes those patches (the
>> fact that you sent only 5 patches, but they were number <something>/29
>> was quite confusing).
>>
>> Also, make sure each of your commits has a long enough commit log to
>> allow reviewers to understand what problem the commit is fixing, and
>> how the solution works.
>
> This specific patch 02/29 (uClibc .config) is at least partially
> addressed in the meantime, with commit
> http://git.buildroot.org/buildroot/commit/?id=a25df76b39863e5d1a4e927696bf83055e8ce244

The second part of this patch should also be fixed now: we no longer
use --cvs-exclude in the rsync step, but have an explicit list of
version-controlled directories to exclude from the rsync. The pattern
*.old is not in the exclusion list, so is copied from the overriden
dir.

I'm therefore marking this patch as Superseded in patchwork.
Do let me know if you think my analysis is not correct.

Best regards,
Thomas
