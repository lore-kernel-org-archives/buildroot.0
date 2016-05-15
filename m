From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 May 2016 12:26:01 +0200
Subject: [Buildroot] [for-next: PATCH 2/2] toolchain: update paranoid unsafe
	path comment
In-Reply-To: <1463307961-29759-1-git-send-email-romain.naour@gmail.com>
References: <1463307961-29759-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1463307961-29759-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 919c06c28295f19ca49459b98d8954148b381360 the calls to gcc always pass
through the toolchain wrapper and all gcc patches to support poisoning has been
removed.

Update the BR2_COMPILER_PARANOID_UNSAFE_PATH comment.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 93b4f69..849d7f5 100644
--- a/Config.in
+++ b/Config.in
@@ -695,8 +695,8 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  unsafe paths are encountered.
 
 	  Note that this mechanism is available for both the internal
-	  toolchain (through gcc and binutils patches) and external
-	  toolchain backends (through the external toolchain wrapper).
+	  toolchain (through the toolchain wrapper and binutils patches)
+	  and external toolchain backends (through the toolchain wrapper).
 
 endmenu
 
-- 
2.5.5
