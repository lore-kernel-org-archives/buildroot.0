From: Matias Garcia <mdhgarcia@gmail.com>
Date: Tue,  5 Jul 2011 18:15:35 -0400
Subject: [Buildroot] [PATCH] Add arbitrary arguments to sysroot selection
	and wrapper for external toolchains
Message-ID: <1309904136-28700-1-git-send-email-mdhgarcia@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  CodeSourcery uses non-standard arguments to determine which sysroot
    to use and to set other optimizations (e.g. which floating point
    ABI to use). This patch allows one to pass an arbitrary argument to
    the sysroot discovery in ext-tool.mk and adds the same option to
    the argument list in ext-toolchain-wrapper.c

 toolchain/toolchain-external/Config.in             |    8 ++++++++
 toolchain/toolchain-external/ext-tool.mk           |    4 ++++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 +++
 3 files changed, 15 insertions(+), 0 deletions(-)

-- 
1.7.4.1
