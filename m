From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 May 2010 21:17:01 +0200
Subject: [Buildroot] [git commit master] check-host-sed.sh: add missing
	shebang line
Message-ID: <20100506192021.0AD678A2C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=29df95079de22d3b8558ae8fbecd4a71676e1b13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bash seems to be smart enough to source the file when execve returns
ENOEXEC, but other shells might not be.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/dependencies/check-host-sed.sh |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/check-host-sed.sh b/toolchain/dependencies/check-host-sed.sh
index 71f0eb9..188b721 100755
--- a/toolchain/dependencies/check-host-sed.sh
+++ b/toolchain/dependencies/check-host-sed.sh
@@ -1,3 +1,5 @@
+#!/bin/sh
+
 SEDLIST="/usr/bin/sed /bin/sed sed gnused gsed"
 
 for SED in $SEDLIST
-- 
1.6.3.3
