From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:37:35 +0100
Subject: [Buildroot] [git commit] dsp-tools: Move download link away from
	Google Code
Message-ID: <20160302202758.2BAF47FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38bac6c3f87f2b8e70a1735d19fa9dac3b3d6364
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google Code is being shut down. The google code site which hosts the
source .tar.gz references github/felipec, which has a dsp-tools repository
with the same code as the tar.gz previously referenced.

Change the DSP_TOOLS_SITE to this github repo.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
