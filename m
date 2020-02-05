From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 18:06:12 +0100
Subject: [Buildroot] [git commit] docs/manual: fields in hash files must be
 separated by two sapces
Message-ID: <20200205165615.510CF8D33A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec060ced7aacda8bb93ee3c138c8ce33f5989ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The seperation of the fields in the hash file should be 2 spaces for
consitency

Update the manual accordingly.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr:
  - drop the notes part, reword the first hunk
  - update the examples
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-directory.txt | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 1c8b9f96b5..4ceb3fd772 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -461,7 +461,7 @@ The hashes stored in that file are used to validate the integrity of the
 downloaded files and of the license files.
 
 The format of this file is one line for each file for which to check the
-hash, each line being space-separated, with these three fields:
+hash, each line with the following three fields separated by two spaces:
 
 * the type of hash, one of:
 ** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
@@ -500,10 +500,6 @@ target run. For a package with multiple versions (like Qt5),
 create the hash file in a subdirectory +<packageversion>+ of that package
 (see also xref:patch-apply-order[]).
 
-.Note
-The number of spaces does not matter, so one can use spaces (or tabs) to
-properly align the different fields.
-
 The +none+ hash type is reserved to those archives downloaded from a
 repository, like a 'git clone', a 'subversion checkout'...
 
@@ -514,22 +510,22 @@ downloaded patch, and an archive with no hash:
 
 ----
 # Hashes from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.{sha1,sha256}:
-sha1   486fb55c3efa71148fe07895fd713ea3a5ae343a                         libfoo-1.2.3.tar.bz2
-sha256 efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369 libfoo-1.2.3.tar.bz2
+sha1  486fb55c3efa71148fe07895fd713ea3a5ae343a  libfoo-1.2.3.tar.bz2
+sha256  efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369  libfoo-1.2.3.tar.bz2
 
 # md5 from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.md5, sha256 locally computed:
-md5    2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
-sha256 01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b libfoo-data.bin
+md5  2d608f3c318c6b7557d551a5a09314f03452f1a1  libfoo-data.bin
+sha256  01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b  libfoo-data.bin
 
 # Locally computed:
-sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-fix-blabla.patch
+sha256  ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9  libfoo-fix-blabla.patch
 
 # No hash for 1234:
-none   xxx                                                              libfoo-1234.tar.gz
+none  xxx  libfoo-1234.tar.gz
 
 # Hash for license files:
-sha256 a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  COPYING
-sha256 01b1f9f2c8ee648a7a596a1abe8aa4ed7899b1c9e5551bda06da6e422b04aa55  doc/COPYING.LGPL
+sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  COPYING
+sha256  01b1f9f2c8ee648a7a596a1abe8aa4ed7899b1c9e5551bda06da6e422b04aa55  doc/COPYING.LGPL
 ----
 
 If the +.hash+ file is present, and it contains one or more hashes for a
