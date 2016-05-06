From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 May 2016 14:56:55 +0100
Subject: [Buildroot] [PATCH 0/2] Fix Codescape toolchain side by side
	sysroot issue
Message-ID: <1462543017-42054-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently Codescape toolchains cannot be used to generate a big endian
root file system because the support for side by side sysroots is not
complete.

There is a patch [1] waiting in the queue which fixes the issue for the
current version of Codescape toolchains we have, but it will not work
for the next one that is coming. So, instead of messing more with the
toolchain infra I think it's better to handle these specific Codescape
toolchain's weirdness in hooks which won't affect others.

[1]: http://patchwork.ozlabs.org/patch/571708/

Vicente Olivert Riera (2):
  Revert "toolchain: allow side by side sysroot directories"
  toolchain-external.mk: hook for Codescape toolchain side-by-side
    layout

 toolchain/helpers.mk                               | 59 +++++++---------------
 toolchain/toolchain-external/toolchain-external.mk | 14 +++++
 2 files changed, 32 insertions(+), 41 deletions(-)

-- 
2.7.3
