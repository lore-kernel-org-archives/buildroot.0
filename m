From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Mar 2021 17:05:59 +0100
Subject: [Buildroot] [git commit] docs/manual: do not expose CPE_ID_VALID as
 package-settable
Message-ID: <20210306160433.9BFCE8163C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2770ccf471f2284dc9cce51bee1a7db7aff3fb10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FOO_CPE_ID_VALID is an internal implementation detail. Packages should
really define an actual CPE_ID variable to trigger their full CPE_ID
definition.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: completely drop any mention of _CPE_ID_VALID in the manual]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 75af18b70c..2201d4385e 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -528,14 +528,8 @@ LIBFOO_IGNORE_CVES += CVE-2020-54321
 +
 If any of those variables is defined, then the generic package
 infrastructure assumes the package provides valid CPE information. In
-this case, +LIBFOO_CPE_ID_VALID = YES+ will be set, and the generic
-package infrastructure will define +LIBFOO_CPE_ID+.
-+
-Alternatively, a package can also explicitly set +LIBFOO_CPE_ID_VALID
-= YES+ if the default values for +LIBFOO_CPE_ID_PREFIX+,
-+LIBFOO_CPE_ID_VENDOR+, +LIBFOO_CPE_ID_PRODUCT+,
-+LIBFOO_CPE_ID_VERSION+, +LIBFOO_CPE_ID_UPDATE+ are all correct for
-this package and don't need to be explicitly overridden.
+this case, the generic package infrastructure will define
++LIBFOO_CPE_ID+.
 +
 For a host package, if its +LIBFOO_CPE_ID_*+ variables are not
 defined, it inherits the value of those variables from the
