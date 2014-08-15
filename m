From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 16:39:05 +0200
Subject: [Buildroot] [PATCH 0/6] CMake cleanup
Message-ID: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short series cleaning up the {host-,}cmake-package
infrastructure, and more specifically how the {C,CXX,LD}FLAGS are
handled.

The patches 1-4/6 are preliminary work for the fix for #7280
(patch 5/6).

The last patch of this series is nothing more than an RFC.

Cheers,

Samuel Martin (6):
  package/pkg-cmake.mk: remove the USE_CCACHE CMake flag for
    host-package
  package/pkg-cmake.mk: set the {C,CXX,LD}FLAGS for host packages
  toolchainfile.cmake.in: set linker flags
  package/cdrkit: clean {HOST_,}CDRKIT_CONF_OPT
  toolchainfile.cmake.in: do not force the CMAKE_{C,CXX}_FLAGS to the
    cache
  [RFC] package/pkg-cmake.mk: add ccache support for host packages

 package/cdrkit/cdrkit.mk            |  7 -------
 package/pkg-cmake.mk                | 15 ++++++++++++++-
 support/misc/toolchainfile.cmake.in |  5 +++--
 3 files changed, 17 insertions(+), 10 deletions(-)

--
2.0.4
