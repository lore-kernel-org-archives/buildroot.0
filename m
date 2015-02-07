From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 20:47:32 +0100
Subject: [Buildroot] [git commit] python-coherence: add missing indirect
	dependency on c++
Message-ID: <20150207202909.E7A0480474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc1d6d10cfc9c61f81b1d3c267061f9b195abd34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-coherence/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
