From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 10 Sep 2008 11:32:27 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20080909085015.CBF7C3C608@busybox.net>
References: <20080909085015.CBF7C3C608@busybox.net>
Message-ID: <20080910013227.GA12253@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 09, 2008 at 01:50:15AM -0700, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-09-09 01:50:15 -0700 (Tue, 09 Sep 2008)
> New Revision: 23361
> 
> Log:
> busybox: remove stale busybox 1.11.1 patches
> 
> Hamish, don't forget to remove those when you bump the version
> 
> Removed:
>    trunk/buildroot/package/busybox/busybox-1.11.1-ash.patch
>    trunk/buildroot/package/busybox/busybox-1.11.1-basename.patch
>    trunk/buildroot/package/busybox/busybox-1.11.1-modutils.patch
>    trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch

Hi Peter,

Actually that was deliberate. I noticed that after I changed
package/busybox/Config.in, I still had

BR2_BUSYBOX_VERSION_1_11_X=y
BR2_BUSYBOX_VERSION="1.11.1"

until next time I ran a menuconfig/oldconfig/etc. If the patches are
removed immediately upon version bump but you don't update your config,
you'll be building without those patches. :(

I wonder if BR2_BUSYBOX_VERSION should be determined by the Makefiles
rather than through the config system, so that this can't happen?

Regards,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
