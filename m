From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri,  4 Sep 2020 10:51:44 +0100
Subject: [Buildroot] [PATCH 0/3] libcamera: Fix and update libcamera package
Message-ID: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prevent compilation of libcamera on m68k architectures as we experience
build failures there, and do not currently support that target with
libcamera.

Then, update the build to require C++17, in anticipation of bumping the
version to the latest upstream.

Kieran Bingham (3):
  package/libcamera: Prevent builds on m68k
  package/libcamera: Update requirements for C++17
  package/libcamera: bump version to e59713c6

 package/libcamera/Config.in      | 8 +++++---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.25.1
