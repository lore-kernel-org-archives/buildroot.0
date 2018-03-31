From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 16:24:00 +0200
Subject: [Buildroot] [v3 06/13] support/download: make sure the download
 folder is created
In-Reply-To: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180331142407.9522-6-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the moment, it means that we make sure that BR2_DL_DIR is created, in
the future, it will make sure that BR2_DL_DIR/PKG_NAME/ is created.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
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
2.16.2
