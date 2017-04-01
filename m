From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:11:18 +0200
Subject: [Buildroot] [git commit] docs/manual: refer to SPDX License List
Message-ID: <20170401131221.28F3C825B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5286dec396e13c23f055344c5fd9f8aed1269ea5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX short identifier for license string as much as
possible. So refer to SPDX license list and use SPDX short identifier
for license strings in documentation.

Also remove License abbreviations that we have.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
[Thomas: take into account suggestions from Arnout.]
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt       | 12 ++---
 docs/manual/adding-packages-kernel-module.txt |  4 +-
 docs/manual/adding-packages-perl.txt          |  2 +-
 docs/manual/adding-packages-python.txt        |  2 +-
 docs/manual/contribute.txt                    |  2 +-
 docs/manual/legal-notice.txt                  | 75 ---------------------------
 6 files changed, 11 insertions(+), 86 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index a08283c..71e27b6 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -22,7 +22,7 @@ system is based on hand-written Makefiles or shell scripts.
 07: LIBFOO_VERSION = 1.0
 08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
 09: LIBFOO_SITE = http://www.foosoftware.org/download
-10: LIBFOO_LICENSE = GPLv3+
+10: LIBFOO_LICENSE = GPL-3.0+
 11: LIBFOO_LICENSE_FILES = COPYING
 12: LIBFOO_INSTALL_STAGING = YES
 13: LIBFOO_CONFIG_SCRIPTS = libfoo-config
@@ -396,8 +396,8 @@ information is (assuming the package name is +libfoo+) :
 * +LIBFOO_LICENSE+ defines the license (or licenses) under which the package
   is released.
   This name will appear in the manifest file produced by +make legal-info+.
-  If the license appears in xref:legal-info-list-licenses[the following list],
-  use the same string to make the manifest file uniform.
+  If the license appears in https://spdx.org/licenses/[the SPDX License List],
+  use the SPDX short identifier to make the manifest file uniform.
   Otherwise, describe the license in a precise and concise way, avoiding
   ambiguous names such as +BSD+ which actually name a family of licenses.
   This variable is optional. If it is not defined, +unknown+ will appear in
@@ -405,12 +405,12 @@ information is (assuming the package name is +libfoo+) :
   The expected format for this variable must comply with the following rules:
   ** If different parts of the package are released under different
   licenses, then +comma+ separate licenses (e.g. +`LIBFOO_LICENSE =
-  GPLv2+, LGPLv2.1+`+). If there is clear distinction between which
+  GPL-2.0+, LGPL-2.1+`+). If there is clear distinction between which
   component is licensed under what license, then annotate the license
   with that component, between parenthesis (e.g. +`LIBFOO_LICENSE =
-  GPLv2+ (programs), LGPLv2.1+ (libraries)`+).
+  GPL-2.0+ (programs), LGPL-2.1+ (libraries)`+).
   ** If the package is dual licensed, then separate licenses with the
-  +or+ keyword (e.g. +`LIBFOO_LICENSE = AFLv2.1 or GPLv2+`+).
+  +or+ keyword (e.g. +`LIBFOO_LICENSE = AFL-2.1 or GPL-2.0+`+).
 
 * +LIBFOO_LICENSE_FILES+ is a space-separated list of files in the package
   tarball that contain the license(s) under which the package is released.
diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
index ffeeef5..b609ecc 100644
--- a/docs/manual/adding-packages-kernel-module.txt
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -24,7 +24,7 @@ builds a kernel module, and no other component:
 07: FOO_VERSION = 1.2.3
 08: FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
 09: FOO_SITE = http://www.foosoftware.org/download
-10: FOO_LICENSE = GPLv2
+10: FOO_LICENSE = GPL-2.0
 11: FOO_LICENSE_FILES = COPYING
 12: 
 13: $(eval $(kernel-module))
@@ -63,7 +63,7 @@ Let's look at a more complex example:
 07: FOO_VERSION = 1.2.3
 08: FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
 09: FOO_SITE = http://www.foosoftware.org/download
-10: FOO_LICENSE = GPLv2
+10: FOO_LICENSE = GPL-2.0
 11: FOO_LICENSE_FILES = COPYING
 12: 
 13: FOO_MODULE_SUBDIRS = driver/base
diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index 3476b62..08ef559 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -21,7 +21,7 @@ with an example :
 08: PERL_FOO_BAR_SOURCE = Foo-Bar-$(PERL_FOO_BAR_VERSION).tar.gz
 09: PERL_FOO_BAR_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MO/MONGER
 10: PERL_FOO_BAR_DEPENDENCIES = perl-strictures
