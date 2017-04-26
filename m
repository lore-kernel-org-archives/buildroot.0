From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:20:16 +0200
Subject: [Buildroot] [git commit] python-web2py: security bump to version
	2.14.6
Message-ID: <20170426072113.9E61080648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a534030c6e67ff0319f8af2b55fe977a06f17dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2016-4806 - Web2py versions 2.14.5 and below was affected by Local File
Inclusion vulnerability, which allows a malicious intended user to
read/access web server sensitive files.

CVE-2016-4807 - Web2py versions 2.14.5 and below was affected by Reflected
XSS vulnerability, which allows an attacker to perform an XSS attack on
logged in user (admin).

CVE-2016-4808 - Web2py versions 2.14.5 and below was affected by CSRF (Cross
Site Request Forgery) vulnerability, which allows an attacker to trick a
logged in user to perform some unwanted actions i.e An attacker can trick an
victim to disable the installed application just by sending a URL to victim.

CVE-2016-10321 - web2py before 2.14.6 does not properly check if a host is
denied before verifying passwords, allowing a remote attacker to perform
brute-force attacks.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 3de8dbf..9c1de90 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 7e22a5624d8d2909e165110f0bec6b43ee36ff6834d689f4027e06dece662031   python-web2py-R-2.12.3.tar.gz
+sha256 6079aeaa352ec51e0da5e6abc71fa74cdb3a781e06a311b5826618624362a7b2   python-web2py-R-2.14.6.tar.gz
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 7fe9f82..9aadb30 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = R-2.12.3
+PYTHON_WEB2PY_VERSION = R-2.14.6
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
