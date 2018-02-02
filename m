From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  2 Feb 2018 14:57:09 -0600
Subject: [Buildroot] [PATCH v3 0/3] autobuild: timeout and reporting cleanup
Message-ID: <20180202205713.27191-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Included in this series
 - Timeout detection using modification time of build-time.log
 - Cleanup build reason reporting to use build-time.log last entry
 - (Misc) Noticed schema was missing the new branch field

Related items needing merge
 - Force sane umask to ensure expected log output
   (https://patchwork.ozlabs.org/patch/857788/)

Matt Weber (3):
  autobuilder: hung build: convert to monitor thread
  autobuilder: schema update for branch varchar
  autobuilder: failure reason use build-time.log

 scripts/autobuild-run | 58 +++++++++++++++++++++++++++++++++++++++++++--------
 web/import.inc.php    |  7 ++++++-
 web/schema.sql        |  1 +
 3 files changed, 56 insertions(+), 10 deletions(-)

-- 
2.14.2
