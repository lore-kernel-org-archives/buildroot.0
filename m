From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Feb 2016 09:07:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: append endianness
 argument to TARGET_LD for MIPS
In-Reply-To: <56C4F70A.8060506@mind.be>
References: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160217221313.439547e4@free-electrons.com>
 <56C4F70A.8060506@mind.be>
Message-ID: <20160218090740.74a227b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 17 Feb 2016 23:41:14 +0100, Arnout Vandecappelle wrote:

>  So, are we really going to "fix" all packages that use ld directly? I don't see
> why a package shouldn't be allowed to call ld when it is really doing linking
> without any other toolchainy stuff.

Which isn't the case here. It's linking perf, i.e a normal userspace
application.

But it might indeed be difficult to convince the kernel developers to
change this, except if you have a solid argumentation.

>  LDFLAGS has a bit of the same problem: there will probably be packages that
> don't (completely) honour it.

Yes, and we should fix this IMO.

>  For CFLAGS, that was the reason why we introduced the wrapper. So I think we
> should just add a wrapper for ld as well.

Why not.

>  Unless Vicente volunteers to work on an ld wrapper, I guess on the short term
> we should take patches like these. That said, it should really be passed through
> LDFLAGS and not LD itself.

And the hack be limited to those specific packages that are broken,
IMO. At least until we realize how many packages are affected by this.
It would be annoying to put those additional flags globally just to fix
one single package.

So I would like a patch that touches only the perf build logic for now,
until we see other packages in the same situation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
