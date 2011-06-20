From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Jun 2011 17:59:53 +0200
Subject: [Buildroot] [PATCH 0/2] Fix build of shared libraries
Message-ID: <1308585595-3948-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

009d8fceab4 and 0a5e5534cbf8 broke shared library building for those AUTOTOOLS
packaged that override _CONFIGURE_CMDS.

According to my grep'ing, the affetced packages should be only ffmpeg and
berkeleydb. These two patched fixes them.

Please note I only could test ffmpeg, but the change is pretty trivial so
hopefully it works for berkeleydb as well.

Luca

Luca Ceresoli (2):
  ffmpeg: fix build of shared libraries
  berkeleydb: fix build of shared libraries

 package/berkeleydb/berkeleydb.mk    |    1 +
 package/multimedia/ffmpeg/ffmpeg.mk |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.4.1
