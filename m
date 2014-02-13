From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:49:07 +0100
Subject: [Buildroot] [PATCHv1 18/26] python,
	python3: enable unicodedata for host-python, needed by setuptools
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we are going to bump setuptools to a much newer version, the host
python needs to be built with support for unicodedata.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk   | 2 +-
 package/python3/python3.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 0469820..3b0a4dd 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -25,7 +25,7 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-curses	\
 	--disable-codecs-cjk	\
 	--disable-nis		\
-	--disable-unicodedata	\
+	--enable-unicodedata	\
 	--disable-dbm		\
 	--disable-gdbm		\
 	--disable-bsddb		\
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8bf9518..62642c8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -25,7 +25,7 @@ HOST_PYTHON3_CONF_OPT += 	\
 	--disable-curses	\
 	--disable-codecs-cjk	\
 	--disable-nis		\
-	--disable-unicodedata	\
+	--enable-unicodedata	\
 	--disable-test-modules	\
 	--disable-idle3		\
 	--disable-pyo-build
-- 
1.8.3.2
