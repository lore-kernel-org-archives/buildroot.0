From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:05 +0200
Subject: [Buildroot] [PATCH 10/21 RFC] docs/manual: prepare-config can be
	used as a dependency of documents
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <7bc5de3f455dccc34aad9604d20d5ef0cc1d86a5.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
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
-- 
1.9.1
