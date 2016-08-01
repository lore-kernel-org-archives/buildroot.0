From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:00:36 +0200
Subject: [Buildroot] [PATCH v2] toolchain: Bump ARC tools to
 arc-2016.09-eng007 and PIE fix
In-Reply-To: <1470054635-30426-1-git-send-email-vzakhar@synopsys.com>
References: <1470054635-30426-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160801230036.264c1e96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Aug 2016 15:30:35 +0300, Vlad Zakharov wrote:
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
> So that should prevent breakage of many packages. As ARC now
> supports PIE we remove ARC from BR2_TOOLCHAIN_SUPPORTS_PIE
> exclusion in toolchain/Config.in file.
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

In fact, a new release of uClibc-ng has been made, and Buildroot was
updated accordingly. This new uClibc-ng release contains the ARC PIE
fix, so I've dropped this part from your patch, and adjusted the commit
log.

Other than that, I've applied the rest of your patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
