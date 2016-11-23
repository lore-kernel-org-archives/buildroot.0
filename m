From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:31:00 +0100
Subject: [Buildroot] [PATCH v2] trousers: Pass "-mno-compact-casesi"
 when building for ARCv1
In-Reply-To: <1479811345-23400-1-git-send-email-vzakhar@synopsys.com>
References: <1479811345-23400-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161123233100.6045d021@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 13:42:25 +0300, Vlad Zakharov wrote:
> Compact casesi patterns don't have a reload version. This causes build
> failures of "trousers" package for ARC.
> 
> Current patch disables compact casesi patterns for ARCv1 (750D and 770D)
> via passing "-mno-compact-casesi" option when compiling "trousers".
> 
> This change is a temporary workaround and the feature is going to be
> fixed in the next ARC toolchain release version.
> 
> Fixes:
> http://autobuild.buildroot.org/results/d2c/d2c16d8ba022b070c4dbeba5e7ea41f14d706691//
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
> Changes v1..v2:
> - Replaced CFLAGS="$(CFLAGS) ..." with CFLAGS="$(TARGET_CFLAGS) ..."
> - Added a link to autobuilder failure 

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
