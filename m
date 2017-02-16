From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 09:09:53 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] vim: security bump to
	version 8.0.0329
Message-ID: <20170216090645.B1DC781D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29fd237aa3d81926c3d2b86de671a929f3f38028
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes:

- CVE-2016-1248: vim before patch 8.0.0056 does not properly validate values
  for the 'filetype', 'syntax' and 'keymap' options, which may result in the
  execution of arbitrary code if a file with a specially crafted modeline is
  opened.

- CVE-2017-5953: vim before patch 8.0.0322 does not properly validate values
  for tree length when handling a spell file, which may result in an integer
  overflow at a memory allocation site and a resultant buffer overflow.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0e76cde70f651b17e74681d17fb0afb16400102d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index bc4a08e..28c6b97 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9b4790dafc886537096a6e1953ee0424b8c308881b97151a7bfba1f9fd14e3f9  vim-v8.0.0001.tar.gz
+sha256 6fbe0ec1228f951ba598b48ac8033f41ca4934cc34689a6008685e7c26477ae2  vim-v8.0.0329.tar.gz
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 308855e..ec49460 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = v8.0.0001
+VIM_VERSION = v8.0.0329
 VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
 # Win over busybox vi since vim is more feature-rich
 VIM_DEPENDENCIES = \
