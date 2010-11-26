From: Javier Viguera <javier.viguera@digi.com>
Date: Fri, 26 Nov 2010 19:26:55 +0100
Subject: [Buildroot] [PATCH 0/1] Fix libthread_db matching
Message-ID: <1290796016-2136-1-git-send-email-javier.viguera@digi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following patch fixes a little bug with the matching of libthread_db library so it is not stripped. Testing with two different toolchains (one based on glibc and the other on uclibc) shows that the current expression matches the symbolic link while the corrected one matches the real file.

$ ls -o */*/sys-root/lib/libthread_db.so*
arm-cortex_a8-linux-gnueabi/arm-cortex_a8-linux-gnueabi/sys-root/lib/libthread_db.so.1 -> libthread_db-1.0.so
arm-unknown-linux-uclibcgnueabi/arm-unknown-linux-uclibcgnueabi/sys-root/lib/libthread_db.so.1 -> libthread_db-0.9.30.3.so

$ ls -o */*/sys-root/lib/libthread_db*.so
arm-cortex_a8-linux-gnueabi/arm-cortex_a8-linux-gnueabi/sys-root/lib/libthread_db-1.0.so
arm-unknown-linux-uclibcgnueabi/arm-unknown-linux-uclibcgnueabi/sys-root/lib/libthread_db-0.9.30.3.so


Javier Viguera (1):
  target-finalize: do not strip libthread_db

 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

--
1.7.3.2
