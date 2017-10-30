From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Oct 2017 23:26:54 +0100
Subject: [Buildroot] [PATCHv4] package/glibc: switch to using the
 maintenance branch
In-Reply-To: <1509361625.3930.10.camel@synopsys.com>
References: <20171029095248.24830-1-yann.morin.1998@free.fr>
 <20171029155251.7c321e00@windsurf>
 <1509361625.3930.10.camel@synopsys.com>
Message-ID: <20171030222654.GB3150@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2017-10-30 11:07 +0000, Alexey Brodkin spake thusly:
> On Sun, 2017-10-29 at 15:52 +0100, Thomas Petazzoni wrote:
> > On Sun, 29 Oct 2017 10:52:48 +0100, Yann E. MORIN wrote:
> > > glibc upstream has ruled against doing regular point-releases, but they
> > > do have a lot of interesting and important fixes for regressions and
> > > security.
[--SNIP--]
> Sorry for a bit late reply - was catching up after ELCE journey.

Yup, same here! Was nice seeing you again there. :-)_

> Back in the day when we added support of Glibc for ARC we intentionally
> left glibc patches where they were so they were applid to ARC version of glibc as well.
> 
> Now those patches are gone. I'm wondering if some of them were fixing real problems
> discovered in Buildroot?

When he bumped the version to 2.26, Romain noticed a few issues, and
cherry-picked the relevant few patches. So yes, they were for real
problems.

> If so then we may want to get them back for ARC until we
> rebase ARC glibc on top of more recent upstream version where some if not all of those
> patches are already integrated.
> 
> IIRC the patches in question were applied to ARC's glibc version without issues,
> i.e. corresponding commits were not there yet for us.

The issue is that there are now 73^W75 patches on the 2.26 maintance
branch, and we don't really know what to use/not to use. So we decided
to use all of it and do it via a git clone.

Since you, Synopsys, are providing glibc from a git branch as well (I
just noticed that there was a release tagged a few days ago, btw), I
think it is up to you to base your branch on whatever upstream commit
you believe makes sense, and backport/cherry-pick/merge whatever you see
fit in your branch.

Definitiely, the idea is to not cary in Buldroot a patch that is in the
upstream branch.

I think we could very well get an exception for a very few patches,
specific to the ARC port, to live in package/glibc/arc-2017.09-eng010/
if need be, for the upcoming release, though.

Hopefully, that situation will resolve itself as soon as ARC support
lands upstream. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
