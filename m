From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  9 Aug 2013 11:36:56 +0200
Subject: [Buildroot] [PATCH 0/3] Fix ltrace autobuilder failures
Message-ID: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch serie try to fix different issues detected by autobuilder on
ltrace package:
    http://autobuild.buildroot.net/results/79dae85647526cdeddae5050db0339fbc38c9ae6
    http://autobuild.buildroot.net/results/808569f6bfac059b57eb4f1e692fbc9909e791cf
    http://autobuild.buildroot.net/results/83d0cd13d64053869708c666e2aa533202af67f7
    http://autobuild.buildroot.net/results/d4c465ea57a1954c3323234100ae08156cbd8324

J?r?me Pouiller (3):
  ltrace: Explicit enable/disable of libunwind
  ltrace: Fix a May be unitialized variable
  ltrace: Fix "strndup not declared" build failure on powerpc/uclibc

 .../ltrace-fix-may-be-uninitialized-variable.patch |   11 +++++++++++
 package/ltrace/ltrace-fix-strndup-usage.patch      |   15 +++++++++++++++
 package/ltrace/ltrace.mk                           |    9 +++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/ltrace/ltrace-fix-may-be-uninitialized-variable.patch
 create mode 100644 package/ltrace/ltrace-fix-strndup-usage.patch

-- 
1.7.9.5
