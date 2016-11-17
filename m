From: Michael Brainerd <mbrainerd@protoprod.com>
Date: Thu, 17 Nov 2016 17:38:22 +0000
Subject: [Buildroot] Buildroot error
In-Reply-To: <20161115224708.043f0c31@free-electrons.com>
References: <D3FA0BA2E2AD54469423D3A670F43027238ED2AB@mail.protoprod.local>
 <8dee00da-0ff9-66de-2baf-c0b1f39dc96e@mind.be>,
 <20161115224708.043f0c31@free-electrons.com>
Message-ID: <D3FA0BA2E2AD54469423D3A670F43027238ED805@mail.protoprod.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

all,
Then there is no way to specify uClinux as the image to build?
Regards,
Michael Brainerd
________________________________________
From: Thomas Petazzoni [thomas.petazzoni at free-electrons.com]
Sent: Tuesday, November 15, 2016 4:47 PM
To: Arnout Vandecappelle
Cc: Michael Brainerd; buildroot at busybox.net
Subject: Re: [Buildroot] Buildroot error

Hello,

On Tue, 15 Nov 2016 22:39:32 +0100, Arnout Vandecappelle wrote:

> > >>>> linux-headers custom Syncing from source dir /home/mikeb/sandbox/buildroot-2016.08/uClinux-dist
> > rsync -au --chmod=u=rwX,go=rX --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS /home/mikeb/sandbox/buildroot-2016.08/uClinux-dist/ /home/mikeb/sandbox/buildroot-2016.08/output/build/linux-headers-custom
>
>  Either the linux tree in uClinux-dist is so old that it doesn't have the
> "headers_install" target yet (I think that's from 2.6.10-ish), or the tree
> you're pointing to is not actually a linux tree. In the first case, you also
> misconfigured your kernel headers, because you claim it's 4.7. But you probably
> just took the first thing you saw :-)

uClinux-dist is the name of the "distribution" around uClinux, and
uClinux-dist is pretty much a build system, like Buildroot. So it seems
like Michael has used the source code of a build system, and offered it
to Buildroot as the source of the Linux kernel. Obviously, this isn't
going to work very well.

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
CONFIDENTIALITY NOTICE

This e-mail message, including any attachments, may contain confidential information which is intended only for the use of the intended recipient(s). Any unauthorized review, use, disclosure, distribution, dissemination or action taken in reliance upon this information by persons or entities other than the intended recipient is prohibited. If you are not the intended recipient and this message has been addressed to you in error, please promptly notify the sender by email reply and destroy all copies of the message and any attachments.

EXPORT CONTROL NOTICE

This document and attachments may contain technical data as defined in the International Traffic In Arms Regulations (ITAR) 22 CFR 120.10 or the Export Administration Regulations (EAR) 15 CFR Parts 730 ? 780 . Export of this material may be controlled by these regulations and may not be exported or transferred to non-U.S. persons without prior written approval from the U.S. government.
