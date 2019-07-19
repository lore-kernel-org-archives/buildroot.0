From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 19 Jul 2019 16:35:51 +0200
Subject: [Buildroot] [PATCH v2 0/5] Improve performances and feedback of
 different
Message-ID: <20190719143556.14907-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch serie extends the existing idea of making HTTP requests in
parallel via the multiprocessing module. This allows way better
performances (x5~10) at no cost.

This patch also implements helper function to ease providing feedback
about the current state for this time consuming functions.

The 'package_make_init_info' function is slightly modified to call make
only once (as suggested by Thomas).

Finaly an option to reduce verbosity is introduced since the per-package
notification flouds the standard output.

Changes v1 --> v2:
  - Replace multiprocessing by multiprocess (a fork)
  - Add progress feedback when checking URLs
  - Replace the multiple calls to make by a single one
  - Add an option to reduce versbosity (hide per-package notification)


Victor Huesca (5):
  support/scripts/pkg-stats: Use the 'multiprocess' fork instead of
    'multiprocessing'
  support/scripts/pkg-stats: retrieve packages latest version using
    processes
  support/scripts/pkg-stats: add current progress in 'check_url_status'
  support/scripts/pkg-stats: improve 'package_init_make_info'
  support/scripts/pkg-stats: add option to reduce verbosity

 support/scripts/pkg-stats | 193 +++++++++++++++++++++-----------------
 1 file changed, 108 insertions(+), 85 deletions(-)

-- 
2.21.0
