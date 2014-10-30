From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 30 Oct 2014 16:57:26 +0300
Subject: [Buildroot] [PATCH 0/3] arc: introduce more CPU versions for
	selection
Message-ID: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To simplify selection of proper configuration of tools for users this series
adds a number of ARC CPUs in Buildroot configuration utility.

So from now on there're following CPUs available for selection:
 * ARC 750D - ARC ISAv1 CPU with MMU
 * ARC 770D - ARC ISAv1 CPU with MMU and additional features like atomic options
 * ARC HS38 - ARC ISAv2 CPU with MMU

Note that ARC HS38 already supported by current arc-2014.08 tools.

Alexey Brodkin (3):
  arc: add explicit selection of CPU templates ARC 750D and ARC770D
  uclibc: add explicit setup of ARC-specific options
  arc: add support of ARC HS38 core

 arch/Config.in.arc       | 25 +++++++++++++++++++++++--
 package/uclibc/Config.in |  7 +++++++
 package/uclibc/uclibc.mk | 12 ++++++++++++
 3 files changed, 42 insertions(+), 2 deletions(-)

-- 
1.9.3
