From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 May 2019 20:30:00 +0200
Subject: [Buildroot] [PATCH 04/15] arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_9
In-Reply-To: <20190506183011.4856-1-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
Message-ID: <20190506183011.4856-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new symbol will be used by architectures introduced with gcc 9 and
by external toolchains based on gcc 9.

[1] https://gcc.gnu.org/gcc-9/changes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index d82803c828..051d4cdab7 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -302,6 +302,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
2.14.5
