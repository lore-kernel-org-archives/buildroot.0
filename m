From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:11:29 +0200
Subject: [Buildroot] [git commit] uclibc: use the ARC-specific uClibc by
	default on ARC
Message-ID: <20150628131209.5768380438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0c97a957ab37b7e4ec90075e4f66bc01083ee5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the switch to uClibc-ng as the default library, uClibc-ng
was also used as the default on ARC, while we actually want to use the
ARC specific version by default on this architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 32c356a..14f713c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -18,7 +18,7 @@ config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_NG
+	default BR2_UCLIBC_VERSION_NG if !BR2_arc
 	help
 	  Select the version of uClibc you wish to use.
 
