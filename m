From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Aug 2014 22:45:15 +0200
Subject: [Buildroot] [PATCH v2 0/5] CMake cleanup
Message-ID: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Quick respin of this series cleaning up the {host-,}cmake-package
infrastructure (more specifically how the {C,CXX,LD}FLAGS are
handled) and fix the bug #7280.

For this round, I have discarded the 6th patch which is an RFC.
The only others changes are typo fixes in the commit message of
the patch 5/5

Cheers,


Samuel Martin (5):
  package/pkg-cmake.mk: remove the USE_CCACHE CMake flag for
    host-package
  package/pkg-cmake.mk: set the {C,CXX,LD}FLAGS for host packages
  toolchainfile.cmake.in: set linker flags
  package/cdrkit: clean {HOST_,}CDRKIT_CONF_OPT
  toolchainfile.cmake.in: do not force the CMAKE_{C,CXX}_FLAGS to the
    cache

 package/cdrkit/cdrkit.mk            | 7 -------
 package/pkg-cmake.mk                | 5 ++++-
 support/misc/toolchainfile.cmake.in | 5 +++--
 3 files changed, 7 insertions(+), 10 deletions(-)

--
2.1.0
