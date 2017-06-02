From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri,  2 Jun 2017 16:56:44 -0700
Subject: [Buildroot] [PATCH v3 02/11] package/python-enum34: Switch setup
	type to 'setuptools'
In-Reply-To: <20170602235653.4655-1-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
Message-ID: <20170602235653.4655-3-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enum34's setup.py imports 'setuptools' directly, without any fallback
logic, so we need to have host-setuptools in order to install
it. Switching this also removes unspecified implicit dependency on
BR2_PACKAGE_PYTHON_ZLIB, by not installing the package as zipped .egg

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/python-enum34/python-enum34.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index 1a4c6c6..c612cb6 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -7,7 +7,7 @@
 PYTHON_ENUM34_VERSION = 1.1.6
 PYTHON_ENUM34_SOURCE = enum34-$(PYTHON_ENUM34_VERSION).tar.gz
 PYTHON_ENUM34_SITE = https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876
-PYTHON_ENUM34_SETUP_TYPE = distutils
+PYTHON_ENUM34_SETUP_TYPE = setuptools
 PYTHON_ENUM34_LICENSE = BSD-3-Clause
 PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
 
-- 
2.9.4
