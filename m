From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:31 +0200
Subject: [Buildroot] [PATCH v4 14/36] eclipse-register-toolchain: toolchain
	is no longer installed in $(HOST_DIR)/usr
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-15-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/eclipse-register-toolchain | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/eclipse-register-toolchain b/support/scripts/eclipse-register-toolchain
index 6f919985c0..891d29ee6f 100755
--- a/support/scripts/eclipse-register-toolchain
+++ b/support/scripts/eclipse-register-toolchain
@@ -45,7 +45,7 @@ if test ! -d ${project_directory}/host ; then
     exit 1
 fi
 
-if test ! -e ${project_directory}/host/usr/bin/${toolchain_prefix}gcc ; then
+if test ! -e ${project_directory}/host/bin/${toolchain_prefix}gcc ; then
     echo "Cannot find the cross-compiler in the project directory"
     exit 1
 fi
-- 
2.13.2
