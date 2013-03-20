From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Mar 2013 22:16:17 +0100
Subject: [Buildroot] [PATCH] xinetd: follow the convention for patch location
Message-ID: <1363814178-24310-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following 5538e4766201aa0 ("rework patch model"), the xinetd patches
were no longer being applied, because they were stored in
package/xinetd/xinetd-2.3.15/*.patch. This lead to xinetd build
failures such as:
http://autobuild.buildroot.org/results/1a032bca894b76facd9e7f01c3b5d370987d7fc8/build-end.log.

This patch fixes this by changing the location and name of the xinetd
patches to follow the new conventions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../001-ar.patch => xinetd-001-ar.patch}           |    0
 .../002-destdir.patch => xinetd-002-destdir.patch} |    0
 .../003-rpc_fix.patch => xinetd-003-rpc-fix.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/xinetd/{xinetd-2.3.15/001-ar.patch => xinetd-001-ar.patch} (100%)
 rename package/xinetd/{xinetd-2.3.15/002-destdir.patch => xinetd-002-destdir.patch} (100%)
 rename package/xinetd/{xinetd-2.3.15/003-rpc_fix.patch => xinetd-003-rpc-fix.patch} (100%)

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
-- 
1.7.9.5
