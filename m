From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 10 May 2021 11:00:44 -0700
Subject: [Buildroot] [PATCH v3 0/4] Updates for ARC, LMBench
Message-ID: <20210510180049.61421-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

There'a cosmetic fix for ARC to show the -mcpu in config.
And there's a bunch of histtoric patches in out github repo to get
LMBench running.

Changes since v2
 - Added another LMBench fix (to lat_rpc)
 - Added -mcpu for all ARC CPUs as suggested by Peter

Thx,
-Vineet

Vineet Gupta (4):
  ARC: config: explicit'ify -mcpu for cpu selection
  lmbench: memsize: increase delay for slow FPGAs
  lmbench: emulate --prefix to avoid scattering binaries all over
  lmbench: lat_rpc: fix stray pointer

 arch/Config.in.arc                            | 14 +++++-----
 ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
 ...bage-pointer-for-lat_rpc-S-localhost.patch | 25 +++++++++++++++++
 package/lmbench/lmbench.mk                    |  9 +++++-
 4 files changed, 68 insertions(+), 8 deletions(-)
 create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
 create mode 100644 package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch

-- 
2.25.1
