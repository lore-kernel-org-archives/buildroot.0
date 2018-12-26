From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 26 Dec 2018 18:22:26 +0000
Subject: [Buildroot] [PATCH 0/2] core/sdk: fix relative symlinks in
 generated tarball (branch yem/sdk)
In-Reply-To: <CA+1k=2ay7v0G0pjwB4PTTR-6mH3_FueDiFi8D3rhbcZa35zq+g@mail.gmail.com>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
 <df37a271-7012-b8d2-fc4d-edfa66a0e163@andin.de>
 <CA+1k=2ZqHeLif6866SYX+hqRwatGiL1e-hZz-zdFuy_Ysfy+8g@mail.gmail.com>
 <20181222083141.GU24194@scaer>
 <CA+1k=2ay7v0G0pjwB4PTTR-6mH3_FueDiFi8D3rhbcZa35zq+g@mail.gmail.com>
Message-ID: <1545848546.7501.7.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2018-12-22 at 11:21 -0700, Joel Carlson wrote:
> On Sat, Dec 22, 2018 at 1:31 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > 
> > 
> > An other approach, would be that we whietelist certain PATHs from our
> > SDK. Afterall, there are things we do not care about in the SDK. For
> > example, most executables in staging/{,usr/}{,s}bin are not needed. We
> > only really need libs and headers, so we could just ignore anything
> > that is not in staging/{lib,usr/lib,usr/include}/

With per-package staging, could this be done before the per-package
staging areas are combined?  The idea would be to reduce differences
between the stage in buildroot and the stage when using an SDK.  Every
difference is a possible source of problems, even if it is something
that we are not supposed to care about.

Could this be taken further, and everything not in the stage whitelist
be deleted?  It would be nice if the SDK were smaller.
