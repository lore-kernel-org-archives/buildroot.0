From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 24 Nov 2014 14:56:57 +0100
Subject: [Buildroot] [PATCH v4 next 0/5]  Improve silent builds
Message-ID: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set improves silent builds.

Silent builds are nice when top-level parallel make is being used to
reduce the output clutter.

The change logs are in each patch.

Best regards
Fabio Porcedda (5):
  support/download: silence git if it is a silent build
  support/download: silence svn if it is a silent build
  support/download: pass the quiet flag to the hg download helper
  support/download: pass the quiet flag to the wget download helper
  support/download: pass the quiet flag to the scp download helper

 package/pkg-download.mk | 21 +++++++++++++--------
 support/download/git    | 14 ++++++++++----
 support/download/hg     |  5 +++--
 support/download/scp    |  3 ++-
 support/download/svn    |  4 +++-
 support/download/wget   |  3 ++-
 6 files changed, 33 insertions(+), 17 deletions(-)

-- 
2.1.3
