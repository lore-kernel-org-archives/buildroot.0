From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 21:45:33 +0200
Subject: [Buildroot] [PATCH 0/2] Fix problems related to Blackfin lacking
	AI_ADDRCONFIG
Message-ID: <1369770335-6995-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The Blackfin external toolchains provided by Analog Devices don't have
AI_ADDRCONFIG enabled in their uClibc configuration. But since
Buildroot has it enabled in its default uClibc configuration, our
packages make the assumption that it is available.

This causes some build failures in the autobuilders (and possibly for
users), so this set of two patches prevent the selection of packages
that require AI_ADDRCONFIG when a Blackfin toolchain from ADI is used.

Long term, it would be better if the toolchains from ADI had
AI_ADDRCONFIG enabled in their uClibc configuration.

Best regards,

Thomas

Thomas Petazzoni (2):
  czmq: prevent selection when ADI Blackfin external toolchains are
    used
  libtirpc: prevent selection when ADI Blackfin external toolchains are
    used

 package/czmq/Config.in     |    4 ++++
 package/filemq/Config.in   |    4 ++++
 package/libtirpc/Config.in |    7 +++++++
 package/rpcbind/Config.in  |    4 ++++
 package/zyre/Config.in     |    4 ++++
 5 files changed, 23 insertions(+)

-- 
1.7.9.5
