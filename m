From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Thu, 25 Feb 2016 14:37:08 +0300
Subject: [Buildroot] [PATCH 0/2]
	fix-build-when-std-gnu99-and-inline-functions-are-used
Message-ID: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A lot of the glibc header files use extern inline, which causes
GCC to emit a symbol for each extern inline functions and it causes
functions multiple definition error when "-std=gnu99" is used.
To fix this problem it's necessary to use "-fgnu89-inline" option, which
tells GCC to use the traditional GNU semantics for inline functions when
in C99 mode.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

Lada Trimasova (2):
  host-tar: fix build when -std=gnu99 and inline functions are used
  host-m4: fix build when -std=gnu99 and inline functions are used

 package/m4/m4.mk   | 1 +
 package/tar/tar.mk | 1 +
 2 files changed, 2 insertions(+)

-- 
2.5.0
