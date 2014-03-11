From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 16:46:42 +0100
Subject: [Buildroot] [git commit] chrony: bump version
Message-ID: <20140311154821.059509BEEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f68c4ab87205467c1a2468fb28f065b20eedd5c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-0021: Amplification in chrony control protocol

In the chrony control protocol some replies are significantly larger than
their requests, which allows an attacker to use it in an amplification
attack.  With hosts allowed by cmdallow (only localhost by default) the
maximum amplification factor is 9.2.  Hosts that are not allowed receive a
small reply with error status, which allows amplification of up to 1.5.

To fix the problem, the protocol has been modified to require padding in the
request packet, so replies are never larger than their requests.  Also,
chronyd no longer sends replies with error status to hosts that are not
allowed by cmdallow.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index eeb42d8..edb5c24 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 1.29
+CHRONY_VERSION = 1.29.1
 CHRONY_SITE = http://download.tuxfamily.org/chrony/
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
