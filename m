From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 19:09:59 +0100
Subject: [Buildroot] [PATCH] webkit: Add --enable-dependency-tracking to
 the configure options
In-Reply-To: <1415297036-21850-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415297036-21850-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141106190959.325d134f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 6 Nov 2014 18:03:56 +0000, Vicente Olivert Riera wrote:
> --disable-dependency-tracking was added globally to
> package/pkg-autotools.mk by this commit:
> 
> http://git.buildroot.net/buildroot/commit/?id=3e37b0fc6cbbe2245e39fedb247a381fb4e0d992
> 
> This causes a failure in webkit because some source files are generated
> after the Makefile is created. To fix this, we add
> --enable-dependency-tracking to the configure options.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/5beea967b02df202bca1d42afd6fa8c2c13383d5/

Aaah, that's what causing the build failure of webkit. I believe it's
wrong for webkit to do that, because dependency tracking should only be
needed for the developers of the package, and not needed for a normal
build. But since we're anyway going to bump webkit at some point thanks
to the work of Eric Le Bihan, I don't think we want to debug this
webkit version.

Therefore:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

And thanks a lot for the investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
