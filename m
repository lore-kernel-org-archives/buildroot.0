From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:23:45 +0200
Subject: [Buildroot] [git commit] package/gettext-tiny: take GNU gettext
 from our own directory
Message-ID: <20190331132103.673BF82B58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=038dda0cd5e65481c57957d8f72410711e77c665
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though gettext-tiny re-uses the gettext-gnu source code, it makes
a separate download in the gettext-tiny download folder, so use this
one, and not the one from the gettext-gnu download folder, which may
not exist.

Fixes:

  http://autobuild.buildroot.net/results/4e289f30bc6e58ad81611e8e04779134dcbe1241/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-tiny.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 9efd798451..a555fbef50 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -35,7 +35,7 @@ HOST_GETTEXT_TINY_EXTRA_DOWNLOADS = $(GETTEXT_GNU_SITE)/$(GETTEXT_GNU_SOURCE)
 define HOST_GETTEXT_TINY_EXTRACT_GNU_GETTEXT
 	mkdir -p $(@D)/gettext-gnu
 	$(call suitable-extractor,$(GETTEXT_GNU_SOURCE)) \
-		$(GETTEXT_GNU_DL_DIR)/$(GETTEXT_GNU_SOURCE) | \
+		$(GETTEXT_TINY_DL_DIR)/$(GETTEXT_GNU_SOURCE) | \
 		$(TAR) --strip-components=1 -C $(@D)/gettext-gnu $(TAR_OPTIONS) -
 endef
 HOST_GETTEXT_TINY_POST_EXTRACT_HOOKS += HOST_GETTEXT_TINY_EXTRACT_GNU_GETTEXT
