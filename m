From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  1 Apr 2015 00:34:14 +0200
Subject: [Buildroot] [PATCH] support/graph-depends: allow excluding virtual
	packages
Message-ID: <1427841254-2807-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for --stop-on, make --exclude recognise the keyword 'virtual',
to stop on virtual packages (as explained in the help...).

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/graph-depends | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.9.1