-11: PERL_FOO_BAR_LICENSE = Artistic or GPLv1+
+11: PERL_FOO_BAR_LICENSE = Artistic or GPL-1.0+
 12: PERL_FOO_BAR_LICENSE_FILES = LICENSE
 13:
 14: $(eval $(perl-package))
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 19d31e2..a67a4be 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -24,7 +24,7 @@ with an example :
 07: PYTHON_FOO_VERSION = 1.0
 08: PYTHON_FOO_SOURCE = python-foo-$(PYTHON_FOO_VERSION).tar.xz
 09: PYTHON_FOO_SITE = http://www.foosoftware.org/download
-10: PYTHON_FOO_LICENSE = BSD-3c
+10: PYTHON_FOO_LICENSE = BSD-3-Clause
 11: PYTHON_FOO_LICENSE_FILES = LICENSE
 12: PYTHON_FOO_ENV = SOME_VAR=1
 13: PYTHON_FOO_DEPENDENCIES = libmad
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index c2c8a90..4ec01a8 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -227,7 +227,7 @@ Finally, the patch should be signed off. This is done by adding
 +Signed-off-by: Your Real Name <your@email.address>+ at the end of the
 commit message. +git commit -s+ does that for you, if configured
 properly. The +Signed-off-by+ tag means that you publish the patch
-under the Buildroot license (i.e. GPLv2, except for package patches,
+under the Buildroot license (i.e. GPL-2.0, except for package patches,
 which have the upstream license), and that you are allowed to do so.
 See http://developercertificate.org/[the Developer Certificate of
 Origin] for details.
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index df82fd2..6975328 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -83,81 +83,6 @@ of +make legal-info+ before using it as your own compliance delivery. See
 the _NO WARRANTY_ clauses (clauses 11 and 12) in the +COPYING+ file at the
 root of the Buildroot distribution.
 
-[[legal-info-list-licenses]]
-=== License abbreviations
-
-Here is a list of the licenses that are most widely used by packages in
-Buildroot, with the name used in the manifest files:
-
-* `AGPLv3`:
-  http://www.gnu.org/licenses/agpl-3.0.en.html[
-  GNU Affero General Public License, version 3];
-* `GPLv2`:
-  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
-  GNU General Public License, version 2];
-* `GPLv2+`:
-  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
-  GNU General Public License, version 2]
-  or (at your option) any later version;
-* `GPLv3`:
-  http://www.gnu.org/licenses/gpl.html[
-  GNU General Public License, version 3];
-* `GPLv3+`:
-  http://www.gnu.org/licenses/gpl.html[
-  GNU General Public License, version 3]
-  or (at your option) any later version;
-* `GPL`:
-  http://www.gnu.org/licenses/gpl.html[
-  GNU General Public License] (any version);
-* `LGPLv2`:
-  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
-  GNU Library General Public License, version 2];
-* `LGPLv2+`:
-  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
-  GNU Library General Public License, version 2]
-  or (at your option) any later version;
-* `LGPLv2.1`:
-  http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
-  GNU Lesser General Public License, version 2.1];
-* `LGPLv2.1+`:
-  http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
-  GNU Lesser General Public License, version 2.1]
-  or (at your option) any later version;
-* `LGPLv3`:
-  http://www.gnu.org/licenses/lgpl.html[
-  GNU Lesser General Public License, version 3];
-* `LGPLv3+`:
-  http://www.gnu.org/licenses/lgpl.html[
-  GNU Lesser General Public License, version 3]
-  or (at your option) any later version;
-* `LGPL`:
-  http://www.gnu.org/licenses/lgpl.html[
-  GNU Lesser General Public License] (any version);
-* `BSD-4c`:
-  http://directory.fsf.org/wiki/License:BSD_4Clause[
-  Original BSD 4-clause license];
-* `BSD-3c`:
-  http://opensource.org/licenses/BSD-3-Clause[
-  BSD 3-clause license];
-* `BSD-2c`:
-  http://opensource.org/licenses/BSD-2-Clause[
-  BSD 2-clause license];
-* `MIT`:
-  http://opensource.org/licenses/mit-license.html[
-  MIT-style license];
-* `Apache-2.0`:
-  http://apache.org/licenses/LICENSE-2.0.html[
-  Apache License, version 2.0];
-* `ISC`:
-  https://opensource.org/licenses/ISC[
-  ISC License];
-* `MPLv1.1`:
-  https://www.mozilla.org/en-US/MPL/1.1[
-  Mozilla Public License Version 1.1]
-* `MPLv2.0`:
-  https://www.mozilla.org/en-US/MPL/2.0[
-  Mozilla Public License Version 2.0]
-
 [[legal-info-buildroot]]
 === Complying with the Buildroot license
 
