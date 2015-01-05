From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 15:15:09 +0100
Subject: [Buildroot] [git commit] support/download: further silence the git
	helper
Message-ID: <20150105141513.41C658079A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bf1174a83274df22423e6a68f0abe98acf3adfc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We expresely call printf in the git helper, calls which were not
addresed in the previous silent-build patchset.

Just redirect stdout to oblivion when being silent.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/git |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/download/git b/support/download/git
index 7f1801f..73cbc0f 100755
--- a/support/download/git
+++ b/support/download/git
@@ -14,7 +14,7 @@ set -e
 verbose=-v
 while getopts :q OPT; do
     case "${OPT}" in
-    q)  verbose=-q;;
+    q)  verbose=-q; exec >/dev/null;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
