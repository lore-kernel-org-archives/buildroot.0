From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 4 Jan 2012 09:16:28 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.02/ext-toolchain-updates
In-Reply-To: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LW-iWZuTJbboVCE1q0eS58hw5M07KPpVD95-GBv=k_KAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 3, 2012 at 9:22 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> What follows is a set of patches doing various improvements and
> updates to the external toolchain support:
>
>  * Fixes to the x86_64 handling of BR2_GCC_TARGET_ARCH and addition of
>   the Atom processor variant. Those changes are needed to make a
>   better usage of the Sourcery CodeBench x86/x86_64 toolchain (i.e,
>   allow the selection of the available multilib variants).
>
>  * Improve the logic to copy libraries from the toolchain to the
>   staging directory and the target directory to handle the directory
>   organization of the Sourcery CodeBench x86/x86_64 toolchain.
>
>  * Improve the same logic to support multilib toolchains with multilib
>   variants in directories of multiple levels. For example, the MIPS
>   Sourcery CodeBench toolchain has many multilib variants, and some
>   of them are in directories like mips16/soft-float/el/. This
>   requires a small modification of the way we create the symlink that
>   allows to fake the original sysroot location.
>
>  * Expand the external toolchain wrapper to include
>   BR2_TARGET_OPTIMIZATION.
>
>  * Various updates to the available external toolchains: add ARM
>   Sourcery CodeBench 2011.03, update the MIPS Sourcery CodeBench
>   2011.03, add the PowerPC Sourcery CodeBench 2011.03, add the
>   x86/x86_64 Sourcery CodeBench 2011.09, add the Blackfin 2011R1-RC4
>   toolchain.
>
>  * Document how to use the various multilib variants available.
>
>  * Adjust the uClibc detection logic to support static-only
>   toolchains.
>
> Best regards,
>
> Thomas Petazzoni
>
> The following changes since commit
> 5528286147492aafa8740c09db63290042b79cb0:
>
>  rt-tests: fix build issues on uClibc (2012-01-03 09:15:17 +0100)
>
> are available in the git repository at:
>  http://free-electrons.com/~thomas/buildroot.gitfor-2012.02/ext-toolchain-updates
>
> Thomas Petazzoni (14):
>      Add x86_64 variants to BR2_GCC_TARGET_ARCH
>      Add the Atom processor in the list of supported x86/x86_64 processors
>      Improve external toolchain logic to support IA32 Sourcery CodeBench
> toolchain
>      Support multilib variants in sub-subdirectories
>      Expand external toolchain wrapper to custom flags
>      external-toolchain: remove 2009q1 ARM Sourcery toolchain
>      external-toolchain: add Sourcery CodeBench ARM 2011.09
>      external-toolchain: bump MIPS 2011.03 from -93 to -110
>      external-toolchain: add Sourcery CodeBench PowerPC 2011.03
>      external-toolchain: add Sourcery CodeBench x86/x86_64 2011.09
>      external-toolchain: Blackfin.uclinux.org 2011R1-RC4
>      external-toolchain: details on selecting the multilib variants
>      external-toolchain: run checks even on extracted toolchains
>      external-toolchain: adjust check for uClibc static toolchains
>
>  target/Config.in.arch                              |   15 ++
>  toolchain/helpers.mk                               |   30 ++-
>  toolchain/toolchain-external/Config.in             |  205
> ++++++++++++++++++--
>  toolchain/toolchain-external/ext-tool.mk           |   97 +++++++---
>  .../toolchain-external/ext-toolchain-wrapper.c     |    3 +
>  5 files changed, 302 insertions(+), 48 deletions(-)
>
>
Entire series not tested, but:
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120104/68a52819/attachment-0001.html>
