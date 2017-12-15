From: Kees van Unen <keesvanunen@hotmail.com>
Date: Fri, 15 Dec 2017 20:41:16 +0000
Subject: [Buildroot] FW: [PATCH] kvm-unit-test: revert use of RDSEED and
 RDRAND
In-Reply-To: <CANQCQpaDCyJLRZRk5mwun3sGy1Ex7WVZO5E35YZM02m-Synv-g@mail.gmail.com>
References: <20171207043631.9312-1-matthew.weber@rockwellcollins.com>
 <20171214094459.4b383336@windsurf.png.is.keysight.com>,
 <CANQCQpaDCyJLRZRk5mwun3sGy1Ex7WVZO5E35YZM02m-Synv-g@mail.gmail.com>
Message-ID: <a3a0c79e67a1401790816def9d2db5f9@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensMatthew Weber
Verzonden: vrijdag 15 december 2017 21:41:05 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: Thomas Petazzoni
CC: buildroot
Onderwerp: Re: [Buildroot] [PATCH] kvm-unit-test: revert use of RDSEED and RDRAND

Thomas,

On Thu, Dec 14, 2017 at 2:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Wed,  6 Dec 2017 22:36:31 -0600, Matt Weber wrote:
> > Removing this commit in buildroot as it causes
> > build failures when the host binutils isn't
> > at least 2.23 (2.22.x introduced RDSEED).
> >
> > The host toolchain is used for x86_64 target
> > builds where we need to do a 32bit build.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> What is the long term solution for this? Has the problem been reported
> upstream?

It isn't really a bug upstream.  I think the long term fix would be a
check for a minimum binutils version.  Can you think of another case I
could use as an example where a evolution in the binutils has required
a minimum version?

>
> > diff --git a/package/kvm-unit-tests/0002-Revert-x86-vmx-test-RDRAND-and-RDSEED.patch b/package/kvm-unit-tests/0002-Revert-x86-vmx-test-RDRAND-and-RDSEED.patch
> > new file mode 100644
> > index 0000000000..1d3fb1ca6a
> > --- /dev/null
> > +++ b/package/kvm-unit-tests/0002-Revert-x86-vmx-test-RDRAND-and-RDSEED.patch
> > @@ -0,0 +1,66 @@
> > +From ff6ee5c5345e5a55827d657d8d862237338b6edb Mon Sep 17 00:00:00 2001
> > +From: Matt Weber <matthew.weber@rockwellcollins.com>
> > +Date: Wed, 6 Dec 2017 22:30:04 -0600
> > +Subject: [PATCH] Revert "x86: vmx: test RDRAND and RDSEED"
> > +
> > +Removing this commit in buildroot as it causes
> > +build failures when the host binutils isn't
> > +at least 2.23 (2.22.x introduced RDSEED).
> > +The host toolchain is used for x86_64 target
> > +builds where we need to do a 32bit build.
> > +
> > +Fixes:
> > +http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/
> > +
> > +This reverts commit a88205d14320d2f681a6c220f1d08711b9ce3885.
>
> Missing SoB.

Opps, noted.

Matt
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
