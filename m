From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:08:54 +0200
Subject: [Buildroot] [git commit] support/download: warn when there's no
	.hash file
Message-ID: <20150403120939.66B66818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6b833e7bc7742e64cdde599c341bff787a888d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of silently accepting a missing .hash file, print a warning.

This can be grepped from a build log, to find packages that still have
no hash, with the long-term goal of adding hashes for all packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/check-hash |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 13a76b8..3483077 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -33,6 +33,7 @@ base="${3}"
 
 # Does the hash-file exist?
 if [ -z "${h_file}" -o ! -f "${h_file}" ]; then
+    printf "WARNING: no hash file for %s\n" "${base}" >&2
     exit 0
 fi
 
