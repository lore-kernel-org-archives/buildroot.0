From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 23 Dec 2014 09:54:57 +0100
Subject: [Buildroot] [PATCH v5 0/4]  Improve silent builds
Message-ID: <1419324901-14003-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set improves silent builds.

Silent builds are also nice when top-level parallel make is being used
to reduce the output clutter.

After this patch set is accepted I will prepare a patch set to convert
the other helpers (scp wget hg) to use the quiet flag instead of the
environment variable.

The change logs are in each patch.

Fabio Porcedda (4):
  Rename the variable "QUIET" to "BR_QUIET" for conformance
  Makefile: improve detection of make "-s" flag
  support/download: silence svn if it is a silent build
  support/download: silence git if it is a silent build

 Makefile                           |  2 +-
 package/Makefile.in                |  2 +-
 package/berkeleydb/berkeleydb.mk   |  2 +-
 package/gcc/gcc-final/gcc-final.mk |  2 +-
 package/pkg-autotools.mk           |  4 ++--
 package/pkg-download.mk            | 10 ++++++----
 support/download/dl-wrapper        | 11 ++++++++---
 support/download/git               | 27 +++++++++++++++++++++++----
 support/download/svn               | 17 ++++++++++++++++-
 9 files changed, 59 insertions(+), 18 deletions(-)

-- 
2.2.1
