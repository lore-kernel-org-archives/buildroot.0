From: daggs <daggs@gmx.com>
Date: Sat, 18 Nov 2017 08:43:31 +0100
Subject: [Buildroot] out of tree kernel patches question
In-Reply-To: <20171117212417.43162ed7@windsurf.lan>
References: <trinity-0d97f4a0-c1ac-416e-bfea-7bcafcb3ce1d-1510924577452@3c-app-mailcom-bs07>
 <20171117212417.43162ed7@windsurf.lan>
Message-ID: <trinity-0708c540-baa1-463a-a0ad-5bf573ebc7e7-1510991011672@3c-app-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Friday, November 17, 2017 at 10:24 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: daggs <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] out of tree kernel patches question
>
> Hello,
> 
> On Fri, 17 Nov 2017 14:16:17 +0100, daggs wrote:
> 
> > when it comes to the odroidc2 support, there are 3 things that I'm concerned about:
> > 1. gcc is limited to 4.9.x
> > 2. old uboot (2005.11).
> > 3. very old kernel (3.14.79).
> > 
> > #1 is needed because #2, currently upstream uboot support this board
> > from 2007.05 but I've tried for months to get upstream uboot to work
> > with the vendor's kernel without any luck. unfortunately, the uboot
> > mailing list isn't helpful at all (no one seems to care much), this
> > means that in order to solve issue #2, the kernel needs to be
> > upgraded.
> 
> > latest upstream kernel holds bask support for this board, the
> > development is progressing. now assuming that I take patches existing
> > in the kernel mailing list that adds missing support for features in
> > the kernel to a point that the board can be used in a decent manner,
> > what is the policy of adding out of the kernel patches to a board in
> > buildroot?
> 
> We are generally OK to integrate kernel patches if they are merged
> upstream already, or seriously on their way upstream. Also, we can do
> this only if the stack of patches is not several hundreds of patches.
> 
> Best regards,
> 
> Thomas

my main objective is to ditch the annoying gcc 4.9.x dependency, as said, most of the patches where submitted into the kernel's mailing list for review so I guess they can be refered as "seriously on their way upstream".

I've looked into the patches, there is one thing missing that is needed for some use case, there is no hw acceleration. the board supports 4k decoding (only via vendor's own player or kodi), the board doesn't have desktop effects acceleration as far as I know. beside that, I think that even the most latest stable kernel version + a handful of patches, this can work.
so I'd like to propose adding a new buildroot config named odroidc2-next which will support that along side the existing one.
with time, hopefully, the old one will be replaced by the new one.

any objections?

Dagg.
