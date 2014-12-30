From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 12:41:05 +0100
Subject: [Buildroot] [PATCH v6 1/3] Makefile: improve detection of make "-s"
	flag
In-Reply-To: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1419939667-27095-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because it's just checked the presence of the "s" character even a
  make --warn-undefined-variables
is detected as a silent build so fix this by filtering out long options.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e18a87e..c033620 100644
--- a/Makefile
+++ b/Makefile
@@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 TARGETS :=
 
 # silent mode requested?
-QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
+QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
-- 
2.1.0
