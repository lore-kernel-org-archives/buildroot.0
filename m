From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 14:08:12 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2016.09-eng007 and PIE fix
In-Reply-To: <1469784174-25923-1-git-send-email-vzakhar@synopsys.com>
References: <1469784174-25923-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160730140812.5db0454e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 12:22:54 +0300, Vlad Zakharov wrote:
> As described at:
> 4520524ba055706236db9f00dd79f1b2e2e87fde
> this commit continues a series of updates of ARC tools.
> This time we're updating tools to arc-2016.09-eng007 tag plus a
> couple of fixes on top of it that will all make its way in the
> next engineering build.
> 
> We hope this patch will cure most buildroot ARC failures as it
> contains important fixes:
> 
> 1) PIE fix. We have added PIE support to ARC toolchain at last.
> So that should prevent breakage of many packages.
> 
> 2) Assembler fix. This patch also have changes that fixes frequent
> assembler failures, e.g.:
> http://autobuild.buildroot.net/results/543/5430b902d900943a34c1888e7e410bd5df367bc2//
> 
> Note that we added patch for uClibc-ng that also affects PIE feature.
> We had to do that because in Buildroot for ARC uclibc comes right from
> uClibc-ng release tarballs and the change hasn't been in any release of
> uClibc-ng. If we don't add this patch we see a lot of link-time issues.
> This patch is stopgap measure. We are going to upstream this change
> to uClibc-ng and remove from buildroot as soon as it would be included
> in some uClibc-ng release.
> 
> We still keep GDB as it is of arc-2016.03 release because there're some
> issues we'd like to resolve before releasing it to wider audience.
> 
> So again note this is next engineering builds of arc-2016.09 series
> and it might have all kinds of breakages, please don't use it for
> production builds.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Thanks, but all the patches lack a Signed-off-by, so we can't accept
them.

In addition, if you want PIE to be used on ARC, you need to change how
the BR2_TOOLCHAIN_SUPPORTS_PIE option is selected. Currently it's
selected this way for uClibc toolchains:

	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_arc && !BR2_m68k && !BR2_STATIC_LIBS

You need to adjust this to enable PIE usage on ARC.

Could you rework those two aspects?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
