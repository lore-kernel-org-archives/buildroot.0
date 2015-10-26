From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Oct 2015 00:49:37 +0100
Subject: [Buildroot] [PATCH 0/3 v3] toolchain/external: bump Linaro ARM,
	ARMEB and AArch64 toolchains (branch yem/toolchain-linaro-2015.08)
Message-ID: <cover.1445903025.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bumps the Linaro toolchains for ARM, ARMEB andAArch64 to the
latst release advertised on their toolchain page, 2015.08.

These new toolchains (like all those produced after 2014.09) are only
available for x86_64 hosts. So, we keep the previous 2014.09 toolchains
for x86 hosts, and add the new ones for x86_64 hosts.

To this effect:
  - we keep the same Kconfig symbol for both variants (x86 or x86_64
    host),
  - we duplicate the symbol, each entry depending on an x86 or x86_64
    host.

Since we have two entries, we can give them different prompts and
different help texts.


Changes v2 -> v3:
  - bump further
  - don't add legacy symbols, don;t add versioned symbols (no longer
    needed)


Regards,
Yann E. MORIN.


The following changes since commit 3c79446dc7ffff50974dd67496b84c5a605d8e11:

  xorg-server: bump to version 1.17.3 (2015-10-26 23:30:23 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/toolchain-linaro-2015.08

for you to fetch changes up to 0ec78e8e5fe8005a752826731f86055aff3bdce3:

  toolchain/external: bump Linaro AArch64 to 2015.08 (2015-10-27 00:39:04 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      toolchain/external: bump Linaro ARM to 2015.08
      toolchain/external: bump Linaro ARMEB to 2015.08
      toolchain/external: bump Linaro AArch64 to 2015.08

 toolchain/toolchain-external/Config.in             | 73 ++++++++++++++++++++--
 .../toolchain-external/toolchain-external.hash     |  3 +
 toolchain/toolchain-external/toolchain-external.mk | 15 +++++
 3 files changed, 85 insertions(+), 6 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
