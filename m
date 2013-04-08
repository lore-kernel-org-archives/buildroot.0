From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  8 Apr 2013 18:50:13 +0200
Subject: [Buildroot] [PATCH v2 0/3] Cleanup post-* loops
Message-ID: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series cleans up and makes uniform the implementation of the
post-build, post-image and rootfs-overlay loops. It also makes post-build and
psot-image print each script name before executing it, like the rootfs-overlay
does.

Luca

Changes in v2:
 - use a make foreach instead of a shell for to loop over the entries
   (suggested by Danomi Manchego);
 - rework also the post-image loop (suggested by Thomas Petazzoni).

Luca Ceresoli (3):
  post-build: show each script filename before execution
  post-image: show each script filename before execution
  rootfs-overlay: use a make foreach instead of a shell for

 Makefile |   15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

-- 
1.7.10.4
