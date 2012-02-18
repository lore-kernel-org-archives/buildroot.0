From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 18 Feb 2012 22:51:31 +0100
Subject: [Buildroot] [PATCH 1/4] website: add target to prepare website
Message-ID: <1329601894-7691-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile       |    7 ++++++-
 docs/docs.html |    4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 7d8dd2e..6d45142 100644
--- a/Makefile
+++ b/Makefile
@@ -762,5 +762,10 @@ endef
 MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
 $(eval $(call GENDOC,manual))
 
-.PHONY: $(noconfig_targets)
+website: manual-html
+	mkdir -p $(O)/website
+	cp docs/*.html $(O)/website
+	cp $(O)/docs/manual/manual.html $(O)/website
+
+.PHONY: website $(noconfig_targets)
 
diff --git a/docs/docs.html b/docs/docs.html
index 851d1d2..c3db8b9 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -3,13 +3,13 @@
 <h3>Documentation</h3>
 
 <p>Our document "Buildroot usage and documentation" is where you want
-to start reading if you wish to understand how Buildroot work, or wish
+to start reading if you wish to understand how Buildroot works, or wish
 to change/extend/fix things. If you find any errors (factual,
 grammatical, whatever) please report them. Choose between:</p>
 
 <ul>
   <li><a href="/downloads/buildroot.html">Latest stable release</a></li>
-  <li><a href="buildroot.html">GIT head revision</a></li>
+  <li><a href="manual.html">GIT head revision</a></li>
 </ul>
 
 <p>If you find that you need help with Buildroot, you can ask for
-- 
1.7.9
