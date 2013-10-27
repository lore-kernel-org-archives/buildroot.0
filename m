From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 10:52:26 +0100
Subject: [Buildroot] [git commit] webkit: fix build with bison 3.0
Message-ID: <20131027095653.2E5549A6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73a6b6801afd2ec9c24126236a3001e86db67245
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply a patch from upstream.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkit/webkit-0008-support-bison-3.0.patch |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/webkit/webkit-0008-support-bison-3.0.patch b/package/webkit/webkit-0008-support-bison-3.0.patch
new file mode 100644
index 0000000..c081b20
--- /dev/null
+++ b/package/webkit/webkit-0008-support-bison-3.0.patch
@@ -0,0 +1,22 @@
+ANGLE doesn't build with bison 3.0
+
+Author: allan.jensen at digia.com
+???https://bugs.webkit.org/show_bug.cgi?id=119798
+Reviewed by Antti Koivisto.
+Make glslang.y compatible with bison 3.0, by using %lex-param
+to set YYLEX_PARAM and getting rid of useless YYID macro.
+
+From upstream: http://trac.webkit.org/changeset/154109
+[Arnout: adapted to our older webkit version]
+Signed-off-by: Arnout Vandecaeppelle (Essensium/Mind) <arnout@mind.be>
+---
+Index: trunk/Source/ThirdParty/ANGLE/src/compiler/glslang.y
+===================================================================
+--- trunk/Source/ThirdParty/ANGLE/src/compiler/glslang.y	(revision 154108)
++++ trunk/Source/ThirdParty/ANGLE/src/compiler/glslang.y	(revision 154109)
+@@ -48,4 +48,5 @@
+ %pure-parser
+ %parse-param {TParseContext* context}
++%lex-param {YYLEX_PARAM}
+ 
+ %union {
