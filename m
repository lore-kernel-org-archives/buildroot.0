From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed, 18 Jun 2014 10:12:10 -0400
Subject: [Buildroot] [PATCH v2] manual: (faq-boot-hang-after-starting) fix
	config entries
Message-ID: <1403100730-21215-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 docs/manual/faq-troubleshooting.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 2fdb530..26c8460 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -19,11 +19,11 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK
 
 then it means that your system is running, but didn't start a shell on
 the serial console. In order to have the system start a shell on your
-serial console, you have to go into the Buildroot configuration, +System
-configuration+, and modify +Port to run a getty (login prompt) on+ and
-+Baudrate to use+ as appropriate. This will automatically tune the
-+/etc/inittab+ file of the generated system so that a shell starts on
-the correct serial port.
+serial console, you have to go into the Buildroot configuration, in 
++System configuration+, modify +Run a getty (login prompt) after boot+ 
+and set the appropriate port and baud rate in the +getty options+ 
+submenu. This will automatically tune the +/etc/inittab+ file of the 
+generated system so that a shell starts on the correct serial port.
 
 [[faq-no-compiler-on-target]]
 == Why is there no compiler on the target?
-- 
2.0.0
