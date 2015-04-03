From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:21:47 +0200
Subject: [Buildroot] [git commit] support/download: quick fix to avoid
	breaking on custom toolchains
Message-ID: <20150403122150.B526881963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=209b75499657a7eb803ba8edcff6701341401b4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the user selects a custom toolchain to be downloaded, there's no
hash for that toolchain, so the download fails, now that hashes are
mandatory.

Fix that by simply exiting as if there was no error, until we have a
better fix...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/check-hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 3483077..67c1780 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -96,5 +96,5 @@ done <"${h_file}"
 
 if [ ${nb_checks} -eq 0 ]; then
     printf "ERROR: No hash found for %s\n" "${base}" >&2
-    exit 3
+    exit 0
 fi
