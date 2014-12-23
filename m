From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 11:36:19 +0100
Subject: [Buildroot] [git commit] ntp: update sample config
Message-ID: <20141223104122.DE5EF800E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3c2e7c7ed90e7930c934bcd9b43669a330a305a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop redundant IP version and double default restrict.
Tweak KoD and other defaults for properness.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntpd.etc.conf |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntpd.etc.conf b/package/ntp/ntpd.etc.conf
index 6a2b88c..543c8ff 100644
--- a/package/ntp/ntpd.etc.conf
+++ b/package/ntp/ntpd.etc.conf
@@ -1,8 +1,8 @@
 server 0.pool.ntp.org iburst
 server 1.pool.ntp.org iburst
 
-restrict default kod nomodify notrap nopeer noquery
-restrict -6 default kod nomodify notrap nopeer noquery
-
+# Allow only time queries, at a limited rate, sending KoD when in excess.
+# Allow all local queries (IPv4, IPv6)
+restrict default nomodify nopeer noquery limited kod
 restrict 127.0.0.1
-restrict -6 ::1
+restrict [::1]
