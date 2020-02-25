From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 25 Feb 2020 22:22:13 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_HOST_GCC_AT_LEAST_9
Message-ID: <20200225212213.22680-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fedora 30 switched to GCC 9.x. [1]

[1] https://fedoraproject.org/wiki/Changes/GCC9

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 2ccbdfb963..abaee794a4 100644
--- a/Config.in
+++ b/Config.in
@@ -50,6 +50,11 @@ config BR2_HOST_GCC_AT_LEAST_8
 	default y if BR2_HOST_GCC_VERSION = "8"
 	select BR2_HOST_GCC_AT_LEAST_7
 
+config BR2_HOST_GCC_AT_LEAST_9
+	bool
+	default y if BR2_HOST_GCC_VERSION = "9"
+	select BR2_HOST_GCC_AT_LEAST_8
+
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.
 
-- 
2.24.1
