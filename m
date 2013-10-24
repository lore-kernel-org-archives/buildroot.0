From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 24 Oct 2013 11:46:12 +0200
Subject: [Buildroot] [PATCH 2/2] webkit: fix build with bison 3.0
In-Reply-To: <1382607972-30863-1-git-send-email-arnout@mind.be>
References: <1382607972-30863-1-git-send-email-arnout@mind.be>
Message-ID: <1382607972-30863-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply a patch from upstream.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I don't understand why this doesn't show up in autobuilders...

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/webkit/webkit-0008-support-bison-3.0.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/webkit/webkit-0008-support-bison-3.0.patch

diff --git a/package/webkit/webkit-0008-support-bison-3.0.patch b/package/webkit/webkit-0008-support-bison-3.0.patch
new file mode 100644
index 0000000..2b392a2
--- /dev/null
+++ b/package/webkit/webkit-0008-support-bison-3.0.patch
@@ -0,0 +1,22 @@
+ANGLE doesn't build with bison 3.0
+
+Author: allan.jensen at digia.com
+?https://bugs.webkit.org/show_bug.cgi?id=119798
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
-- 
1.8.4.rc3
