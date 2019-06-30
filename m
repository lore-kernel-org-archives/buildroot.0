From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Jun 2019 14:39:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: security bump to
 version 18.09.7
In-Reply-To: <20190628063247.3588-1-peter@korsgaard.com>
References: <20190628063247.3588-1-peter@korsgaard.com>
Message-ID: <b66de1ee-e3d5-4765-a220-561c529453ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/06/2019 08:32, Peter Korsgaard wrote:
> Fixes CVE-2018-15664: API endpoints behind the 'docker cp' command are
> vulnerable to a symlink-exchange attack with Directory Traversal, giving
> attackers arbitrary read-write access to the host filesystem with root
> privileges, because daemon/archive.go does not do archive operations on a
> frozen filesystem (or from within a chroot).
> 
> And includes additional post-18.09.6 fixes:
> 
> Builder
> - Fixed a panic error when building dockerfiles that contain only comments.
>   moby/moby#38487
> - Added a workaround for GCR authentication issue. moby/moby#38246
> - Builder-next: Fixed a bug in the GCR token cache implementation
>   workaround.  moby/moby#39183
> 
> Runtime
> - Added performance optimizations in aufs and layer store that helps in
>   massively parallel container creation and removal.  moby/moby#39107,
>   moby/moby#39135
> - daemon: fixed a mirrors validation issue. moby/moby#38991
> - Docker no longer supports sorting UID and GID ranges in ID maps.
>   moby/moby#39288
> 
> Logging
> - Added a fix that now allows large log lines for logger plugins.
>   moby/moby#39038
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Both applied to master, thanks.

 Regards,
 Arnout
