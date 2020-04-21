From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:11:14 +0200
Subject: [Buildroot] [PATCH] package/python-crossbar: needs cbor2
Message-ID: <20200421061115.1218789-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since upstream commit 71f81bf83d3a1d4c564131ed7408f4d7ffe79242, cbor2
is needed by crossbar. This commit first appeared in crossbar release
v19.3.1, which means it is needed since the version bump that took
place in Buildroot commit 44a9f390efc282f41052b39716eab04cd76b1680.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918425

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crossbar/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 2b9077ae87..50b70b8e02 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_BITSTRING
 	select BR2_PACKAGE_PYTHON_CBOR
+	select BR2_PACKAGE_PYTHON_CBOR2
 	select BR2_PACKAGE_PYTHON_CLICK
 	select BR2_PACKAGE_PYTHON_CONSTANTLY
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
-- 
2.25.3
