From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:56:29 +0200
Subject: [Buildroot] [git commit] mkpasswd: remove VERSION/SOURCE
Message-ID: <20160703111559.248CB8179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2089d858bb61671577e801096e82fc0cba60de05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the VERSION and
SOURCE variables in the mkpasswd package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mkpasswd/mkpasswd.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
index 0447ecc..07935a4 100644
--- a/package/mkpasswd/mkpasswd.mk
+++ b/package/mkpasswd/mkpasswd.mk
@@ -7,11 +7,8 @@
 # source included in buildroot, taken from
 # https://github.com/rfc1036/whois/blob/master/
 # at revision 5a0f08500fa51608b6d3b73ee338be38c692eadb
-HOST_MKPASSWD_SOURCE =
 HOST_MKPASSWD_LICENSE = GPLv2+
 
-HOST_MKPASSWD_VERSION = buildroot-$(BR2_VERSION)
-
 define HOST_MKPASSWD_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
 		package/mkpasswd/mkpasswd.c package/mkpasswd/utils.c \
