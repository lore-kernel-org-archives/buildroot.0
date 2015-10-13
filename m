From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 09:53:14 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: imported fix for journald
 SIGABRTs.
In-Reply-To: <CAGduivwRwmxVZeKK0Jx+QM8us8yzrSWzG_dT8RD4zS7W5UfCFw@mail.gmail.com>
References: <1444708715-4696-1-git-send-email-jordan@yelloz.me>
 <CAGduivwRwmxVZeKK0Jx+QM8us8yzrSWzG_dT8RD4zS7W5UfCFw@mail.gmail.com>
Message-ID: <20151013095314.55f01730@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, Jordan,

On Tue, 13 Oct 2015 09:47:20 +0200, Maxime Hadjinlian wrote:

> On Tue, Oct 13, 2015 at 5:58 AM, Jordan Yelloz <jordan@yelloz.me> wrote:
> 
> > Prior to applying this patch, assertion errors would reliably be displayed
> > on the
> > console. These failed assertions led to crashes in systemd-journald on
> > startup.
> >
> > This patch fixes systemd bug #512:
> > <https://github.com/systemd/systemd/issues/512>
> >
> NAK on this one.

I clearly don't think "NAK on this one" is the appropriate way to react
to a contribution, especially when the contribution in question is only
the second one from Jordan.

Here is a much more appropriate response for Jordan:

"""
Jordan,

Thanks for your patch! However, it turns out that another patch was
already posted some time ago to bump the systemd version from 221 to
226 (see https://patchwork.ozlabs.org/patch/525867/). Since systemd
v226 already includes the fix for the problem you're pointing to, it
seems like a better idea to upgrade systemd to v226 rather than
backporting just this one fix.

Consequently, we will mark your patch as "Rejected" in our patch
tracking system, as we will favor the systemd update instead. However,
what you could do is test the patch at
https://patchwork.ozlabs.org/patch/525867/ and if it works for you,
report a Tested-by.

Thanks!
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
