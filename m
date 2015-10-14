From: Alan Ott <alan@softiron.co.uk>
Date: Wed, 14 Oct 2015 17:51:19 -0400
Subject: [Buildroot] [PATCH 1/5] dsp-tools: Move download link away from
	Google Code
In-Reply-To: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
Message-ID: <1444859483-2268-2-git-send-email-alan@softiron.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is being shut down. The google code site which hosts the
source .tar.gz references github/felipec, which has a dsp-tools repository
with the same code as the tar.gz previously referenced.

Change the DSP_TOOLS_SITE to this github repo.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
---
 package/dsp-tools/dsp-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index 64490b8..c91ed20 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DSP_TOOLS_VERSION = 2.0
-DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files
+DSP_TOOLS_VERSION = v2.0
+DSP_TOOLS_SITE = $(call github,felipec,dsp-tools,$(DSP_TOOLS_VERSION))
 DSP_TOOLS_DEPENDENCIES = tidsp-binaries
 DSP_TOOLS_LICENSE = LGPLv2.1
 DSP_TOOLS_LICENSE_FILES = LICENSE
-- 
2.1.4
