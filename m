From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 22:24:01 +0200
Subject: [Buildroot] [git commit] vlc: enable to run as root
Message-ID: <20150916203431.0BA2981DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4a81fc2c6826344bdc86acef4283ed7e86c1fb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of embedded systems only include the root user, so this patch
changes the VLC package so that running VLC as root is allowed, like
it is for all other Buildroot packages.

[Thomas: tweak commit log, remove incorrect Tested-by.]

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6f7fd58..4e84b12 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -54,6 +54,7 @@ VLC_CONF_OPTS += \
 	--disable-mfx \
 	--disable-vdpau \
 	--disable-addonmanagermodules \
+	--enable-run-as-root \
 
 # Building static and shared doesn't work, so force static off.
 ifeq ($(BR2_STATIC_LIBS),)
