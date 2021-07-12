From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 12 Jul 2021 12:45:00 +0200
Subject: [Buildroot] [PATCH 0/1] Fix last OpenRisc binutils bug
Message-ID: <20210712104501.2276261-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds patches for all 4 binutils version we have and fixes a
binutils bug who shows up while building package openal. It's been
suggested upstream and it's pending:
https://sourceware.org/pipermail/binutils/2021-July/117334.html

With this last binutils bug fix, new external toolchain can be built
(i.e. Bootlin ones) and after that we can consider Buildroot toolchains
and external toolchains with all OpenRisc's patches applied bug-free.

I've built and re-built openal package with binutils 2.32, 2.34, 2.35.2,
2.36.1 without and with this patch succesfully.

Giulio Benetti (1):
  package/binutils: fix linker assert on OpenRisc

 ...tive-relocation-against-dynamic-on-P.patch | 59 +++++++++++++++++++
 ...tive-relocation-against-dynamic-on-P.patch | 59 +++++++++++++++++++
 ...tive-relocation-against-dynamic-on-P.patch | 59 +++++++++++++++++++
 ...tive-relocation-against-dynamic-on-P.patch | 59 +++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 package/binutils/2.32/0015-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
 create mode 100644 package/binutils/2.34/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
 create mode 100644 package/binutils/2.35.2/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
 create mode 100644 package/binutils/2.36.1/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch

-- 
2.25.1
