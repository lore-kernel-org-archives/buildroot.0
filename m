From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Apr 2014 00:42:29 +0200
Subject: [Buildroot] Patchwork cleanup #9: triaging proposal
In-Reply-To: <CAAXf6LW5GPZ_vegt_jO=xr0e5Qfzjt4Uq7yye6jF3si6qyycBQ@mail.gmail.com>
References: <CAAXf6LW5GPZ_vegt_jO=xr0e5Qfzjt4Uq7yye6jF3si6qyycBQ@mail.gmail.com>
Message-ID: <20140424224229.GC3186@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-04-24 21:46 +0200, Thomas De Schampheleire spake thusly:
> Hi all,
> 
> This is the first part of patchwork cleanup session #9.
> 
> Quick recap:
> - in this mail, a decision for a number of patches (exact number can
> vary) is already proposed. Buildroot developers should provide
> feedback stating their agreement/disagreement with this proposed
> decision.
> 
> - patches are triaged into four categories:
>     A. We want this patch and someone should refresh and resend it.
>     B. We don't want this patch as it goes against Buildroot principles.
>     C. We're not sure and want to know if the submitter is still
> interested in pursuing this patch.
>     D. We accept the problem that the patch is fixing, but the patch
> can't be integrated in its current state. More work is needed, for
> example on the core buildroot infrastructure. Therefore, the patch
> will be added to the buildroot TODO list.
> 
> - after the brief agreement/disagreement phase, patch submitters are
> notified and get two weeks to provide feedback and/or fight the
> decision. Patchwork is already updated at the beginning of these two
> weeks, but closed patches can always be reopened.
> 
> - during this two week cool-off period, new cleanup sessions can already start.
> 
> 
> Triage proposal for this session:
> 
> 
> [1/1] Option to copy Linaro gconv libs to target
> Stanislav Vasic <svlasic@gmail.com>
> http://patchwork.ozlabs.org/patch/288022
> 
> C unsure: the commit message mentions this is needed for xbmc, but
> xbmc has been merged now without this change.

I now Maxime has had a few issues with XBMC because it was lacking the
gconv stuff. It did manifest itself with broken (ie not rendering)
subtitles, due to missing charsets.

Sure, this is not required for XBMC to build and run properly, but it
seems it is needed for proper rendering of subtitles.

However, the patch limits it to Linaro gnueabihf toolchains, when it is
in fact a property og the C library. It should probably be switched to
"depends on glibc" instead.

So, I'd say: A, adopt, refresh, resend. I think I can find sometime for
this in the coming days, or Maxime might look at it since he's the one
that needs to read subtitles. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
