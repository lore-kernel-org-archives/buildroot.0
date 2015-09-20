From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:35:48 +0200
Subject: [Buildroot] [PATCH v2] host-gcc-final: don't install a
 potentially dead symlink
In-Reply-To: <1442612666-19806-1-git-send-email-arnout@mind.be>
References: <1442612666-19806-1-git-send-email-arnout@mind.be>
Message-ID: <20150920143548.498838f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, 18 Sep 2015 23:44:26 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> gcc used to be installed into $(HOST_DIR)/usr/$(GNU_TARGET_NAME) but
> since gcc 4.9 this is no longer the case.  Therefore, the cc -> gcc
> symlink that is created in that we create in that directory is dead.
> 
> There don't seem to have been any problems due to the missing gcc and
> cc in $(HOST_DIR)/usr/$(GNU_TARGET_NAME), things seems to build fine
> without it. The cc -> gcc symlinks in general should not be needed
> anyway, since we always pass the appropriate CC variable to the
> package build system.
> 
> Therefore, let's remove the cc -> gcc symlink in
> $(HOST_DIR)/usr/$(GNU_TARGET_NAME) - also for pre-4.9 gcc versions.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> In addition to the explanation above, this patch is also preparation
> for an upcoming patch series that implements the wrapper for the
> internal toolchain. All the -gcc, -cc and -g++ instances have to be
> symlinked to the wrapper, and the original (even if it was already
> a symlink) has to be moved to *.real. So removing this redundant
> thing helps keeping the internal toolchain wrapper implementation
> a little simpler.

I've applied. We'll see what the autobuilders will say about this :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
