From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 3 Jul 2015 09:04:46 +0200
Subject: [Buildroot] [git commit] tor: explain why we use -std=gnu99
Message-ID: <20150703071550.07E367FCC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86ae63af0529327df6aad8b1acd5c9af0bc28a32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Missed from 5cf5b390 (fix building if GCC's C standard is not gnu99)]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f6d3b7f..a464391 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -32,6 +32,7 @@ else
 TOR_CONF_OPTS += --disable-seccomp
 endif
 
+# uses gnu extensions
 TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 $(eval $(autotools-package))
