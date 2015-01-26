From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 23:13:44 +0100
Subject: [Buildroot] [git commit] grep: add patch to fix CVE-2015-1345
Message-ID: <20150126221359.E61CD8044E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ae2f86cf29c52ab086f4d380fdb41f9c1f599f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2015-1345 - heap buffer overrun.
See https://bugzilla.redhat.com/show_bug.cgi?id=1183651
Patch upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/0001-fix-CVE-2015-1345.patch |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

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
