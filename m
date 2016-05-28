From: Christian Stewart <christian@paral.in>
Date: Sat, 28 May 2016 15:46:15 -0700
Subject: [Buildroot] [PATCH v6 0/3] Add docker engine support
Message-ID: <1464475578-22239-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds runc, docker-containerd, and docker-engine support.

The aufs graph driver is compiled for the docker-engine, but aufs and
other optional graph drivers will work at runtime only if the
corresponding kernel features and userspace tools are installed. This is
left up to the user.

Graph driver selection has been re-enabled as of v6 as btrfs and
overlayfs both require build-time headers from the corresponding utility
packages.

Patch 1 adds runC, the new minimal CLI for running linux containers.
Patch 2 adds docker-containerd, the daemon and API for runC.
Patch 3 adds docker-engine, the cli and api for the Docker application
engine.

Christian Stewart (3):
  runc: new package
  docker-containerd: new package
  docker-engine: new package

 package/Config.in                                |   3 +
 package/docker-containerd/0001-arm64-fixes.patch | 189 +++++++++++++++++++++++
 package/docker-containerd/Config.in              |  13 ++
 package/docker-containerd/docker-containerd.hash |   2 +
 package/docker-containerd/docker-containerd.mk   |  44 ++++++
 package/docker-engine/Config.in                  |  69 +++++++++
 package/docker-engine/docker-engine.hash         |   2 +
 package/docker-engine/docker-engine.mk           |  99 ++++++++++++
 package/runc/Config.in                           |  13 ++
 package/runc/runc.hash                           |   2 +
 package/runc/runc.mk                             |  46 ++++++
 11 files changed, 482 insertions(+)
 create mode 100644 package/docker-containerd/0001-arm64-fixes.patch
 create mode 100644 package/docker-containerd/Config.in
 create mode 100644 package/docker-containerd/docker-containerd.hash
 create mode 100644 package/docker-containerd/docker-containerd.mk
 create mode 100644 package/docker-engine/Config.in
 create mode 100644 package/docker-engine/docker-engine.hash
 create mode 100644 package/docker-engine/docker-engine.mk
 create mode 100644 package/runc/Config.in
 create mode 100644 package/runc/runc.hash
 create mode 100644 package/runc/runc.mk

-- 
2.7.3
