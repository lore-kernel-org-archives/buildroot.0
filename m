From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] board: simplify atngw100 support
Message-ID: <20101217160201.ACCAC8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=90965566891ee63baaae6be66e55a12c28ab1b65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minimize atngw100_defconfig, remove atngw100-base_defconfig, and
remove the target skeleton and device table. Instead of having
complete copies of new target skeletons (making them hard to
maintain), we should just have a post-build script that
adds/removes/tweaks the existing target skeleton.

Moreover, most of the tweaks in this target skeleton were for specific
packages, but the policy now is that board defconfig should just build
a basic root filesystem with Busybox, and let the user select
whichever set of packages (s)he wants.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
