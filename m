From: Christian Stewart <christian@paral.in>
Date: Wed, 25 May 2016 16:31:19 -0700
Subject: [Buildroot] [PATCH v3 0/3] Add docker engine support
Message-ID: <1464219082-3818-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds runc, docker-containerd, and docker-engine support.

Aufs is disabled in this version of the series until the pending aufs
series is merged. This version of the series can be merged without aufs
support, and aufs can simply be enabled with another patch later after
the aufs series is merged.

Patch 1 adds runC, the new minimal CLI for running linux containers.
Patch 2 adds docker-containerd, the daemon and API for runC.
Patch 3 adds docker-engine, the cli and api for the Docker application
engine.

Changes for v2:

 - Fixed many minor mistakes in the original runC files
 - Added hashes
 - Added docker-containerd and docker-engine

Changes for v3:

 - Use correct github download URLs
 - Add note about arm64 fixes in docker-containerd

Christian Stewart (3):
  runc: new package
  docker-containerd: new package
  docker-engine: new package

 package/Config.in                                |   3 +
 package/docker-containerd/Config.in              |   8 ++
 package/docker-containerd/docker-containerd.hash |   2 +
 package/docker-containerd/docker-containerd.mk   |  48 ++++++++++
 package/docker-engine/Config.in                  |  70 +++++++++++++++
 package/docker-engine/docker-engine.hash         |   2 +
 package/docker-engine/docker-engine.mk           | 110 +++++++++++++++++++++++
 package/runc/Config.in                           |   8 ++
 package/runc/runc.hash                           |   2 +
 package/runc/runc.mk                             |  49 ++++++++++
 10 files changed, 302 insertions(+)
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
