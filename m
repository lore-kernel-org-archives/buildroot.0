From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:23:59 +0200
Subject: [Buildroot] [PATCH 03/12] core: rename generated .br2-external.mk
 file
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <c30d084f97f404d02d42595b1afab9775dc26f44.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the two (all of them!) br2-external related files are generated
in the same location, it makes sense they are named after the same
pattern.

When initial support for (then single) br2-external trees was added back
in a4239f7fd1 (core: introduce the BR2_EXTERNAL variable), it was not
clear-cut why that file was not named with a br2 prefix.

So rename it now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
The reason for the original naming is probably because of the long
undocumented (except buried in an old dev-days report) and mostly
never obeyed rule that internal variables should be prefixed with
BR_ not BR2_, the latter being reserved for user-facing variables,
and thus the same was thought for the generated file. Or maybe not...
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0498b28def..8b8f5b2690 100644
--- a/Makefile
+++ b/Makefile
@@ -179,7 +179,7 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # still be overridden on the command line, therefore the file is re-created
 # every time make is run.
 
-BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external.mk
+BR2_EXTERNAL_FILE = $(BASE_DIR)/.br2-external.mk
 -include $(BR2_EXTERNAL_FILE)
 $(shell support/scripts/br2-external \
 	-m -o '$(BR2_EXTERNAL_FILE)' $(BR2_EXTERNAL))
-- 
2.14.1
