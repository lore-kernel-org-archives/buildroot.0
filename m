From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Mar 2020 16:35:42 +0100
Subject: [Buildroot] [git commit] package/jhead: security bump to version
 3.04
Message-ID: <20200305152608.96E778F3B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faf755b4913969f768205caf4eadba55c7ce2f44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2019-1010301: jhead 3.03 is affected by: Buffer Overflow. The
  impact is: Denial of service. The component is: gpsinfo.c Line 151
  ProcessGpsInfo(). The attack vector is: Open a specially crafted JPEG
  file.
- Fix CVE-2019-1010302: jhead 3.03 is affected by: Incorrect Access
  Control. The impact is: Denial of service. The component is: iptc.c
  Line 122 show_IPTC(). The attack vector is: the victim must open a
  specially crafted JPEG file.
- Fix CVE-2019-19035: jhead 3.03 is affected by: heap-based buffer
  over-read. The impact is: Denial of service. The component is:
  ReadJpegSections and process_SOFn in jpgfile.c. The attack vector is:
  Open a specially crafted JPEG file.
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jhead/jhead.hash | 4 ++--
 package/jhead/jhead.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jhead/jhead.hash b/package/jhead/jhead.hash
index 9ee5055f7c..ffe75381b3 100644
--- a/package/jhead/jhead.hash
+++ b/package/jhead/jhead.hash
@@ -1,3 +1,3 @@
 # Locally calculated from download (no sig, hash)
-sha256	82194e0128d9141038f82fadcb5845391ca3021d61bc00815078601619f6c0c2	jhead-3.03.tar.gz
-sha256	46c870a208305489eea862ec8b05b030ba1f06d99195f660dc0ba541cc38d82b	readme.txt
+sha256  ef89bbcf4f6c25ed88088cf242a47a6aedfff4f08cc7dc205bf3e2c0f10a03c9  jhead-3.04.tar.gz
+sha256  46c870a208305489eea862ec8b05b030ba1f06d99195f660dc0ba541cc38d82b  readme.txt
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index 65f8cdb73c..d56ee0daff 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JHEAD_VERSION = 3.03
+JHEAD_VERSION = 3.04
 JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
 JHEAD_LICENSE = Public Domain
 JHEAD_LICENSE_FILES = readme.txt
