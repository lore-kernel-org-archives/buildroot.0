From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 21:57:24 +0200
Subject: [Buildroot] [git commit] docs/manual: prepare-kconfig can be used
	as a dependency of documents
Message-ID: <20160902142941.299397FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fba75c8f9e56e0e17221ab0d827b55f16fc3d78e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-asciidoc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
index 0c10fd1..a278d44 100644
--- a/docs/manual/adding-packages-asciidoc.txt
+++ b/docs/manual/adding-packages-asciidoc.txt
@@ -65,6 +65,8 @@ information is (assuming the document name is +foo+) :
 
 * +FOO_DEPENDENCIES+, optional, the list of packages (most probably,
   host-packages) that must be built before building this document.
+  If a hook of your document needs to access the _Kconfig_ structure,
+  you may add +prepare-kconfig+ to the list of dependencies.
 
 There are also additional hooks (see xref:hooks[] for general information
 on hooks), that a document may set to define extra actions to be done at
