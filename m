From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:13:53 +0100
Subject: [Buildroot] [git commit] package/git: fix pcre support
Message-ID: <20170312131358.B1EA88212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d830807794245077e73ee1d3c78eecb8d224dc04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current code contains some obvious typos.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 138a8b6..75d5140 100644
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
