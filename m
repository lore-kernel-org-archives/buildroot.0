From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  7 Feb 2016 13:40:45 +0100
Subject: [Buildroot] [PATCH] docs/manual: fixing one liners for vagrant
Message-ID: <1454848845-22149-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Changing back wget to curl cause wget it's not available
  on mac os x.
* Braking up too long windows one liner.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/manual/getting.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
index bb63cab..549938a 100644
--- a/docs/manual/getting.txt
+++ b/docs/manual/getting.txt
@@ -19,13 +19,15 @@ If you want to setup an isolated buildroot environment on Linux or Mac
 Os X, paste this line onto your terminal:
 
 --------------------
-wget https://buildroot.org/downloads/Vagrantfile; vagrant up
+curl -O https://buildroot.org/downloads/Vagrantfile; vagrant up
 --------------------
 
 If you are on Windows, paste this into your powershell:
 
 --------------------
-(new-object System.Net.WebClient).DownloadFile("https://buildroot.org/downloads/Vagrantfile","Vagrantfile"); vagrant up
+(new-object System.Net.WebClient).DownloadFile(
+"https://buildroot.org/downloads/Vagrantfile","Vagrantfile");
+vagrant up
 --------------------
 
 If you want to follow development, you can use the daily snapshots or
-- 
1.9.1
