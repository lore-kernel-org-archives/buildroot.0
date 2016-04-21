From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:01:37 +0200
Subject: [Buildroot] [PATCH 0/3 v2] xorg: fix installation paths (branch
 yem/xorg)
In-Reply-To: <cover.1457719643.git.yann.morin.1998@free.fr>
References: <cover.1457719643.git.yann.morin.1998@free.fr>
Message-ID: <20160421220137.4a88ed00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Mar 2016 19:10:58 +0100, Yann E. MORIN wrote:

> This series is an attempt to fix the installation paths of many
> Xorg-related packages.
> 
> The new pkconf bumped in d7f6d320 introduced a change in behaviour: all
> path variables returned by pkgconf are now prefixed with the sysroot
> directory.
> 
> This has an impact on a lot of Xorg packages (and maybe others as well),
> since they use such paths verbatim to install files in either of:
>     $(STAGING_DIR)/$(SYSROOT_DIR)/some/path
>     $(TARGET_DIR)/$(SYSROOT_DIR)/some/path

One important thing that this cover letter doesn't explain is why we
don't fix pkg-config instead?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
