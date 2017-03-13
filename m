From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:26:09 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/git: fix pcre
	support
Message-ID: <20170313233002.C91AF7FDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9739750396da0af7a449eed9e38e003e0dc2d159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The current code contains some obvious typos.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d830807794245077e73ee1d3c78eecb8d224dc04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index d3a494f..960e4ba 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -23,8 +23,8 @@ else
 GIT_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_PERL),y)
-GIT_DEPENDENCIES += perl
+ifeq ($(BR2_PACKAGE_PCRE),y)
+GIT_DEPENDENCIES += pcre
 GIT_CONF_OPTS += --with-libpcre
 else
 GIT_CONF_OPTS += --without-libpcre
