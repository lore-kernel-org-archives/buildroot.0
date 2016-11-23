From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 13:58:56 +0100
Subject: [Buildroot] [PATCH v4 17/18] reproducible: improve help text
In-Reply-To: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479905937-17241-18-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

Notes:
    v3:
      - Reword help message (Arnout)
    v2:
      - New patch (Thomas)

 Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Config.in b/Config.in
index 5cf0c4d..e382cf6 100644
--- a/Config.in
+++ b/Config.in
@@ -707,6 +707,12 @@ config BR2_REPRODUCIBLE
 	  this allows to generate exactly identical binaries from one
 	  build to the other, including on different machines.
 
+	  The current implementation is restricted to builds with the same
+	  output directory. Many (absolute) paths are recorded in intermediary
+	  files, and it is very likely that some of these paths leak into the
+	  target rootfs. If you build with the same O=... path, however, the
+	  result is identical.
+
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
-- 
1.9.1
