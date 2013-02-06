From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Feb 2013 22:18:53 +0100
Subject: [Buildroot] [git commit] uClibc: mark 0.9.31 as deprecated
Message-ID: <20130206212242.240609A9D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4345586586fc3fbc43b9a31dfca21c371a81cca5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0.9.31 is old and doesn't actually build with modern kernel headers,
so mark it as deprecated.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index a48b6a0..57c9933 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -11,6 +11,7 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_31
 		bool "uClibc 0.9.31.x"
+		depends on BR2_DEPRECATED
 		depends on !BR2_xtensa
 
 	config BR2_UCLIBC_VERSION_0_9_32
