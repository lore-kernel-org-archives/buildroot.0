From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 23:30:17 +0100
Subject: [Buildroot] [git commit] openal: Add jack2 dependency
Message-ID: <20151213223021.59BF9818B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a69e28d15253fe75a8a1051e60750842e126196
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openal/openal.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 0580526..b2e02c8 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -18,6 +18,13 @@ else
 OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_ALSA=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_JACK2),y)
+OPENAL_DEPENDENCIES += jack2
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_JACK=ON
+else
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_JACK=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
 OPENAL_DEPENDENCIES += portaudio
 OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_PORTAUDIO=ON
