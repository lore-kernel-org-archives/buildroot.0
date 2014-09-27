From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 12:17:00 +0200
Subject: [Buildroot] [PATCH 24/25 v6] Makefile: enable generating documents
	from br2-external
In-Reply-To: <cover.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <a396eb095d575e8465d1e43f619e54d804e03564.1411812968.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 3146525..4f41235 100644
--- a/Makefile
+++ b/Makefile
@@ -934,5 +934,6 @@ print-version:
 	@echo $(BR2_VERSION_FULL)
 
 include docs/manual/manual.mk
+-include $(BR2_EXTERNAL)/docs/*/*.mk
 
 .PHONY: $(noconfig_targets)
-- 
1.9.1
