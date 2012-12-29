From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 17:14:47 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	pre-built-packages
Message-ID: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Recently, we have had a number of users having issues with external
toolchains because those are built for 32 bits Linux, and most
developers know use 64 bits build machines. The error message such
users get so far is very cryptic "Cannot execute cross-compiler".

So, this set of patches adds a small infrastructure in the form of a
Kconfig option and a check in dependencies.sh. The Kconfig option
allows packages to tell whether they need 32 bits compatibility
libraries, and the check in dependencies.sh verifies that those
libraries are installed (simply by checking the presence of the 32
bits dynamic loader).

Then, all pre-built external toolchains as well as the sam-ba tool are
modified to use this mechanism.

As a preliminary patch, all the pre-built external toolchains are
changed to be visible only if the host architecture is x86 or x86-64.

Thanks,

Thomas

The following changes since commit 4848386446b937d4d0d9d3e9489932ca3fcb1003:

  libffi: fix mips build failures (2012-12-28 16:55:09 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git pre-built-packages

for you to fetch changes up to fbccee70c941bfc2e0c8d0c62cf78e726ae35170:

  sam-ba: select BR2_HOSTARCH_NEEDS_IA32_LIBS (2012-12-29 17:06:41 +0100)

----------------------------------------------------------------
Thomas Petazzoni (4):
      toolchain-external: add dependency on BR2_HOST_ARCH
      Infrastructure to warn the user about missing 32 bits libraries
      toolchain-external: use BR2_HOSTARCH_NEEDS_IA32_LIBS where needed
      sam-ba: select BR2_HOSTARCH_NEEDS_IA32_LIBS

 Config.in                              |    6 ++++
 package/sam-ba/Config.in.host          |    1 +
 support/dependencies/dependencies.sh   |   11 +++++++
 toolchain/toolchain-external/Config.in |   54 ++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)

Thanks,
-- 
Thomas Petazzoni
