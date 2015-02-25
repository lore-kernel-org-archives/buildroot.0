From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Feb 2015 17:30:07 +0100
Subject: [Buildroot] [git commit branch/next] sox: add optional opus file
	support
Message-ID: <20150225163036.8F9BC8177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34efcd0db73e32b8ab25f7cbd67ac35e5ffcdff2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sox/sox.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index ac89691..cd5fbb6 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -78,6 +78,12 @@ else
 SOX_CONF_OPTS += --without-amrwb --without-amrnb
 endif
 
+ifeq ($(BR2_PACKAGE_OPUSFILE),y)
+SOX_DEPENDENCIES += opusfile
+else
+SOX_CONF_OPTS += --without-opus
+endif
+
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 SOX_DEPENDENCIES += pulseaudio
 else
