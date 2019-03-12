From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 12 Mar 2019 11:57:13 +0100
Subject: [Buildroot] [PATCH] docs/manual: add note about spurious errors
 duing make printvars
Message-ID: <20190312105713.23968-1-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a note about errors we currently have, as discussed in
http://lists.busybox.net/pipermail/buildroot/2019-March/244212.html

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 docs/manual/make-tips.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index ea1d825bef..475de4ffa7 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -131,3 +131,13 @@ The output of quoted variables can be reused in shell scripts, for example:
  $ echo $BUSYBOX_DEPENDENCIES
  skeleton toolchain
 ----
+
+Note that when using +make printvars+ you might see spurious errors like
+the following. Please help reviewing our Makefile macros and variables
+in order to fix this:
+
+----
+/bin/bash: support/dependencies/check-host-.sh: no such file or directory
+/bin/bash: -c: line 0: syntax error: ')' unexpected
+/bin/bash: -c: line 0: `set -e; TMP="$(mktemp)"; if () >/dev/null 2>&1; then echo ""; else echo ""; fi;
+----
-- 
2.20.1

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190312/e2e0dfb4/attachment.bin>
