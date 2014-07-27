From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 22:55:29 +0200
Subject: [Buildroot] [PATCH 2 of 2] generic packages: rename
 FOO_CONFIGURE_OPTS into FOO_CONFIGURE_OPT
In-Reply-To: <20140727202710.GI3895@free.fr>
References: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
 <5b961fc80eb2d23373a6.1406056892@localhost>
 <20140727152223.38c38d68@free-electrons.com>
 <8527bc5f-ee03-47f0-9e7c-e44db77ba2c5@email.android.com>
 <20140727202710.GI3895@free.fr>
Message-ID: <20140727225529.518feb68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 27 Jul 2014 22:27:10 +0200, Yann E. MORIN wrote:

> > We could add a simple check to warn users of _OPT, but not more than that.
> 
> OK, I'm siding with you guys. OK for the renaming.
> 
> But then we should add a check that the old variable gets used, and
> _error out_ in such case. If we just warn, the warning will be lost
> amongst all the other messages, nad will bbe missed; and suddenly,
> br2-external packages fails to build, or build in an unexpected
> configuration.
> 
> I agree with you that we should just check if the old variable is set,
> but we should not try to correct the situation.

I fully agree with this: we should error out if the old variable is
used, so that things are clearly noticed by users.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
