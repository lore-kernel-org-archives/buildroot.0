From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Nov 2014 16:25:56 +0100
Subject: [Buildroot] [PATCH 4/5] libevent: Remove hash file
In-Reply-To: <cover.1414941796.git.yann.morin.1998@free.fr>
References: <cover.1414941796.git.yann.morin.1998@free.fr>
Message-ID: <7e828df5dc012e40da5859ccb59fbe600a9899c0.1414941796.git.yann.morin.1998@free.fr>
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
 package/libevent/libevent.hash | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 package/libevent/libevent.hash

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
deleted file mode 100644
index efa0dc5..0000000
--- a/package/libevent/libevent.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256	22a530a8a5ba1cb9c080cba033206b17dacd21437762155c6d30ee6469f574f5	libevent-2.0.21-stable.tar.gz
-- 
1.9.1
