From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:37:43 +0200
Subject: [Buildroot] [PATCH 2/3] ltp-testsuite: bump to version 20160920
In-Reply-To: <1475322624-20518-2-git-send-email-nunes.erico@gmail.com>
References: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
 <1475322624-20518-2-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161003233743.5cae3f1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Oct 2016 13:50:23 +0200, Erico Nunes wrote:
> Patch 0001-fix-uClibc-build.patch is now part of upstream so it is not
> needed in Buildroot anymore. The remaining patches were just rebased and
> then renumbered so that they apply cleanly to this new version.
> 
> This has been build-tested with both glibc and uClibc toolchains and
> run-tested on x86_64 and aarch64.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Applied to master, thanks!

> I wonder if we should really maintain the uClibc-related patches given
> that even the patches themselves mention that they are not upstreamable.
> This feels a bit like maintaining feature patches. If upstream adds more
> changes that break uClibc, we would need to maintain that ourselves.
> I'm interested in maintaining this package but if it turns out that it
> eventually starts breaking for uClibc in future versions, I'd vote for
> removing uClibc support for it.

I looked at the remaining patches:

 - 0001 I'm not sure to fully understand

 - 0002 and 0002 are just missing features in uClibc, I don't see why
   those patches can't be upstreamed. Waldemar, maybe you could help?

 - 0004 fixes an issue that also occurs with libtirpc, so it definitely
   should be upstreamable

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
