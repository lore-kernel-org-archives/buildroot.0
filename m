From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 08:53:35 +0100
Subject: [Buildroot] [git commit] package/ncurses: mark CVE-2019-1759{4,
 5} as fixed by 20191012 patch
Message-ID: <20201123073949.EBA9681829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7fc4bf1b98a4f7a4c0ab90cd22a7b3b75a50706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
