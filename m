From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:24:13 +0200
Subject: [Buildroot] [git commit] infra/utils: add helper to generate
 comma-separated lists
Message-ID: <20190415214606.997758B8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bde598ced805f1f4c437ca53dcb3313e9ea57f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a helper macro that, from a space-separated list of items, returns a
comma-separated list of the quoted items.

This will be useful when we need to generate lists in JSON, later...

Code suggested by Thomas P.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/misc/utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index c44319338e..b422c67d76 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -70,6 +70,10 @@ finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
 # notfirstword(wordlist): returns all but the first word in wordlist
 notfirstword = $(wordlist 2,$(words $(1)),$(1))
 
+# build a comma-separated list of quoted items, from a space-separated
+# list of unquoted items:   a b c d  -->  "a", "b", "c", "d"
+make-comma-list = $(subst $(space),$(comma)$(space),$(patsubst %,"%",$(strip $(1))))
+
 # Needed for the foreach loops to loop over the list of hooks, so that
 # each hook call is properly separated by a newline.
 define sep
