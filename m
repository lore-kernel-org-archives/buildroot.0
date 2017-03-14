From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:30 -0700
Subject: [Buildroot] [PATCH 01/23] core: include arch-specific definitions
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-2-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Allow architectures to define variables and helper macros.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
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
-- 
2.1.4
