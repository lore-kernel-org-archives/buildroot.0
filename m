From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Nov 2012 10:25:40 +0100
Subject: [Buildroot] [PATCH 1/2] legal-info: move $(2)_LICENSE to a proper
	line
In-Reply-To: <1351848341-5905-1-git-send-email-luca@lucaceresoli.net>
References: <1351848341-5905-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1351848341-5905-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 270da60..993c8d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -268,14 +268,14 @@ ifndef $(2)_LICENSE
  endif
 endif
 
+$(2)_LICENSE			?= unknown
+
 ifndef $(2)_LICENSE_FILES
  ifdef $(3)_LICENSE_FILES
   $(2)_LICENSE_FILES = $($(3)_LICENSE_FILES)
  endif
 endif
 
-$(2)_LICENSE			?= unknown
-
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 $(2)_INSTALL_STAGING		?= NO
-- 
1.7.9.5
