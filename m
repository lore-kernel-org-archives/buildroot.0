From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Jan 2012 03:32:21 +0100
Subject: [Buildroot] [PATCH 2/3] host-python: build shared library
In-Reply-To: <1327113142-19610-1-git-send-email-arnout@mind.be>
References: <CAPeX=+tVeJ6wip9tXgte5-8+qFqdxGNPU4NfyrdPs-a7fS8gsg@mail.gmail.com>
 <1327113142-19610-1-git-send-email-arnout@mind.be>
Message-ID: <1327113142-19610-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

This is required for building compiled python packages, e.g. libxml2.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python/python.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 78895d4..3bc0c97 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -15,6 +15,7 @@ PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
 # third-party Python modules.
 
 HOST_PYTHON_CONF_OPT += 	\
+	--enable-shared 	\
 	--without-cxx-main 	\
 	--disable-sqlite3	\
 	--disable-tk		\
-- 
1.7.8.3
