From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Thu, 30 Dec 2010 16:46:14 +0100
Subject: [Buildroot] [PATCH] Add ttyO0 to ttyO3 in /etc/securetty in skeleton
Message-ID: <4D1CA946.5090009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Recent kernels (2.6.37*) use a different name for OMAP serial ports. They are no longer called ttySx but ttyOx. This patch add ttyO0 to ttyO3 in /etc/securetty.
Could you apply it in the trunk?

Signed-off-by: Guillaume GARDET <guillaume.gardet@free.fr>


diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index b25f4a5..e69fec7 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -33,3 +33,7 @@ ttyCPM3
  ttymxc0
  ttymxc1
  ttymxc2
+ttyO0
+ttyO1
+ttyO2
+ttyO3
