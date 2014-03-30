From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 20:21:59 +0400
Subject: [Buildroot] [PATCH 0/2] xtensa: add -mtext-section-literals to
	xtensa ABI
Message-ID: <1396196521-30184-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

these two patches are the second part of fixes for building huge sources,
like wireshark or mplayer: adding trampolines support to binutils allows
assembling of such files, but with literals placed into separate section
build fails at the linking step.

First patch allows building uclibc with -mtext-section-literals, it is
posted to the uclibc list, but not reviewed/checked in yet.
Second patch adds -mtext-section-literals flag to xtensa ABI.

Max Filippov (2):
  uclibc: add missing .literal_position directives
  Makefile.in: add -mtext-section-literals to xtensa ABI

 package/Makefile.in                                |  2 +-
 ...-add-missing-.literal_position-directives.patch | 62 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0001-xtensa-add-missing-.literal_position-directives.patch

-- 
1.8.1.4
