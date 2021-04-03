From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 12:15:46 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/haserl: security
 bump to version 0.9.36
Message-ID: <20210403095643.8558886DA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaea17c4a6dcac7973590096fefd224ff8aa8ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

2021-03-07	0.9.36
*	Fix sf.net issue #5 - its possible to issue a PUT request
	without a CONTENT-TYPE.   Assume an octet-stream in that case.
*	Change the Prefix for variables to be the REQUEST_METHOD
	(PUT/DELETE/GET/POST)
	**** THIS IS A BREAKING CHANGE vs 0.9.33 ****
*	Mitigations vs running haserl to get access to files not
	available to the user.

- Fix CVE-2021-29133: Lack of verification in haserl, a component of
  Alpine Linux Configuration Framework, before 0.9.36 allows local users
  to read the contents of any file on the filesystem.
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 661ce9aac94acbd00412fba81ce65e3ae2e8ba45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haserl/haserl.hash | 6 +++---
 package/haserl/haserl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/haserl/haserl.hash b/package/haserl/haserl.hash
index 149bf0b0a5..c66b54a0ac 100644
--- a/package/haserl/haserl.hash
+++ b/package/haserl/haserl.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/haserl/files/haserl-devel/
-md5	918f0b4f6cec0b438c8b5c78f2989010	haserl-0.9.35.tar.gz
-sha1	9a331d41e9d47a81e81e158f9a16bf5443347cd4	haserl-0.9.35.tar.gz
+md5  b94cd201a82b410b7f93fe3a31416cff  haserl-0.9.36.tar.gz
+sha1  a6244b496f06e1fea70581cb02c04bc1f0ffcbc3  haserl-0.9.36.tar.gz
 # Locally computed
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 4c24b9bcea..8bcaa94c0c 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HASERL_VERSION = 0.9.35
+HASERL_VERSION = 0.9.36
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel
 HASERL_LICENSE = GPL-2.0
 HASERL_LICENSE_FILES = COPYING
