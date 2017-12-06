From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Dec 2017 11:56:52 +0100
Subject: [Buildroot] [PATCH 0/5] New infrastructure for golang packages
Message-ID: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series add a new pkg-golang infrastructure and converts some of the
packages based on go.
I'll resend as an official patch series after receiving some comments in
RFC trying to reignite the discussion.

Angelo Compagnucci (5):
  package/pkg-golang: new package infrastructure
  docs/manual: adding documentation for the golang infrastructure
  package/flannel: converting to golang infrastructure
  package/runc: converting to golang infrastructure
  package/docker-containerd: converting to golang infrastructure

 docs/manual/adding-packages-golang.txt         | 114 +++++++++++++++++++++++
 docs/manual/adding-packages.txt                |   2 +
 package/Makefile.in                            |   1 +
 package/docker-containerd/docker-containerd.mk |  37 +++-----
 package/flannel/flannel.mk                     |  32 +------
 package/pkg-golang.mk                          | 121 +++++++++++++++++++++++++
 package/runc/runc.mk                           |  37 +-------
 7 files changed, 262 insertions(+), 82 deletions(-)
 create mode 100644 docs/manual/adding-packages-golang.txt
 create mode 100644 package/pkg-golang.mk

-- 
2.7.4
