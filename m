From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 13:33:43 +0100
Subject: [Buildroot] [git commit] docs/manual: misc improvements to Vagrant
	usage documentation
Message-ID: <20160208123401.47FDB80480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf28e23e317fc449b280fcc299f8d6fd8c0506c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Changing back wget to curl cause wget it's not available
  on mac os x.
* Braking up too long windows one liner.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
