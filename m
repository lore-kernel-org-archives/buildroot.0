From: =?UTF-8?q?William=20Wennerstr=C3=B6m?= <william@willeponken.me>
Date: Tue,  2 Oct 2018 17:45:36 +0200
Subject: [Buildroot] [PATCH 1/1] rtl8188eu: bump to latest commit
Message-ID: <20181002154536.32623-1-william@willeponken.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rtl8188eu driver wouldn't build due to Linux kernel API changes.

Several fixes for API changes to Linux kernel >=4.11 has been commited
to the repository.

I have bumped to the latest commit and verified that it builds on master
(also successfully built on the 2018.08 branch).

Signed-off-by: William Wennerstr?m <william@willeponken.me>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 6f68f44259..9ec2ffee89 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9f16fab009bd7bc9e377cf7dcdf82be1b60e7f88e27f2833eea5b422d104e3fe rtl8188eu-ced2b64a1139dcaf86947e3a9f7617dffbd64239.tar.gz
+sha256 cc872aa0991c044d35abfcc81543bad950c6aae487e37d5a09d1cbf8c4cb3058 rtl8188eu-4b0ecca485b9f11f58670b69aa9f90ecad7da02f.tar.gz
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5c1cc73da4..f292bba134 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-RTL8188EU_VERSION = ced2b64a1139dcaf86947e3a9f7617dffbd64239
+RTL8188EU_VERSION = 4b0ecca485b9f11f58670b69aa9f90ecad7da02f
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
--
2.16.4
