From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 22 Feb 2016 09:23:24 -0300
Subject: [Buildroot] [PATCH v2 1/4] dsp-tools: Move download link away from
	Google Code
In-Reply-To: <1456143807-3350-1-git-send-email-casantos@datacom.ind.br>
References: <1456143807-3350-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1456143807-3350-2-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alan Ott <alan@softiron.co.uk>

Google Code is being shut down. The google code site which hosts the
source .tar.gz references github/felipec, which has a dsp-tools repository
with the same code as the tar.gz previously referenced.

Change the DSP_TOOLS_SITE to this github repo.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
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
2.5.0
