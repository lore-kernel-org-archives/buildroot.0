From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  8 Apr 2019 18:43:32 +0200
Subject: [Buildroot] [PATCH 2/3] package/linux-tools: some selftests needs
 tput
In-Reply-To: <20190408164333.26942-1-romain.naour@smile.fr>
References: <20190408164333.26942-1-romain.naour@smile.fr>
Message-ID: <20190408164333.26942-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some kernel-selftests are using tput program, so make sure that
BR2_PACKAGE_NCURSES_TARGET_PROGS is selected.

[linux-4.19 selftests]$ git grep tput
[...]
futex/run.sh:tput setf 7 || tput setaf 7
futex/run.sh:    tput sgr0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/linux-tools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 6aa09d14a3..22204ed090 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -83,6 +83,8 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	depends on BR2_USE_MMU  # bash
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PROGS # runtime (tput)
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_UTIL_LINUX
-- 
2.20.1
