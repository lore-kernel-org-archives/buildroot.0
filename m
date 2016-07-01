From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  1 Jul 2016 17:53:27 +0200
Subject: [Buildroot] [PATCH 0/3] Skip host-cmake dependency to speedup builds
Message-ID: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is a respin of my old patch series (February 2016) to allow
skipping host-cmake and speedup builds.

Patch 1 is new, and it fixes a problem raised by Samuel. Well, it
doesn't fix it at its root, but it improves the workaround letting it
work even after my host-cmake patch.

Patch 2 simply adds some docs that can be useful in cmake.mk.

Patch 3 is the one doing the interesting stuff. It has a very detailed
commit message, and a discussion that needs comments from as many
reviewers as possible. Thanks in advance!


Luca Ceresoli (3): Move the host-pkgconf dependency from host-cmake to
  pkg-cmake cmake: add documentation about how it is built Don't build
  host-cmake if it is available on the build host

 Config.in                                | 19 +++++++++++++++++++
 package/cmake/cmake.mk                   | 14 +++++++++++++-
 package/pkg-cmake.mk                     | 10 ++++++++--
 support/dependencies/check-host-cmake.mk | 11 +++++++++++
 support/dependencies/check-host-cmake.sh | 30 ++++++++++++++++++++++++++++++
 5 files changed, 81 insertions(+), 3 deletions(-)
 create mode 100644 support/dependencies/check-host-cmake.mk
 create mode 100755 support/dependencies/check-host-cmake.sh

-- 
2.7.4
