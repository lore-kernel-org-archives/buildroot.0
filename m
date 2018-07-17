From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jul 2018 14:48:24 +0200
Subject: [Buildroot] Unable to download Linux "master" on 2018.05 release
In-Reply-To: <c67d510c5c14ddb0f5f4661317f1801e921eedc7.camel@synopsys.com>
References: <c67d510c5c14ddb0f5f4661317f1801e921eedc7.camel@synopsys.com>
Message-ID: <20180717144824.223ae7f2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jul 2018 12:43:53 +0000, Evgeniy Didin wrote:
> Hello everyone,
> 
> Recently I have faced with an error trying to download "master" version of Torvalds Linux branch. I am using 2018.05 tag of buildroot.
> Here is part of my defconfig:
> -----------------------------------------------8<----------------------------------------------------------------------------------------------
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
> BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
> ----------------------------------------------->8----------------------------------------------------------------------------------------------  

Fetching from a Git branch name is not supported. It used to work by
accident, but now it no longer works at all. It's a bad thing to do,
because Buildroot will never refetch that branch once it has cached a
tarball linux-master.tar.gz.

However, it is on our TODO list to provide an explicit error message
when this situation arise.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
