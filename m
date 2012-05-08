From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  8 May 2012 22:45:47 +0200
Subject: [Buildroot] [PATCH 0/2] Ensure host python is python2
Message-ID: <1336509949-19630-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series ensures that host python is python2.

This fixes some distro weirdnesses that makes /usr/bin/python pointed
to python3 instead of python2, with some bad consequences for some
install/post-install python scripts.


Samuel Martin (2):
  Makefile.in: add host python2 binary detection
  libglib2: fix install even if the host python binary refers to
    python3

 package/Makefile.in          |   12 ++++++++++++
 package/libglib2/libglib2.mk |   19 ++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

--
1.7.10.1
