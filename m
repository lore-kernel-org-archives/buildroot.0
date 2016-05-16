From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 00:12:59 +0200
Subject: [Buildroot] [PATCH 6/9] gdb: specify hashes for the ARC and
	Microblaze versions
In-Reply-To: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463436782-17051-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ARC and Microblaze, a special GDB version is used, fetched from
Github in both cases. Now that we consider Github generated tarballs
to be stable, we can specify hashes for those versions, rather than
using the special "none" hash to skip the hash check.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 0fec3d0..dd55189 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,6 +3,6 @@ sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b1550607
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 sha512  eadd2a59a1e48b1484eb2bea85256d6b1912926bc8b690793d02babf2639608bd22a0f2de77d4f60092da3b1dafeaa6d75a7cff3e84bd4e22fc46364b68e5e9f	gdb-7.11.tar.xz
 
-# No hash for the ARC & microblaze variants, comes from the github-helper:
-none	xxx	gdb-arc-2016.03-rc2-gdb.tar.gz
-none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
+# Locally calculated (fetched from Github)
+sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
+sha512  6026889c72baee2f57d3e706fdd07c19e9b0b27d9ab87d32da39cc3bc3afe911f0d30e3bbca6fd6281b7e94da66d475b17edadfd58bce4d8b419ee8d475660fa	gdb-arc-2016.03-rc2-gdb.tar.gz
-- 
2.7.4
