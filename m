From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jul 2019 22:19:54 +0200
Subject: [Buildroot] [PATCH 04/13 v2] core: rename generated .br-external.mk
 file
In-Reply-To: <cover.1564431589.git.yann.morin.1998@free.fr>
References: <cover.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <e1e32262b69c1e7806e8af842583e91e825bd506.1564431589.git.yann.morin.1998@free.fr>
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

---
Changes v1 -> v2:
  - update manual accordingly

---
The reason for the original naming is probably because of the long
undocumented (except buried in an old dev-days report) and mostly
never-obeyed rule that internal variables should be prefixed with
BR_ not BR2_, the latter being reserved for user-facing variables,
and thus the same was thought for the generated file. Or maybe not...
---
 Makefile                             | 2 +-
 docs/manual/customize-outside-br.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a7af04fb4b..8bca4bafd0 100644
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
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index b1eed326aa..353b2ed75f 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -22,7 +22,7 @@ place project-specific customizations in two locations:
 One can tell Buildroot to use one or more br2-external trees by setting
 the +BR2_EXTERNAL+ make variable set to the path(s) of the br2-external
 tree(s) to use. It can be passed to any Buildroot +make+ invocation. It
-is automatically saved in the hidden +.br-external.mk+ file in the output
+is automatically saved in the hidden +.br2-external.mk+ file in the output
 directory. Thanks to this, there is no need to pass +BR2_EXTERNAL+ at
 every +make+ invocation. It can however be changed at any time by
 passing a new value, and can be removed by passing an empty value.
-- 
2.20.1
