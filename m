From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Jan 2015 17:58:14 -0300
Subject: [Buildroot] [PATCH] grep: add patch to fix CVE-2015-1345
Message-ID: <1422305894-6845-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2015-1345 - heap buffer overrun.
See https://bugzilla.redhat.com/show_bug.cgi?id=1183651
Patch upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/0001-fix-CVE-2015-1345.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/grep/0001-fix-CVE-2015-1345.patch

diff --git a/package/grep/0001-fix-CVE-2015-1345.patch b/package/grep/0001-fix-CVE-2015-1345.patch
new file mode 100644
index 0000000..f7701aa
--- /dev/null
+++ b/package/grep/0001-fix-CVE-2015-1345.patch
@@ -0,0 +1,20 @@
+Simplified patch from upstream to avoid autoreconf. Source:
+http://git.savannah.gnu.org/cgit/grep.git/commit/?id=83a95bd8c8561875b948cadd417c653dbe7ef2e2
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+diff --git a/src/kwset.c b/src/kwset.c
+index 4003c8d..376f7c3 100644
+--- a/src/kwset.c
++++ b/src/kwset.c
+@@ -643,6 +643,8 @@ bmexec_trans (kwset_t kwset, char const *text, size_t size)
+                     if (! tp)
+                       return -1;
+                     tp++;
++                    if (ep <= tp)
++                      break;
+                   }
+               }
+           }
+--
+cgit v0.9.0.2
-- 
2.0.5
