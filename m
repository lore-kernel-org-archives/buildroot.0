From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jun 2014 12:42:16 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <01b1dd01-35b7-40d8-bb70-56a33e20f1a6@email.android.com>
References: <20140615063014.70ACF100EAC@stock.ovh.net>
 <20140615122040.6effbc93@free-electrons.com>
 <01b1dd01-35b7-40d8-bb70-56a33e20f1a6@email.android.com>
Message-ID: <20140615124216.2c3c1428@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 15 Jun 2014 12:36:44 +0200, Thomas De Schampheleire wrote:

> Could you clarify why we need a timeout in the first place? Have
> there been occurrences of builds that get stuck (in a loop or
> otherwise)? According to me, it doesn't matter that a build takes ten
> hours for a given configuration, as long as it progresses and doesn't
> get stuck...

The reason a timeout was introduced is because there used to be an old
PowerPC toolchain in which 'ld' had a bug, and this bug caused ld to
enter an infinite loop, consuming 100% of the CPU forever, when linking
a specific piece of code. There have been occurrences where my build
server has remained stuck for several days in this infinite loop before
I realized that the builds were no longer occurring, and figured out
what was going on.

I don't think we still have this toolchain tested in the current
configurations, but the timeout mechanism has remained in place, and I
believe it's still possible to have similar issues in the future.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
