From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Apr 2013 14:53:52 +0000 (UTC)
Subject: [Buildroot] [Bug 6164] openvpn usage of ip tool from Busybox
In-Reply-To: <bug-6164-163@https.bugs.busybox.net/>
References: <bug-6164-163@https.bugs.busybox.net/>
Message-ID: <20130404145352.24A149B4B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6164

--- Comment #1 from Aleksandar <aleksandar.zivkovic@gmail.com> 2013-04-04 14:54:36 UTC ---
Further mk file update solved problem on my side:

Index: openvpn.mk
===================================================================
--- openvpn.mk    (revision 12121)
+++ openvpn.mk    (revision 12122)
@@ -18,9 +18,9 @@
 endif

 ifeq ($(BR2_PACKAGE_IPROUTE2),y)
+OPENVPN_CONF_ENV += IPROUTE=/bin/ip
+else
 OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
-else
-OPENVPN_CONF_ENV += IPROUTE=/bin/ip
 endif

 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
