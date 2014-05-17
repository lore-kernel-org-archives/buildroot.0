From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 11:35:23 +0200
Subject: [Buildroot] [git commit] elfutils: propagate architecture
	dependency to comment
Message-ID: <20140517093855.4D7759CC52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8752516784112e4ccf67115b3ac9bcac79c2433a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elfutils depends on !BR2_avr32, but this dependency was not properly
propagated to the comment about toolchain options. This commit fixes
that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 588c29d..6025a74 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,4 +1,5 @@
 comment "elfutils needs a toolchain w/ largefile, wchar"
+	depends on !BR2_avr32
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ELFUTILS
