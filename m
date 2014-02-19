From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 08:53:12 +0100
Subject: [Buildroot] [git commit] python,
	python3: enable unicodedata for host-python, needed by setuptools
Message-ID: <20140228133414.89F9B9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73293e88c828c9bddc0b684a4603f86f70f8e876
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we are going to bump setuptools to a much newer version, the host
python needs to be built with support for unicodedata.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/python.mk   |    2 +-
 package/python3/python3.mk |    2 +-
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
index 1bf8500..13f53f4 100644
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
