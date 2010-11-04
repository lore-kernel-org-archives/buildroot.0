From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Nov 2010 19:16:43 +0100
Subject: [Buildroot] [git commit master 1/1] Config.in: wget: default to 3
	retries
Message-ID: <20101104181806.CAC828B77F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6871b16531e7d36fc02d095d31fb82b8a6b50fe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wget's builtin default of 20 retries before the backup site is used is
pretty excessive when a server is down.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index b37102d..b5d4084 100644
--- a/Config.in
+++ b/Config.in
@@ -19,7 +19,7 @@ menu "Commands"
 
 config BR2_WGET
 	string "Wget command"
-	default "wget --passive-ftp -nd"
+	default "wget --passive-ftp -nd -t 3"
 
 config BR2_SVN
 	string "Subversion (svn) command"
-- 
1.7.1
