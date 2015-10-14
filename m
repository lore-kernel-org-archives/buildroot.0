From: Jordan Yelloz <jordan@yelloz.me>
Date: Wed, 14 Oct 2015 09:14:22 -0700
Subject: [Buildroot] [PATCH 1/1] systemd: imported fix for journald
 SIGABRTs.
In-Reply-To: <CAGduivwsL3fEHHF5CBwpnkgk6fBjuVH6CMSBMm-r794Gd1t3ZQ@mail.gmail.com>
References: <1444708715-4696-1-git-send-email-jordan@yelloz.me>
 <CAGduivwRwmxVZeKK0Jx+QM8us8yzrSWzG_dT8RD4zS7W5UfCFw@mail.gmail.com>
 <20151013095314.55f01730@free-electrons.com>
 <CAGduivwsL3fEHHF5CBwpnkgk6fBjuVH6CMSBMm-r794Gd1t3ZQ@mail.gmail.com>
Message-ID: <561E7F5E.8090204@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/13/2015 01:15 AM, Maxime Hadjinlian wrote:
> Hi Jordan
> 
> On Tue, Oct 13, 2015 at 9:53 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com
> <mailto:thomas.petazzoni@free-electrons.com>> wrote:
> 
>     Maxime, Jordan,
> 
>     On Tue, 13 Oct 2015 09:47:20 +0200, Maxime Hadjinlian wrote:
> 
>     > On Tue, Oct 13, 2015 at 5:58 AM, Jordan Yelloz <jordan at yelloz.me <mailto:jordan@yelloz.me>> wrote:
>     >
>     > > Prior to applying this patch, assertion errors would reliably be displayed
>     > > on the
>     > > console. These failed assertions led to crashes in systemd-journald on
>     > > startup.
>     > >
>     > > This patch fixes systemd bug #512:
>     > > <https://github.com/systemd/systemd/issues/512>
>     > >
>     > NAK on this one.
> 
>     I clearly don't think "NAK on this one" is the appropriate way to react
>     to a contribution, especially when the contribution in question is only
>     the second one from Jordan.
> 
>     Here is a much more appropriate response for Jordan:
> 
> I apologies about the tone of my mail, I though you were an older
> contributor I seems to recalled your name, anyway, that's not an excuse
> for this.
> Don't take it bad and please send many more patches :)
> 
> 
>     """
>     Jordan,
> 
>     Thanks for your patch! However, it turns out that another patch was
>     already posted some time ago to bump the systemd version from 221 to
>     226 (see https://patchwork.ozlabs.org/patch/525867/). Since systemd
>     v226 already includes the fix for the problem you're pointing to, it
>     seems like a better idea to upgrade systemd to v226 rather than
>     backporting just this one fix.
> 
>     Consequently, we will mark your patch as "Rejected" in our patch
>     tracking system, as we will favor the systemd update instead. However,
>     what you could do is test the patch at
>     https://patchwork.ozlabs.org/patch/525867/ and if it works for you,
>     report a Tested-by.
> 
>     Thanks!
>     """
> 
>     Best regards,
> 
>     Thomas
>     --
>     Thomas Petazzoni, CTO, Free Electrons
>     Embedded Linux, Kernel and Android engineering
>     http://free-electrons.com
> 
> 

It's not a big deal. I was not aware of the proposed patch to upgrade to
systemd 226/227. I just assumed support for systemd was lagging behind,
which is clearly not the case. I have imported patch #525867 and will
test it soon.

Anyway, to provide a bit of justification to my actions, I am working
off of the latest stable branch of buildroot (2015.08.x) and I saw my
patch as strictly a bug-fix patch that wouldn't add any new package
requirements or configuration options and one that fixes a critical
defect (at least in my use case) in systemd 221.

--
Jordan
