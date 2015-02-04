From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:33:59 +0100
Subject: [Buildroot] [PATCH 01/21] python-coherence: add missing indirect
	dependency on c++
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-coherence/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-coherence/Config.in b/package/python-coherence/Config.in
index d4034e7..71f79f4 100644
--- a/package/python-coherence/Config.in
+++ b/package/python-coherence/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_COHERENCE
 	bool "python-coherence"
 	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	select BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
 	select BR2_PACKAGE_PYTHON_PYASN
@@ -8,3 +9,7 @@ config BR2_PACKAGE_PYTHON_COHERENCE
 	  A DLNA/UPnP Media Server and Framework for the Digital Living.
 
 	  http://coherence-project.org/
+
+comment "python-coherence needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.1.4
