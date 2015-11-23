From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:44 +0100
Subject: [Buildroot] [PATCH 14/51] core/legal-info: update the legal-info
	report header
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <83f76ca51bb54091f3d490fbbcfdcbf7b0950e1a.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In some cases, the toolchain sources are now recovered and available in
the legal-info output. So, adapt the header to use conditional instead
of an definitive negation.

Also update the part about saving the sources: it's not the license list
that defines whether sources are installed, but rather whether the
package is reditributable or not. Update the header acoordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/legal-info/README.header | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index 90fc445..08aa74d 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -12,11 +12,11 @@ This material is composed of the following items.
  * The Buildroot configuration file; this has been saved in buildroot.config.
  * The toolchain (cross-compiler and related tools) used to generate all the
    compiled programs.
-   Note: this has not been saved due to technical limitations, you must
+   Note: this may not been saved due to technical limitations, you may need to
    collect it manually.
  * The source code for all packages; this has been saved in the sources/
-   subdirectory (except for the proprietary packages, which have not been
-   saved).
+   subdirectory (except for the non-redistributable packages, which have not
+   been saved).
  * A manifest file listing the configured packages and related information.
  * The license text of the packages; they have been saved in the licenses/
    subdirectory.
-- 
1.9.1
