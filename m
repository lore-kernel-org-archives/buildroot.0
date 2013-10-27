From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2013 10:30:53 +0100
Subject: [Buildroot] [RFC PATCH] fs/common.mk: Add support for fakeroot
 script
In-Reply-To: <20131015132102.GA20116@gmail.com>
References: <20131015132102.GA20116@gmail.com>
Message-ID: <526CDD4D.70307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/13 15:21, Andrew Ruder wrote:
> This adds a BR2_ROOTFS_FAKE_ROOT_SCRIPT (similar to
> BR2_ROOTFS_POST_BUILD_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT). This
> script is called inside the fakeroot which allows the script to change
> permissions, create device nodes, etc.
>
> Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
> ---
>   I am using this script as part of a configuration that creates a bunch
>   of directories that need to have specific ownership.  I can create
>   the directories in a post-build script, but permissions needed to be
>   done in a fakeroot environment.  Didn't see any other way to hook into
>   the fakeroot.

  Hi Andrew,

  At the buildroot developer meeting we decided to drop this patch. For 
your particular use case, there is a better way to do it with 
<pkg>_PERMISSIONS or with the device table. We also discussed other use 
cases, like doing an rsync inside the fakeroot, but these use cases can 
just untar the tarball in a post-image script and work on that. And 
finally, having all these different POST_xxx steps makes things confusing.

  If you still see a reason to add this feature, don't hesitate to tell us.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
