From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:51:44 +0200
Subject: [Buildroot] [git commit] support/download: restore mandatory check
	of hashes
Message-ID: <20150425095655.3315B80094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f75a9f07a630917ce7225266f1238ded49de5bc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that custom external toolchains to be downloaded properly instruct
to not fail on a missing hash, restore the mandatory hash check for
everything else.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/check-hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 6b0372e..c1ff53c 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -106,5 +106,5 @@ if [ ${nb_checks} -eq 0 ]; then
         ;;
     esac
     printf "ERROR: No hash found for %s\n" "${base}" >&2
-    exit 0
+    exit 3
 fi
