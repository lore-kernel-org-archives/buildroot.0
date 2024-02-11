Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F5C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BADC40A3E;
	Sun, 11 Feb 2024 15:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4Rd1iAQdgys; Sun, 11 Feb 2024 15:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8CA940A6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8CA940A6B;
	Sun, 11 Feb 2024 15:31:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6396B1BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81EF74053B
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uRS_fI07vnu for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AF0040540
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AF0040540
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77A0A875E7; Sun, 11 Feb 2024 15:31:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:30:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c19cca045225164e7df4046c500c5e7117114f1b
X-Git-Newrev: fcf465d04bac45e447378ec02b50f019ca2864e8
X-Patchwork-Hint: ignore
Message-Id: <20240211153111.77A0A875E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: add check for CPE
 variables set to default values
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fcf465d04bac45e447378ec02b50f019ca2864e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we can specify that the default values for the CPE_ID variables
are valid, without having to actually set one (or more) to their
default, add a check-package check that validates that the CPE_ID
variables are indeed not set to their default.

It also validates that CPE_ID_VALID is not set when another CPE_ID
variable is set to a non-default value.

Add an anchor in the manual so that we can easily point to it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.adoc |  2 +-
 utils/checkpackagelib/lib_mk.py          | 73 ++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index ce8608682f..9d365a10ca 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -511,7 +511,7 @@ LIBFOO_IGNORE_CVES += CVE-2020-12345
 LIBFOO_IGNORE_CVES += CVE-2020-54321
 ----------------------
 
-* +LIBFOO_CPE_ID_*+ variables is a set of variables that allows the
+* [[cpe-id]] +LIBFOO_CPE_ID_*+ variables is a set of variables that allows the
   package to define its https://nvd.nist.gov/products/cpe[CPE
   identifier]. The available variables are:
 +
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index d340882971..ce2ab5157c 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -366,3 +366,76 @@ class VariableWithBraces(_CheckFunction):
             return ["{}:{}: use $() to delimit variables, not ${{}}"
                     .format(self.filename, lineno),
                     text]
+
+
+class CPEVariables(_CheckFunction):
+    """
+    Check that the values for the CPE variables are not the default.
+      - CPE_ID_* variables must not be set to their default
+      - CPE_ID_VALID must not be set if a non-default CPE_ID variable is set
+    """
+    def before(self):
+        pkg, _ = os.path.splitext(os.path.basename(self.filename))
+        self.CPE_fields_defaults = {
+            "VALID": "NO",
+            "PREFIX": "cpe:2.3:a",
+            "VENDOR": f"{pkg}_project",
+            "PRODUCT": pkg,
+            "VERSION": None,
+            "UPDATE": "*",
+        }
+        self.valid = None
+        self.non_defaults = 0
+        self.CPE_FIELDS_RE = re.compile(
+            r"^\s*(.+_CPE_ID_({}))\s*=\s*(.+)$"
+            .format("|".join(self.CPE_fields_defaults)),
+        )
+        self.VERSION_RE = re.compile(
+            rf"^(HOST_)?{pkg.upper().replace('-', '_')}_VERSION\s*=\s*(.+)$",
+        )
+        self.COMMENT_RE = re.compile(r"^\s*#.*")
+
+    def check_line(self, lineno, text):
+        text = self.COMMENT_RE.sub('', text.rstrip())
+
+        # WARNING! The VERSION_RE can _also_ match the same lines as CPE_FIELDS_RE,
+        # but not the other way around. So we must first check for CPE_FIELDS_RE,
+        # and if not matched, then and only then check for VERSION_RE.
+        match = self.CPE_FIELDS_RE.match(text)
+        if match:
+            var, field, val = match.groups()
+            return self._check_field(lineno, text, field, var, val)
+
+        match = self.VERSION_RE.match(text)
+        if match:
+            self.CPE_fields_defaults["VERSION"] = match.groups()[1]
+
+    def after(self):
+        # "VALID" counts in the non-defaults; so when "VALID" is present,
+        # 1 non-default means only "VALID" is present, so that's OK.
+        if self.valid and self.non_defaults > 1:
+            return ["{}:{}: 'YES' is implied when a non-default CPE_ID field is specified: {} ({}#cpe-id)".format(
+                        self.filename,
+                        self.valid["lineno"],
+                        self.valid["text"],
+                        self.url_to_manual,
+            )]
+
+    def _check_field(self, lineno, text, field, var, val):
+        if field == "VERSION" and self.CPE_fields_defaults[field] is None:
+            return ["{}:{}: expecting package version to be set before CPE_ID_VERSION".format(
+                self.filename,
+                lineno,
+            )]
+        if val == self.CPE_fields_defaults[field]:
+            return ["{}:{}: '{}' is the default value for {} ({}#cpe-id)".format(
+                self.filename,
+                lineno,
+                val,
+                var,
+                self.url_to_manual,
+            )]
+        else:
+            if field == "VALID":
+                self.valid = {"lineno": lineno, "text": text}
+            self.non_defaults += 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
