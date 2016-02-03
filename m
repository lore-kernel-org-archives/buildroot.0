From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  3 Feb 2016 22:45:27 +0100
Subject: [Buildroot] [PATCH RFC 0/2] unify library locations in
	target/staging
Message-ID: <1454535929-25379-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

See second patch for full details, first patch is just a minor correction
in variable naming.

This is code has been tested for various toolchains, BUT is not yet correct
for Blackfin toolchains when FDPIC_SHARED is selected (hence: DO NOT APPLY)
For this family there is some specific code that needs to be fixed.

Another improvement is the simplification of the copy_toolchain_lib_root
arguments: only the LIB argument is used now.

Finally, a follow-up patch is expected to unify the variables LIB_EXTERNAL_LIBS
and USR_LIB_EXTERNAL_LIBS, as there is no need for the distinction anymore.

/Thomas



Thomas De Schampheleire (2):
  toolchain: copy_toolchain_lib_root: rename LIBSPATH to LIBPATHS
  toolchain-external: unify library locations in target and staging dir

 toolchain/helpers.mk                               | 18 ++++--------------
 toolchain/toolchain-external/toolchain-external.mk | 14 ++++----------
 2 files changed, 8 insertions(+), 24 deletions(-)

-- 
2.4.10
