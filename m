From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:28 +0200
Subject: [Buildroot] [git commit] Makefile: enable generating documents from
	br2-external
Message-ID: <20141012072420.57433B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f70d64111a2d93fcf6a6313a8e5da84d0fabd7d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the only way br2-external may generate a document is by
including that document's recipe from within external.mk.

But external.mk is only parsed when the tree is configured.

This is unlike our internal document (the manual) which can be generated
from within an unconfigured tree.

So, include the documents from br2-external at the same time we include
our own document:
  - expect the same layout as we have:      docs/DOC_NAME/doc-name.mk
  - do not fail if there is no document:    use "-include", not "include"

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index d7fbc47..9a6ff15 100644
--- a/Makefile
+++ b/Makefile
@@ -931,5 +931,6 @@ print-version:
 	@echo $(BR2_VERSION_FULL)
 
 include docs/manual/manual.mk
+-include $(BR2_EXTERNAL)/docs/*/*.mk
 
 .PHONY: $(noconfig_targets)
