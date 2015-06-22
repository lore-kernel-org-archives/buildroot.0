From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 00:24:31 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: mark eglibc as
	deprecated
Message-ID: <20150622222746.141CE7FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dab385644a165dad91043889504be67282f93174
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

eglibc is a dead project and has not been making any release since a
while, now that glibc is back and kicking. So let's deprecated our
eglibc support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index d9914b0..77a197e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -49,6 +49,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_DEPRECATED_SINCE_2015_08
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our eglibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
