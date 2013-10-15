From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 16:19:41 +0200
Subject: [Buildroot] [RFC PATCH] fs/common.mk: Add support for fakeroot
 script
In-Reply-To: <20131015132102.GA20116@gmail.com>
References: <20131015132102.GA20116@gmail.com>
Message-ID: <20131015161941.5d7ffd45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andrew Ruder,

On Tue, 15 Oct 2013 08:21:02 -0500, Andrew Ruder wrote:
> This adds a BR2_ROOTFS_FAKE_ROOT_SCRIPT (similar to

Should be FAKEROOT, not FAKE_ROOT (if we validate the whole proposal
this patch is doing).

> BR2_ROOTFS_POST_BUILD_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT). This
> script is called inside the fakeroot which allows the script to change
> permissions, create device nodes, etc.
> 
> Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
> ---
>  I am using this script as part of a configuration that creates a bunch
>  of directories that need to have specific ownership.  I can create
>  the directories in a post-build script, but permissions needed to be
>  done in a fakeroot environment.  Didn't see any other way to hook into
>  the fakeroot.

Well, the conventional way would be to have those directories created
by packages (and they can use the <pkg>_PERMISSIONS mechanism to get
proper ownership or permissions). Or, if they really don't belong to
any package, create them in the post build script, and have a device
table assign the permission and ownership.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
