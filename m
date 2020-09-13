From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:56:14 +0200
Subject: [Buildroot] [git commit] package/python3: do not install MS Windows
 installers on the target
Message-ID: <20200913141208.95FC983A5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e97032c82deb11653db0f7e41fa8397e0b988bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot generates Linux systems, so there is no need to have
MS Windows executables in there.

This reduces the target filesystem size by about 2MB:
$ du -hcs usr/lib/python3.8/distutils/command/wininst-*.exe
60K usr/lib/python3.8/distutils/command/wininst-6.0.exe
64K usr/lib/python3.8/distutils/command/wininst-7.1.exe
60K usr/lib/python3.8/distutils/command/wininst-8.0.exe
192K    usr/lib/python3.8/distutils/command/wininst-9.0.exe
220K    usr/lib/python3.8/distutils/command/wininst-9.0-amd64.exe
188K    usr/lib/python3.8/distutils/command/wininst-10.0.exe
220K    usr/lib/python3.8/distutils/command/wininst-10.0-amd64.exe
448K    usr/lib/python3.8/distutils/command/wininst-14.0.exe
576K    usr/lib/python3.8/distutils/command/wininst-14.0-amd64.exe
2,0M    total

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d63a8bc080..017dbd40da 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -212,6 +212,7 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
+	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/distutils/command/wininst*.exe
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m-*/ \
 		-type f -not -name Makefile` ; do \
 		rm -f $$i ; \
