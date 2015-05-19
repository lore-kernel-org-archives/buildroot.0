From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 19 May 2015 21:28:58 +0300
Subject: [Buildroot] [PATCH 0/2] xtensa fixes for jasper
Message-ID: <1432060140-13611-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

There are two patches: one makes jasper configure script preserve CFLAGS
when --enable-debug is specified.

I was hoping that that'd be enough for jasper to build on xtensa, but
unfortunately no: a bunch of one kind of literal-out-of-range errors is gone
but a smaller bunch of other kind of the same error appeared. Xtensa gcc
does nothing to place literals closer to their corresponding literal load
instructions in functions with huge code size generated with -O0.

So the second patch disables debug for jasper when building for xtensa.

Max Filippov (2):
  jasper: Don't overwrite CFLAGS when configured with --enable-debug
  jasper: Disable debugging when building for xtensa

 package/jasper/0007-preserve-cflags.patch | 27 +++++++++++++++++++++++++++
 package/jasper/jasper.mk                  |  6 ++++++
 2 files changed, 33 insertions(+)
 create mode 100644 package/jasper/0007-preserve-cflags.patch

-- 
1.8.1.4
