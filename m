From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:50:10 +0200
Subject: [Buildroot] [PATCH] util-linux: bump version to 2.24.1
In-Reply-To: <1396536052-21336-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1396536052-21336-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140404235010.194cbb55@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Thu,  3 Apr 2014 18:40:52 +0400, Anton Kolesov wrote:
> From: Mischa Jonker <mjonker@synopsys.com>
> 
> Removed "support older machines" patch as it has been fixed upstream,
> fixed up other patches.
> 
> This removes some arch-dependencies in fdiskbsdlabel.h, fixing the
> build for the ARC-architecture.
> 
> This fixes:
> http://autobuild.buildroot.net/results/8863799d856ccab51ee8ffd499378574ef166aee/
> 
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>

This breaks the build on AVR32:

  http://autobuild.buildroot.org/results/45f/45ffc56784160447c6594354cc3fbab7fa94c196/build-end.log

Error is undefined reference to `mkostemp', most likely due to the old
uClibc used on AVR32.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
