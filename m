From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 09:46:55 +0100
Subject: [Buildroot] [PATCH 1/4] configs: atmel: unify and update
 defconfig for Xplained boards
In-Reply-To: <20160324084344.GD12245@odux.rfo.atmel.com>
References: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
 <20160324094006.172567ac@free-electrons.com>
 <20160324084344.GD12245@odux.rfo.atmel.com>
Message-ID: <20160324094655.007db654@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 09:43:44 +0100, Ludovic Desroches wrote:

> On Thu, Mar 24, 2016 at 09:40:06AM +0100, Thomas Petazzoni wrote:
> > Hello,
> > 
> > I'm adding in Cc: Alexandre Belloni, who has worked on Atmel defconfigs
> > in the past.
> 
> He was in Cc.

Gah, my bad. Alex must have chosen in his mailing list preferences to
remove duplicates or something like that, because on the mailing list,
your Cc to Alex was clearly not visible. Hence my comment.

> > > - use bootstrap as first stage bootloader
> > 
> > As opposed to? Did you mean at91bootstrap3 rather than "bootstrap"?
> 
> As opposed to u-boot spl which is less tested than at91bootstrap3.

OK. I think Alex has a somewhat different opinion on the matter, but I
guess that if the vendor recommends to use at91bootstrap3, we should
use this solution in our defconfig.

> > This is not good. linux-4.1-at91 is a branch name, which means that the
> > actual source behind this branch name will change over time, making
> > this defconfig non-reproducible. You must stick to a tag or a commit id.
> 
> In fact it was the plan in order to prevent the need to update these
> defconfig files. If I must stick to a tag then I will use linux4sam
> releases.

We really want our defconfigs to be reproducible in terms of
bootloader/kernel versions. Otherwise, what people will build/test is
not something that the person submitting the defconfig has tested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
