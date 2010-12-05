From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 10:25:39 +0100
Subject: [Buildroot] [PATCH 12/15] toolchain: BR2_NEEDS_GETTEXT must be y
	when uClibc is used
In-Reply-To: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d9c469daa1b3777622b3e4641f69e9095cacfcba.1291541115.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_NEEDS_GETTEXT was already set to y for Buildroot internal
toolchain and external toolchains based on uClibc, but wasn't set for
toolchains based on uClibC built by the Crosstool-NG backend.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
