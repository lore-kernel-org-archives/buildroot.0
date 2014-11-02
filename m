From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Nov 2014 16:25:55 +0100
Subject: [Buildroot] [PATCH 3/5] opencv: Remove hash file
In-Reply-To: <cover.1414941796.git.yann.morin.1998@free.fr>
References: <cover.1414941796.git.yann.morin.1998@free.fr>
Message-ID: <a64cc59cb138eaf1fde70f9024f982863b3cb1a7.1414941796.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Since the tarball we download is generated from GitHub, there's no
saying that the tarball won't differ in a month from now.
So the hash has no value there.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
YEM:
  - remove comment about changes to the manual, done in a previous
    patch;
  - after some testing, it seems tarballs are cached for only about 15
    minutes, which is largely enough to easily trigger a false hash
    mismatch.
---
 package/opencv/opencv.hash | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 package/opencv/opencv.hash

diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
deleted file mode 100644
index fc3b750..0000000
--- a/package/opencv/opencv.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://github.com/itseez/opencv/archive/2.4.10/
-md5	3346a59310d788d3845f4fd6043a108a	opencv-2.4.10.tar.gz
-sha1	a0c2d5944364fc4f26b6160b33c03082b1fa08c1	opencv-2.4.10.tar.gz
-- 
1.9.1
