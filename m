From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Mar 2013 23:28:27 +0100
Subject: [Buildroot] [git commit] xinetd: follow the convention for patch
	location
Message-ID: <20130320222813.170199B1E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f721a2f009393c29c6554f643f15f80a8dc5443
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following 5538e4766201aa0 ("rework patch model"), the xinetd patches
were no longer being applied, because they were stored in
package/xinetd/xinetd-2.3.15/*.patch. This lead to xinetd build
failures such as:
http://autobuild.buildroot.org/results/1a032bca894b76facd9e7f01c3b5d370987d7fc8/build-end.log.

This patch fixes this by changing the location and name of the xinetd
patches to follow the new conventions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../001-ar.patch => xinetd-001-ar.patch}           |    0
 .../002-destdir.patch => xinetd-002-destdir.patch} |    0
 .../003-rpc_fix.patch => xinetd-003-rpc-fix.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/xinetd/xinetd-2.3.15/001-ar.patch b/package/xinetd/xinetd-001-ar.patch
similarity index 100%
rename from package/xinetd/xinetd-2.3.15/001-ar.patch
rename to package/xinetd/xinetd-001-ar.patch
diff --git a/package/xinetd/xinetd-2.3.15/002-destdir.patch b/package/xinetd/xinetd-002-destdir.patch
similarity index 100%
rename from package/xinetd/xinetd-2.3.15/002-destdir.patch
rename to package/xinetd/xinetd-002-destdir.patch
diff --git a/package/xinetd/xinetd-2.3.15/003-rpc_fix.patch b/package/xinetd/xinetd-003-rpc-fix.patch
similarity index 100%
rename from package/xinetd/xinetd-2.3.15/003-rpc_fix.patch
rename to package/xinetd/xinetd-003-rpc-fix.patch
