From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:11:30 +0200
Subject: [Buildroot] [git commit] support/download: fix check_one_hash
	description
Message-ID: <20170919201318.64DD281076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9a52fad7b68667b93478854b5d07132acdfbef6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Function check_one_hash takes three arguments:
 - algo hash
 - known hash
 - file to hash

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/download/check-hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index c1ff53c..fe9c105 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -42,8 +42,9 @@ if [ ! -f "${h_file}" ]; then
 fi
 
 # Check one hash for a file
-# $1: known hash
-# $2: file (full path)
+# $1: algo hash
+# $2: known hash
+# $3: file (full path)
 check_one_hash() {
     _h="${1}"
     _known="${2}"
