From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 19:19:22 +0100
Subject: [Buildroot] [PATCH 1/9] rt-tests: mention that NPTL thread
	implementation is needed
In-Reply-To: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364149170-5521-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch superseds http://patchwork.ozlabs.org/patch/150161/, but
does it in a different way. Since we don't have a way of selecting the
thread implementation for external toolchains, and it sounds a bit too
heavy to add new config options just for the sake of rt-tests, we
instead simply add some help text to the rt-tests package explaining
that NPTL thread implementation is needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rt-tests/Config.in |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 0999ebf..a040139 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -14,6 +14,12 @@ config BR2_PACKAGE_RT_TESTS
 	  installed if a Python interpreter has been selected in the
 	  Buildroot configuration.
 
+	  Note that this package requires a toolchain built with the
+	  NPTL implementation of the pthread API (this is always the
+	  case with glibc/eglibc toolchains, but may not necessarily
+	  be the case with uClibc toolchains, since the thread
+	  implementation is configurable).
+
 	  http://rt.wiki.kernel.org
 
 comment "rt-tests requires a toolchain with threads support"
-- 
1.7.9.5
