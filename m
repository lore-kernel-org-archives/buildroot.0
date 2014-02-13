From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:48:59 +0100
Subject: [Buildroot] [PATCHv1 10/26] python3: make it exclusive from python
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Buildroot, we do not support installing both Python 2.x and Python
3.x on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 6580cfd..12928f6 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
+	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
-- 
1.8.3.2
