From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:48:58 +0200
Subject: [Buildroot] [git commit] core: include arch-specific definitions
Message-ID: <20170326135524.35A9882489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8efa2d8de920228130235ad6c0a2aeb19a6ae4be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow architectures to define variables and helper macros.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index fb2c235..cceae92 100644
--- a/Makefile
+++ b/Makefile
@@ -479,6 +479,9 @@ all: world
 include Makefile.legacy
 
 include package/Makefile.in
+# arch/arch.mk.* must be after package/Makefile.in because it may need to
+# complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
+-include $(wildcard arch/arch.mk.*)
 include support/dependencies/dependencies.mk
 
 include toolchain/*.mk
