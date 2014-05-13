From: Karoly Kasza <kaszak@gmail.com>
Date: Tue, 13 May 2014 15:58:13 +0200
Subject: [Buildroot] [PATCH 0/1] Fix redundant usage of -mcpu and
	-march/-mtune
Message-ID: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been using the Linaro external toolchain in the latest GIT to generate ARM
code. I've found that when using this external compiler, Buildroot
compulsorily specifies the -mcpu and -march switches to GCC, which is redundant
(-march and -mtune can be concluded from -mcpu, see
http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html )
While most of the time this only generates a warning, mmc-utils can not be
compiled this way and probably other packages suffer from this as well.

I recommend altering toolchain/toolchain-external/toolchain-external.mk,
so it won't supply redundant GCC switches.

Regards,
Karoly

Karoly Kasza (1):
  Fix redundant usage of -mcpu and -march/-mtune

 toolchain/toolchain-external/toolchain-external.mk |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
1.7.10.4
