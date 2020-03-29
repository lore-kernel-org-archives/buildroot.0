From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 29 Mar 2020 20:49:21 -0300
Subject: [Buildroot] [PATCH 0/3] Fix and improve the S02sysctl init script
Message-ID: <20200329234924.14505-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Both busybox and procps-ng provide a S02sysctl init script. Since the
scripts are the same, except for some comments, make the busybox one a
symlink to the procps-ng one.

Also the scripts used the logger utility unconditionally but it may not
exist. Declare two functions to perform the operation, run_logger and
run_std, and use the appropriate one, depending on the existence of
logger.

Carlos Santos (3):
  pakage/busybox: use same S02sysctl script as procps-ng
  package/procps-ng: add busybox-related comments to S02sysctl
  pakage/procps-ng: use logger in S02sysctl only if it is available

 package/busybox/S02sysctl   | 67 +------------------------------------
 package/procps-ng/S02sysctl | 54 +++++++++++++++++++++++-------
 2 files changed, 43 insertions(+), 78 deletions(-)
 mode change 100644 => 120000 package/busybox/S02sysctl

-- 
2.18.2
