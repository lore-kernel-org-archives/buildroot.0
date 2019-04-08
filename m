From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  8 Apr 2019 18:43:30 +0200
Subject: [Buildroot] [PATCH 0/3] linux-tools-selftests
Message-ID: <20190408164333.26942-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, All

This small series select some tools required to run some selftests.

I have some issues to cross-compile linux-tools-selftests due to this error:

scripts/Makefile.headersinst:63: *** Some mandatory headers (errno.h ioctl.h ioctls.h ipcbuf.h mman.h msgbuf.h poll.h resource.h sembuf.h shmbuf.h socket.h sockios.h swab.h termbits.h termios.h types.h) are missing in arch/arm64/include/uapi/asm.

Indeed, all missing headers are located in this directory:
arch/arm64/include/generated/uapi/asm

Also some selftests build system try to use clang and llc (bpf) even when
llvm/clang compiler is not enabled.

Best regards,
Romain

Romain Naour (3):
  package/linux-tools: some selftests needs util-linux schedutils
  package/linux-tools: some selftests needs tput
  package/linux-tools: some selftests needs modprobe

 package/linux-tools/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.20.1
