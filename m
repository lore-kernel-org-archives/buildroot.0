From: Steve Thomas <scjthm@live.com>
Date: Mon, 19 May 2014 11:54:22 +0000
Subject: [Buildroot] [PATCH v3 0/3] ] Adding support for graphite to
	buildroot gcc toolchain
Message-ID: <BLU436-SMTP2D97D4BEA6AC04B396B8CA8320@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset add support for the graphite optimisation to the buildroot toolchain.
Graphite has been around for quite some time and is almost standard is some distributions

The patchset consists of two new packages and a new flag in the supported gcc toolchains.
I have omitted support for 4.5 as this might not work with the more recent version of 
cloog and isl, and if memory serves me correctly there was a transition from cloog-ppl
to cloog around that time. 

The impact is minimal as the flag is ordinarily disabled. 


Cheers

Thomo


Steve Thomas (3):
  isl: new package
  cloog: new package
  Add an BR2_GCC_ENABLE_GRAPHITE flag for the buildroot toolchain

 package/cloog/Config.in    |  8 ++++++++
 package/cloog/cloog.mk     | 16 ++++++++++++++++
 package/gcc/Config.in.host | 16 ++++++++++++++++
 package/gcc/gcc.mk         |  9 +++++++++
 package/isl/Config.in      |  7 +++++++
 package/isl/isl.mk         | 14 ++++++++++++++
 6 files changed, 70 insertions(+)
 create mode 100644 package/cloog/Config.in
 create mode 100644 package/cloog/cloog.mk
 create mode 100644 package/isl/Config.in
 create mode 100644 package/isl/isl.mk

-- 
1.9.3
