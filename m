From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 12:41:04 +0100
Subject: [Buildroot] [PATCH v6 0/3] Improve silent builds
Message-ID: <1419939667-27095-1-git-send-email-fabio.porcedda@gmail.com>
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

The change logs are also in each patch.

v6:
  - Remove the patch that renames QUIET to BR_QUIET

Fabio Porcedda (3):
  Makefile: improve detection of make "-s" flag
  support/download: silence svn if it is a silent build
  support/download: silence git if it is a silent build

 Makefile                    |  2 +-
 package/pkg-download.mk     |  2 ++
 support/download/dl-wrapper | 11 ++++++++---
 support/download/git        | 27 +++++++++++++++++++++++----
 support/download/svn        | 17 ++++++++++++++++-
 5 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.1.0
