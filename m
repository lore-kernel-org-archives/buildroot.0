From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:25:52 +0100
Subject: [Buildroot] [git commit] support/config-fragments:
 br-powerpc-internal-full: remove old option
Message-ID: <20180112212557.A112682216@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6d39f8c03431092e02ad30c948db8423b1de05c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 has been removed with the commit [1].

Since this option is still in br-powerpc-internal-full config-fragment,
the powerpc configuration is droped by autobuild-run script:

WARN: toolchain can't be used
      Missing: BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
[Sat, 06 Jan 2018 03:03:43] WARN: failed to generate configuration

[1] 4bcacfd2c05f45171c011d4af7731c6f848819a4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/config-fragments/autobuild/br-powerpc-internal-full.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/config-fragments/autobuild/br-powerpc-internal-full.config b/support/config-fragments/autobuild/br-powerpc-internal-full.config
index 2621e9f..61b3e7a 100644
--- a/support/config-fragments/autobuild/br-powerpc-internal-full.config
+++ b/support/config-fragments/autobuild/br-powerpc-internal-full.config
@@ -1,5 +1,4 @@
 BR2_powerpc=y
-BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
