From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 7 May 2008 10:49:35 +1000
Subject: [Buildroot] missing /proc in romfs
In-Reply-To: <4820A5F0.7030205@ripnet.com>
References: <4820A5F0.7030205@ripnet.com>
Message-ID: <20080507004934.GA26439@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 06, 2008 at 02:39:44PM -0400, Mike Sander wrote:
> According to the buildroot docs the filesystem skeleton is available in 
> /generic/target_skeleton.     The target_skeleton does include /proc.  
> After I do a make, the project_build_arm/uclibc/root/ does NOT contain a 
> /proc filesystem.  I'm not sure if other bits are missing. 

Correct, /proc will be an empty directory. The target system will mount
procfs onto /proc during boot, usually from /etc/rc or a similar script.

> I have studied the output of the make process and have not been able to 
> see where the basic filesystem is created.  I can see where specific 
> bits are added to /etc /lib.   Could someone be so kind as to describe 
> the initial steps in building the root filesystem  (and where 
> target_skeleton fits in).   A brief list of the makefiles (and make 
> targets) would be helpful.

The main Makefile has a target $(PROJECT_BUILD_DIR)/.root which copies
the target_skeleton into the project_build_$arch/$project/root
directory, and then other packages are installed into that some root.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
