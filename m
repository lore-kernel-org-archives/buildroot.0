From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat,  7 Mar 2020 08:56:28 +0100
Subject: [Buildroot] [PATCH v5 07/12] support/scripts/pkg-stats: store pkg
 dir path
In-Reply-To: <20200307075633.7514-1-heiko.thiery@gmail.com>
References: <20200307075633.7514-1-heiko.thiery@gmail.com>
Message-ID: <20200307075633.7514-8-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This value can be used for later processing.

In the buildroot-stats application this is used to create links pointing
to the git repo of buildroot.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0e7d60bdbb..016c2322e6 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -64,6 +64,7 @@ class Package:
     def __init__(self, name, path):
         self.name = name
         self.path = path
+        self.pkg_path = os.path.dirname(path)
         self.infras = None
         self.license = None
         self.has_license = False
-- 
2.20.1
