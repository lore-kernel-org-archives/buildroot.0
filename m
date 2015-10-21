From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 10:27:11 +0200
Subject: [Buildroot] [PATCH] syslog-ng: Specify location of libesmtp
In-Reply-To: <CAFOYHZBj3PtYrr_U6Tq6nAG9X0w5AXYis5b-rDpbvjQSCMby6A@mail.gmail.com>
References: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
 <20151020205728.6f2d2332@gmx.net> <877fmhl4ie.fsf@dell.be.48ers.dk>
 <CAFOYHZBj3PtYrr_U6Tq6nAG9X0w5AXYis5b-rDpbvjQSCMby6A@mail.gmail.com>
Message-ID: <20151021102711.44de0ec5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Wed, 21 Oct 2015 20:41:54 +1300, Chris Packham wrote:

> The way the test is implemented in configure.ac libestmp-config is
> invoked directly so it would need to be on the path. Or I could look
> at an upstream patch to change this to something that can be
> overridden. I'd almost prefer if libesmtp had pkg-config support which
> integrates better with autotools and buildroot has existing support
> for.

As Peter suggested, the way we usually fix that is by replacing the
direct invocation of <foo>-config in configure.ac by
${FOO_CONFIG:foo-config}, so that it can be overridden in the
environment.

However, the current --with-<foo> solution that you have used is fine
for me. We do use this solution for numerous packages, so I'm fine with
using it as well for syslog-ng.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
