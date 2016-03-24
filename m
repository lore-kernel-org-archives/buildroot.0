From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:15:09 +0100
Subject: [Buildroot] Bootchart: Submit a patch questions ...
In-Reply-To: <003001d185dd$c7fa6ec0$57ef4c40$@novadsp.com>
References: <003001d185dd$c7fa6ec0$57ef4c40$@novadsp.com>
Message-ID: <20160324221509.28f24024@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 14:59:35 -0000, g4 at novadsp.com wrote:
> I've been using bootchart just to experiment with getting stuff into the
> buildroot framework. Is there any interest in a patch to add bootchart as an
> option?

Yes, if it was useful for you, it might certainly be useful to others.

Though it is worth mentioning that Busybox includes a minimal version
of bootchartd, so maybe the full bootchart is not useful for everybody.
But that doesn't mean we shouldn't have a package for the full featured
bootchart.

> 1. For a new package is a single patchfile  acceptable? 

Yes, if the package is simple.

> 2. Does the makefile need to spell out licensing? (This seems to vary within
> BR)?

Yes, it should. The packages that don't describe the license
information are older packages that have not yet been updated to
include the license information.

> 3. Does the patch need to include the changes to package/config.in? I am
> guessing yes .

Yes.

> 4. Finally locally BR is configured to get its kernel sources and .config
> from a local clone of /linux on github. In such a case can BR actually
> correctly check the dependencies for bootchart? Presumably it does test
> kernel config settings against the local .config stashed in build?

I am not sure to fully understand the question, but if I understand
correctly, you're saying that bootchart requires some specific kernel
configuration options. If that's what you mean, then there are two
cases:

 * If the kernel option is needed for bootchart to actually *build*,
   then you should modify linux/linux.mk to make sure the relevant
   kernel configurations are enabled when bootchart is enabled.

 * If the kernel option is only needed for bootchart to work at
   runtime, then we generally just recommend to indicate which kernel
   options are needed in the help text of bootchart's Config.in file.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
