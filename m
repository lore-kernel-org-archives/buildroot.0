From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:21 +0100
Subject: [Buildroot] [PATCH 29/80 v1] docs/manual: add ordering of kconfig
	options' attributes
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <82e2631f78a5305d258e97b6b0615d165e36657c.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to ensure all packages follow the same coding style, so we add a
blurb about the order of kconfig options' attributes:

  - first, the type and the prompt
  - the default value if needed
  - then dependencies of the 'depends on' category
  - followed by dependencies of the 'select' form
  - with eventually the help text

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-directory.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index d0de358..b9596a2 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -39,6 +39,15 @@ itself should be indented with one tab and two spaces, lines should
 not be longer than 72 columns, and it must mention the upstream URL
 of the project.
 
+As a convention specific to Buildroot, the ordering of the attributes
+is as follows:
+
+1. The type of option: +bool+, +string+... with the prompt
+2. If needed, the +default+ value(s)
+3. Any dependency of the +depends on+ form
+4. Any dependency of the +select+ form
+5. The help keyword and help text.
+
 You can add other sub-options into a +if BR2_PACKAGE_LIBFOO...endif+
 statement to configure particular things in your software. You can look at
 examples in other packages. The syntax of the +Config.in+ file is the same
-- 
1.9.1
