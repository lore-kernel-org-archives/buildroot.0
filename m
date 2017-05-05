From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  5 May 2017 17:30:28 -0300
Subject: [Buildroot] [PATCH 0/3] Support a list of "cmake" candidates
Message-ID: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On CentOS 7 the "cmake" package installs cmake 2.8.12, which is too old
for us but the "cmake3" package (from EPEL) provides cmake 3.6.3, which
is good enough.

This series adds support to a list of candidates to be checked instead
of resorting to host-cmake if "cmake" does not exist or is too old.

Patch 1 modifies check-host-cmake.sh to support a list of candidates and
the minimal version, keeping compatibility with the previous syntax.

Patch 2 Introduces the BR2_CMAKE_CANDIDATES in check-host-cmake.mk, still
keeping compatible with the previous behavior.

Patch 3 adds "cmake3" to the list of cmake candidates.

Carlos Santos (3):
  core: allow check-host-cmake.sh to check several candidates
  core: allow having a list of "cmake" candidates
  core: add "cmake3" to the list of cmake candidates

 support/dependencies/check-host-cmake.mk |  7 ++--
 support/dependencies/check-host-cmake.sh | 66 ++++++++++++++++----------------
 2 files changed, 38 insertions(+), 35 deletions(-)

-- 
1.8.3.1
