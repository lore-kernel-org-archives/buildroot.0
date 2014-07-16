From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jul 2014 00:00:40 +0200
Subject: [Buildroot] [PATCH 6/6 v3] package/gst1-plugins-bad: gettextize to
	match the new gettext version
In-Reply-To: <cover.1405547907.git.yann.morin.1998@free.fr>
References: <cover.1405547907.git.yann.morin.1998@free.fr>
Message-ID: <f200992ff52ec38350cf0fcd1d79c5b459da175f.1405547907.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gettext macros in the package are from a gettext version older than
the ones we have in Buildroot, so autoreconf fails.

Run gettextize prior to running autoreconf, like we do in wget.

Fixes:
    http://autobuild.buildroot.org/results/ea6/ea6797f9595c34734229c78b4e25bf624925144b/
    http://autobuild.buildroot.org/results/578/5781774ae1b7ba85efee4bc933235304169b9196/
    http://autobuild.buildroot.org/results/188/18888e06058dff0249d7c5e10a2c4f46e059878a/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 25289d2..e7d265f 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -14,6 +14,7 @@ GST1_PLUGINS_BAD_LICENSE = LGPLv2+ LGPLv2.1+
 
 GST1_PLUGINS_BAD_AUTORECONF = YES
 GST1_PLUGINS_BAD_AUTORECONF_OPT = -I $(@D)/common/m4
+GST1_PLUGINS_BAD_GETTEXTIZE = YES
 
 GST1_PLUGINS_BAD_CONF_OPT = \
 	--disable-examples \
-- 
1.9.1
