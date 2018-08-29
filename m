From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 09:12:54 +0200
Subject: [Buildroot] [PATCH] mender: fix ioctl build failure on
 powerpc64le / power8
In-Reply-To: <CA+_SqVZ0B7mH+fou8=V9b4PfWbxeN-WFRtuaG=-GAWDGXLoe6Q@mail.gmail.com>
References: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
 <CADHdJwDAnbFAe3bGTQswK1OdfQzN+JCCwCPLGhLy1MCmz0bBTQ@mail.gmail.com>
 <fa955ebd-e988-0bb2-f506-ca164477b34f@micronovasrl.com>
 <20180828215714.5e2c7c84@windsurf.home>
 <451277c2-effe-1d73-f2b3-9c2daf59c2c0@micronovasrl.com>
 <CA+_SqVZ0B7mH+fou8=V9b4PfWbxeN-WFRtuaG=-GAWDGXLoe6Q@mail.gmail.com>
Message-ID: <20180829091254.0b825ad3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Wed, 29 Aug 2018 07:44:37 +0200, Angelo Compagnucci wrote:

> Mizra, one of the authors of Mender is releasing a bump of the package
> with other fixes. We agreed on waiting on the package bump to fix the
> error instead of carrying a patch in buildroot that will bu useful
> only for a short period of time.

Hum, not really. I suppose your bump will include plenty of other
changes. At this time, "master" is frozen in terms of version bumps: we
only do version bumps for security fixes. The other version bumps are
only done on the next branch, but we still want to fix build failures
on master.

If the Mender version bump that is coming really only bug fixes, then
we sometimes make exceptions and merge such version bumps in master.
But as a general rule, after -rc1 is released, version bumps go in
next, and therefore build issues may need to be fixed by backporting
patches from upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
