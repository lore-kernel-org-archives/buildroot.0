From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 22:26:52 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: BR2_NEEDS_GETTEXT
	must be y when uClibc is used
Message-ID: <20101213214845.4D84E8E2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f56c5a76192adf9ba86053c97e200587b8803011
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_NEEDS_GETTEXT was already set to y for Buildroot internal
toolchain and external toolchains based on uClibc, but wasn't set for
toolchains based on uClibC built by the Crosstool-NG backend.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-common.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 34d70a0..bdc6e76 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -60,6 +60,7 @@ config BR2_NEEDS_GETTEXT
 	bool
 	default y if BR2_TOOLCHAIN_BUILDROOT
 	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	default y if BR2_TOOLCHAIN_CTNG_uClibc
 
 config BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool
-- 
1.7.2.2
