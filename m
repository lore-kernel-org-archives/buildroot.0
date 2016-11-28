From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 28 Nov 2016 09:42:22 -0500
Subject: [Buildroot] [PATCH 1/1] documentation: hash source control archives
Message-ID: <1480344142-6382-1-git-send-email-ash.charles@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Archives created from source control systems should still use a hash
file with a locally-computed e.g. sha256 hash. As discussed [1], using
the 'none' type is no longer a best practice so update the
documentation to clarify this.

[1] http://lists.busybox.net/pipermail/buildroot/2016-November/178165.html

Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>
---
 docs/manual/adding-packages-directory.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index a74761c..96948f8 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -480,8 +480,7 @@ this in a comment line above the hashes.
 The number of spaces does not matter, so one can use spaces (or tabs) to
 properly align the different fields.
 
-The +none+ hash type is reserved to those archives downloaded from a
-repository, like a 'git clone', a 'subversion checkout'...
+For archives downloaded from a repository e.g. from a 'git clone', a 'subversion checkout', using a locally-calculated sha256 hash is recommended although the +none+ type has also been used.
 
 The example below defines a +sha1+ and a +sha256+ published by upstream for
 the main +libfoo-1.2.3.tar.bz2+ tarball, an +md5+ from upstream and a
-- 
2.7.4
