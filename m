From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 17:48:21 -0300
Subject: [Buildroot] [PATCH 9/9] wireshark: add optional sbc support
In-Reply-To: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1449089301-29762-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 534131b..e44f26a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -91,4 +91,11 @@ else
 WIRESHARK_CONF_OPTS += --without-libnl
 endif
 
+ifeq ($(BR2_PACKAGE_SBC),y)
+WIRESHARK_CONF_OPTS += --with-sbc=yes
+WIRESHARK_DEPENDENCIES += sbc
+else
+WIRESHARK_CONF_OPTS += --with-sbc=no
+endif
+
 $(eval $(autotools-package))
-- 
2.4.10
