From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 11 Jun 2014 00:15:57 +0200
Subject: [Buildroot] [PATCH 2/2] faifa: force GIT_REV to a correct value
In-Reply-To: <1402438557-29335-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1402438557-29335-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1402438557-29335-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This variable is looked up by the Makefile throught a git command line
invocation.
Since we don't keep the '.git' folder in the packages when we clone
them, the command line fail to find anything.

Even worse, it can keep going up the tree until it finds buildroot's
'.git' directory.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/faifa/faifa.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index 8f5d258..c83b02a 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -11,6 +11,8 @@ FAIFA_DEPENDENCIES = libpcap host-autoconf
 FAIFA_LICENSE = GPLv2+
 FAIFA_LICENSE_FILES = COPYING
 
+FAIFA_MAKE_OPT += GIT_REV=$(FAIFA_VERSION)
+
 # This package uses autoconf, but not automake, so we need to call
 # their special autogen.sh script, and have custom target and staging
 # installation commands.
-- 
2.0.0
