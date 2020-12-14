From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:49:49 +0100
Subject: [Buildroot] [git commit] package/nmap: fix license
Message-ID: <20201214143456.264EB83649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cd5c2775535b4d6ec4a3e7e709f9ed3b01b7e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 78dc1f185ba0c8c9085d44318f72ab172867b147 forgot to update the
license file from COPYING to LICENSE.

Here is an extract of the ChangeLog for Nmap 7.90 [2020-10-03]:

Upgraded the Nmap license form a sort of hacked-up version of GPLv2 to a
cleaner and better organized version (still based on GPLv2) now called
the Nmap Public Source License to avoid confusion. See
https://nmap.org/npsl/ for more details and annotated license text. This
NPSL project was started in 2006 (community discussion here:
https://seclists.org/nmap-dev/2006/q4/126) and then it lost momentum for
7 years until it was restarted in 2013
(https://seclists.org/nmap-dev/2013/q1/399) and then we got distracted
by development again. We still have some ideas for improving the NPSL,
but it's already much better than the current license, so we're applying
NPSL Version 0.92 to the code now and can make improvements later if
needed. This does not change the license of previous Nmap releases.

Fixes:
 - http://autobuild.buildroot.org/results/8cef6a5e99ae341cced405a389346e2faccf6eec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.hash | 2 +-
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 5c684ecabe..8f69bbf613 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -2,4 +2,4 @@
 sha256  18cc4b5070511c51eb243cdd2b0b30ff9b2c4dc4544c6312f75ce3a67a593300  nmap-7.91.tar.bz2
 
 # Locally calculated
-sha256  a6afaad36c803dc602734451d9421ed363b48d1ca0faadf0907fc2d91a000284  COPYING
+sha256  8254a9bc733f3312c6dcfe0d5a129c29e96ecb8b33408c652a8c7beb2e25b471  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index a719b268c8..46ffd5aef4 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -11,7 +11,7 @@ NMAP_DEPENDENCIES = liblinear libpcap
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included
 NMAP_LICENSE = nmap license
-NMAP_LICENSE_FILES = COPYING
+NMAP_LICENSE_FILES = LICENSE
 
 # needed by libpcap
 NMAP_LIBS_FOR_STATIC_LINK += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
