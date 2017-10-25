From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Oct 2017 22:09:56 +0200
Subject: [Buildroot] [PATCH v2 06/13] support/download: make sure the
	download folder is created
In-Reply-To: <20171025201003.16105-1-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
Message-ID: <20171025201003.16105-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

At the moment, it means that we make sure that BR2_DL_DIR is created, in
the future, it will make sure that BR2_DL_DIR/PKG_NAME/ is created.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1 --> v2:
  - from https://github.com/maximeh/buildroot/commit/e19dd1a941063dc1429a5f5ea1b84f222e608f5d.patch
---
 support/download/dl-wrapper | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 67e9742767..49caf3717b 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -50,6 +50,7 @@ main() {
     if [ -z "${output}" ]; then
         error "no output specified, use -o\n"
     fi
+    mkdir -p "$(dirname "${output}")"
 
     # If the output file already exists and:
     # - there's no .hash file: do not download it again and exit promptly
-- 
2.14.2
