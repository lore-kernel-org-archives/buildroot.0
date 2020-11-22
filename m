From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 22:48:52 +0100
Subject: [Buildroot] [PATCH] package/ncurses: mark CVE-2019-1759{4,
 5} as fixes by 20191012 patch
Message-ID: <20201122214852.28647-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the NVE data, these are fixes in the 20191012 patch - So mark
them as such.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index c11650c766..f4e4784a3c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -50,6 +50,9 @@ NCURSES_PATCH = \
 		ncurses-6.1-20200118.patch.gz \
 	)
 
+# ncurses-6.1-20191012.patch.gz
+NCURSES_IGNORE_CVES += CVE-2019-17594 CVE-2019-17595
+
 NCURSES_CONF_OPTS = \
 	--without-cxx \
 	--without-cxx-binding \
-- 
2.20.1
