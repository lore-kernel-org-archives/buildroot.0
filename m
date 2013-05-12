From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:30:11 +0200
Subject: [Buildroot] [git commit] filemq: disable asciidoc documentation
	generation
Message-ID: <20130512193211.4230F9A094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf82c300e0384a8e78e3b0a9f0370d36551540bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

filemq uses asciidoc for its documentation. asciidoc uses python and import
the unicodedata module, which is not in host-python. So disable asciidoc
entirely.

This doesn't get hit by the autobuilders because they don't have asciidoc
installed in their chroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/filemq/filemq.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 0ea7a9d..c715292 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -8,6 +8,7 @@ FILEMQ_VERSION = 8fac5140dd
 FILEMQ_SITE = git://github.com/zeromq/filemq.git
 
 FILEMQ_AUTORECONF = YES
+FILEMQ_CONF_ENV = fmq_have_asciidoc=no
 FILEMQ_INSTALL_STAGING = YES
 FILEMQ_DEPENDENCIES = czmq openssl zeromq
 FILEMQ_LICENSE = LGPLv3+ with exceptions
