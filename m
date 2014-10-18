From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 13:34:46 +0200
Subject: [Buildroot] [PATCH v3] rpi-userland: bump revision for musl
 compile fixes
In-Reply-To: <20141018110508.GC3858@free.fr>
References: <1410541269-32529-1-git-send-email-maarten@treewalker.org>
 <1413561468-27240-1-git-send-email-maarten@treewalker.org>
 <20141018110508.GC3858@free.fr>
Message-ID: <20141018113446.GA31723@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maarten, All,

On 2014-10-18 13:05 +0200, Yann E. MORIN spake thusly:
> On 2014-10-17 17:57 +0200, Maarten ter Huurne spake thusly:
> > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> > ---
> > The second version of this patch was missing the "v2" label; this is
> > the third version.
> > 
> > The changes from v2, plus an additional change I made later were merged
> > upstream. This patch bumps the git revision to the merge commit.
> > 
> > rpi-userland-002-remove-faulty-assert.patch had to be updated to match
> > other changes in the code that are pulled in by the version bump.
> > I checked that the updated patch compiles fine, but I have no idea
> > whether it is still needed to fix or work around a runtime problem.
> 
> So, I have tested this bump: weston on the rpi no longer works, with or
> without the asser patch.
> 
> So, I NAK this bump for now.
> 
> I'll see to bisect rpi-userland to see where it breaks.

The culprit is:
    66338d3 vc_dispmanx: Fix vsync service use counting

Unfortunately, weston has yet no fix for that, and I could not spot any
fix for rpi-userland either... :-/

So, still NAK for this bump. We can still bump it up to ba753c1 as this
still works, but is not enough to get the musl fixes.

Maybe we could just hide it for musl for now?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
