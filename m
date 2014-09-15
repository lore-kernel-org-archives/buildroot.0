From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Sep 2014 13:30:50 -0500
Subject: [Buildroot] [PATCH 1/1] omniorb: limit to glibc toolchains
In-Reply-To: <20140915200619.198ff41f@free-electrons.com>
References: <1410790650-61308-1-git-send-email-Matthew.Weber@rockwellcollins.com>
 <20140915200619.198ff41f@free-electrons.com>
Message-ID: <CANQCQpanft746pTHcvDeNSkdXXkpbjS7x5YrAzMyqwN5E8ukJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Sep 15, 2014 at 1:06 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Matt Weber,
>
> On Mon, 15 Sep 2014 09:17:30 -0500, Matt Weber wrote:
> > Resolves autobuilder failure where the omniorb package doesn't
> > correctly detect the OS because the configure script doesn't have
> > an option for uclinux support.  This results in a pthread create
> > assertion when it attempts to figure-out the correct C library
> > posix calls.
> >
> >
> http://autobuild.buildroot.net/results/fbe6c722b92fe4ddf7ac36a8fe1be3a3891c11fd/
> >
> > Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
>
> Wait, wait, wait, no.
>
> uclinux != uclibc.
>
> uclinux is the part of the host tuple used only on noMMU platforms that
> don't support shared libraries.
>
> If you use uClibc on ARM, it's not a uClinux system.
>
> So, clearly, disabling entirely the package for uClibc doesn't make
> sense here.
>

Thank you for that clarification, that makes a bit more sense on why this
issue didn't come up as often in the autobuilds.  I would assume that
updating this path to a needs MMU instead is the correct approach.



>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140915/b7aea58f/attachment.html>
