From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:43:02 -0700
Subject: [Buildroot] [PATCH 6/7] package/perf: add patch to prevent crash on
	empty history buffer
In-Reply-To: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426714983-24803-6-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/perf/0002-fix-crash-on-empty-buffer.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/perf/0002-fix-crash-on-empty-buffer.patch

diff --git a/package/perf/0002-fix-crash-on-empty-buffer.patch b/package/perf/0002-fix-crash-on-empty-buffer.patch
new file mode 100644
index 0000000..b8383cf
--- /dev/null
+++ b/package/perf/0002-fix-crash-on-empty-buffer.patch
@@ -0,0 +1,11 @@
+--- a/tools/perf/ui/browsers/hists.c
++++ b/tools/perf/ui/browsers/hists.c
+@@ -1059,7 +1059,7 @@ do_offset:
+			}
+			first = false;
+		}
+-	} else {
++	} else if (nd) {
+		browser->top = nd;
+		h = rb_entry(nd, struct hist_entry, rb_node);
+		h->row_offset = 0;
-- 
2.3.3
