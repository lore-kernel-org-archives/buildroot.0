From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 20:02:54 +0200
Subject: [Buildroot] [git commit] support/graph-depends: allow excluding
	virtual packages
Message-ID: <20150401180337.3A392817A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bcfaaaf4eab0c1cd7df4859757d8e42126e8ae4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like for --stop-on, make --exclude recognise the keyword 'virtual',
to stop on virtual packages (as explained in the help...).

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index c1fc042..08ecc5a 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -333,6 +333,10 @@ def print_pkg_deps(depth, pkg):
                 if fnmatch(d,p):
                     add = False
                     break
+                if dict_version.get(d) == "virtual" \
+                and "virtual" in exclude_list:
+                    add = False
+                    break
             if add:
                 print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
                 print_pkg_deps(depth+1, d)
