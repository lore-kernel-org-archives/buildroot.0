From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 30 Jun 2017 10:37:02 +0200
Subject: [Buildroot] [RFC PATCH v5 05/11] core: we need host-patchelf as the
	very first package for RPATH sanitation
In-Reply-To: <1498811828-6893-1-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
Message-ID: <1498811828-6893-6-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For this purpose we set DEPENDENCIES_HOST_PREREQ to host-patchelf early
in the Makefile.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 88d98e0..f5ea6a8 100644
--- a/Makefile
+++ b/Makefile
@@ -483,6 +483,8 @@ include package/Makefile.in
 # arch/arch.mk.* must be after package/Makefile.in because it may need to
 # complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
 -include $(wildcard arch/arch.mk.*)
+# We need patchelf early for RPATH sanitation
+DEPENDENCIES_HOST_PREREQ += host-patchelf
 include support/dependencies/dependencies.mk
 
 include toolchain/*.mk
-- 
2.7.4
