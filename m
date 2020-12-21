From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 14:41:36 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/python-lxml:
 security bump to version 4.6.2
Message-ID: <20201221132722.DED02814D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df85380be79a0024cbecb72fde3f2f5c6c4333f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes the following security issues:

* 4.6.2: A vulnerability (CVE-2020-27783) was discovered in the HTML Cleaner
  by Yaniv Nizry, which allowed JavaScript to pass through.  The cleaner now
  removes more sneaky "style" content.

* 4.6.1: A vulnerability was discovered in the HTML Cleaner by Yaniv Nizry,
  which allowed JavaScript to pass through.  The cleaner now removes more
  sneaky "style" content.

For more details, see the changes file:
https://github.com/lxml/lxml/blob/lxml-4.6.2/CHANGES.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ea41a5faab3fda4589956b24d4731292872934a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 240314e888..7918e08745 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2  lxml-4.5.1.tar.gz
+sha256  cd11c7e8d21af997ee8079037fff88f16fda188a9776eb4b81c7e4c9c0a7d7fc  lxml-4.6.2.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 7e727a6753..a8874737e2 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.5.1
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/03/a8/73d795778143be51d8b86750b371b3efcd7139987f71618ad9f4b8b65543
+PYTHON_LXML_VERSION = 4.6.2
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/db/f7/43fecb94d66959c1e23aa53d6161231dca0e93ec500224cf31b3c4073e37
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
