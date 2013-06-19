From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jun 2013 20:27:01 +0200
Subject: [Buildroot] [git commit] system/skeleton: remove /etc/hostname
Message-ID: <20130619183248.8670C9A1DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9dab397a4fa019b6b0825809d13f93214212284b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already provide BR2_TARGET_GENERIC_HOSTNAME to set /etc/hostname,
so a default /etc/hostname file isn't needed.

More importantly, if the user has explictly set BR2_TARGET_GENERIC_HOSTNAME
to the empty string, we would still end up with a /etc/hostname containing
'buildroot' which is unlikely to be what the user wanted.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/skeleton/etc/hostname |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/system/skeleton/etc/hostname b/system/skeleton/etc/hostname
deleted file mode 100644
index 5b26b35..0000000
--- a/system/skeleton/etc/hostname
+++ /dev/null
@@ -1 +0,0 @@
-buildroot
