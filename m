From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:41:12 +0100
Subject: [Buildroot] [PATCH 4/9 v2] docs/manual: print-help can be used in
	help-custom
In-Reply-To: <cover.1457717002.git.yann.morin.1998@free.fr>
References: <cover.1457717002.git.yann.morin.1998@free.fr>
Message-ID: <af8d831974fad544c0f37ca32064d646f4186c8e.1457717002.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... but make it explicit that it is not mandatory.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - move that patch earlier in the series
  - make it explicit that print-help is *not* mandatory for the
    custom help
---
 docs/manual/customize-outside-br.txt | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index be1827e..88fc802 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -110,14 +110,26 @@ And then in +$(BR2_EXTERNAL)/package/package1+ and
 
 Additionally, an +external.mk+ file may define the +help-custom+ make
 rule, to document custom make targets specific to this +BR2_EXTERNAL+
-tree. The help is completely free-form.
+tree. The help is completely free-form. Buildroot however provides the
++print-help+ macro to pretty-print those additional rules, even though
+it is absolutely not mandatory to use it:
 
 ------
+BR2_EXTERNAL_HELP = \
+    "my-rule : some help text for my-rule" \
+    "my-other-rule : some help text for my-other-rule"
+
 help-custom:
     @echo 'Here goes your local help, where you may'
     @echo 'describe some custom rules:'
-    @echo '  my-rule       - do something'
-    @echo '  my-other-rule - do something else'
+    @$(call print-help,$(BR2_EXTERNAL_HELP))
+    @echo
+    @echo 'Another section with more custom help:'
+    @echo '  third-rule  - some help text'
+    @echo '  fourth-rule - even more help text'
     @echo
     @echo 'Please contact support at company.com in case of problem.'
 ------
+
+The format for +BR2_EXTERNAL_HELP+ is the same as for the +LIBFOO_HELP+
+package variable, defined in xref:generic-package-tutorial[].
-- 
1.9.1
