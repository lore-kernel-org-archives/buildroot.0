From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Oct 2015 11:45:20 +0200
Subject: [Buildroot] [PATCH] syslog-ng: Specify location of libesmtp
In-Reply-To: <20151021102711.44de0ec5@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 21 Oct 2015 10:27:11 +0200")
References: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
 <20151020205728.6f2d2332@gmx.net> <877fmhl4ie.fsf@dell.be.48ers.dk>
 <CAFOYHZBj3PtYrr_U6Tq6nAG9X0w5AXYis5b-rDpbvjQSCMby6A@mail.gmail.com>
 <20151021102711.44de0ec5@free-electrons.com>
Message-ID: <87fv14imhb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Chris Packham,
 > On Wed, 21 Oct 2015 20:41:54 +1300, Chris Packham wrote:

 >> The way the test is implemented in configure.ac libestmp-config is
 >> invoked directly so it would need to be on the path. Or I could look
 >> at an upstream patch to change this to something that can be
 >> overridden. I'd almost prefer if libesmtp had pkg-config support which
 >> integrates better with autotools and buildroot has existing support
 >> for.

 > As Peter suggested, the way we usually fix that is by replacing the
 > direct invocation of <foo>-config in configure.ac by
 > ${FOO_CONFIG:foo-config}, so that it can be overridden in the
 > environment.

 > However, the current --with-<foo> solution that you have used is fine
 > for me. We do use this solution for numerous packages, so I'm fine with
 > using it as well for syslog-ng.

Agreed. The only potential issue is for static linking as
libestmp-config --libs may return more libraries than the hardcoded
-lesmtp, but I guess the autobuilders will tell us if that is the case.

-- 
Venlig hilsen,
Peter Korsgaard 
