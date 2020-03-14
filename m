From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:39:58 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/exim: fix systemd
 service binary path
Message-ID: <20200314173634.6A5F78393B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca52cfda33a22c23944f6e65c0d76021ca840bcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

modern versions of exim are installed into sbin not bin

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 891c5b7b4bbfa5c9fba84580f26c0abe2d7072c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.service b/package/exim/exim.service
index 26daabc4c0..fe97727ab5 100644
--- a/package/exim/exim.service
+++ b/package/exim/exim.service
@@ -3,7 +3,7 @@ Description=Exim MTA
 After=syslog.target network.target
 
 [Service]
-ExecStart=/usr/bin/exim -bdf
+ExecStart=/usr/sbin/exim -bdf
 Restart=always
 
 [Install]
