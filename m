From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2020 09:37:51 -0000
Subject: [Buildroot] [git commit] package/perf: if zstd is enabled,
 depend on it
Message-ID: <20201203092226.20E548012C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=409b29288738bc377bff239d5aebf4d1cb15aefb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enables the "-z" flag.

Signed-off-by: V??clav Kubern??t <sir.venceslas@gmail.com>
Reviewed-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index e54f019888..efa747cf8d 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -69,6 +69,10 @@ else
 PERF_MAKE_FLAGS += NO_LIBAUDIT=1
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+PERF_DEPENDENCIES += zstd
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 PERF_DEPENDENCIES += libunwind
 else
