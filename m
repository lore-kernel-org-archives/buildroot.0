From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 14:58:36 +0100
Subject: [Buildroot] [PATCH v7 0/4] Improve silent builds
Message-ID: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
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

The rest of the change logs are in each patch.

v6:
  - Remove the patch that renames QUIET to BR_QUIET

Fabio Porcedda (4):
  Makefile: improve detection of make "-s" flag
  pkg-download: silence check-hash if it is a silent build
  support/download: silence svn if it is a silent build
  support/download: silence git if it is a silent build

 Makefile                    |  2 +-
 package/pkg-download.mk     |  8 ++++++++
 support/download/check-hash | 22 ++++++++++++++++++++--
 support/download/dl-wrapper | 15 ++++++++++-----
 support/download/git        | 30 +++++++++++++++++++++++++-----
 support/download/svn        | 20 ++++++++++++++++++--
 6 files changed, 82 insertions(+), 15 deletions(-)

-- 
2.1.0
