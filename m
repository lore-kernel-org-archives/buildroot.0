From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Nov 2017 14:41:56 +0100
Subject: [Buildroot] Regenerating Skeleton without a clean in 2017
In-Reply-To: <eff7c8c514764b54a3a11924db80c3bb@PGHPRDEXCH02.corp.bbns.com>
References: <eff7c8c514764b54a3a11924db80c3bb@PGHPRDEXCH02.corp.bbns.com>
Message-ID: <20171110144156.6c2a8295@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Nov 2017 13:17:15 +0000, John O'Sullivan wrote:

> In the older buildroot releases  one could force a reintegration of a
> skeleton overlay with various hacks like removing the .root file in
> build, are there any equivalents in Buildroot-2017.02-4. I understand
> this is not best practice but I have some quick prototyping to do and
> the build time is an issue.

$ make skeleton-rebuild

should do the trick in Buildroot 2017.02. Starting with 2017.08, this
won't work as the skeleton has been split into several packages.

However, you should stop using a custom skeleton, and use a root
filesystem overlay instead (perhaps with a post build script). Why do
you still use a custom skeleton ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
