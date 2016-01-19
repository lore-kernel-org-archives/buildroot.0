From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:24:34 +0100
Subject: [Buildroot] [git commit] docs/manual: add ordering of kconfig
	options' attributes
Message-ID: <20160119212439.40428827ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd6153680bc39bab0664b0a77136e3d13425937e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to ensure all packages follow the same coding style, so we add a
blurb about the order of kconfig options' attributes:

  - first, the type and the prompt
  - the default value if needed
  - then dependencies of the 'depends on' category
  - followed by dependencies of the 'select' form
  - with eventually the help text

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
