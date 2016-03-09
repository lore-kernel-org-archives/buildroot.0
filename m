From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Mar 2016 23:22:27 +0100
Subject: [Buildroot] [PATCH 8/8] docs/manual: document the br2-external
	help-local
In-Reply-To: <cover.1457561521.git.yann.morin.1998@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
Message-ID: <b94d50a5f7717ad1ea2d9cab129155a0ab203f71.1457561521.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-outside-br.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 9ad177d..d89dc6f 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -107,3 +107,23 @@ And then in +$(BR2_EXTERNAL)/package/package1+ and
    output of +make list-defconfigs+ and allow them to be loaded with the
    normal +make <name>_defconfig+ command. They will be visible under the
    +User-provided configs+' label in the 'make list-defconfigs' output.
+
+Additionally, an +external.mk+ file may define the +help-local+ make
+rule, to document custom make targets specific to this +BR2_EXTERNAL+
+tree. It is possible to use the +HELP_RULE+ macro to pretty-print those
+additional rules:
+
+------
+BR2_EXTERNAL_HELP = \
+    "my-rule : some help text for my-rule" \
+    "my-other-rule : some help text for my-other-rule"
+
+help-local:
+    @echo 'Here goes your local help'
+    @$(call HELP_RULE,$(BR2_EXTERNAL_HELP))
+    @echo
+    @echo 'Please contact support at company.com in case of problem.'
+------
+
+The format for +BR2_EXTERNAL_HELP+ is the same as the +LIBFOO_HELP+
+package variable, defined in xref:generic-package-tutorial[].
-- 
1.9.1
