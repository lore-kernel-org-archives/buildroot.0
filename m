From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:32:56 +0200
Subject: [Buildroot] [git commit branch/next] toolchain: enable paranoid
	unsafe path check by default
Message-ID: <20160517203301.0539E7FCD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61c8854cef2a41be3175bbf7f0992c31560a1dd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This check is enabled for all build in the Buildroot autobuilders since [1]
(i.e since 2015.02 release).

Enable this option by default.

[1] https://git.busybox.net/buildroot-test/commit/?id=41552e2a249de4568aa01f14bd588d1c8166f70b

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in b/Config.in
index b5cc892..93b4f69 100644
--- a/Config.in
+++ b/Config.in
@@ -683,6 +683,7 @@ menu "Advanced"
 
 config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	bool "paranoid check of library/header paths"
+	default y
 	help
 	  By default, when this option is disabled, when the Buildroot
 	  cross-compiler will encounter an unsafe library or header
