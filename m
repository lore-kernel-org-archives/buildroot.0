From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 00:07:40 +0200
Subject: [Buildroot] [PATCH 0/4] spice: version bump / security bump
Message-ID: <20170621220744.18908-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our spice version is quite old (2013) and is affected by a number of
security issues, so bump to the latest release in the 0.12.x series +
upstream post-0.12.8 security fixes.

As the configuration options and dependencies have changed quite a bit since
2013, don't just do the entire bump in a single patch, but instead move
forward release by release for easier review.

Peter Korsgaard (4):
  spice: bump to version 0.12.5
  spice: security bump to version 0.12.6
  spice: security bump to version 0.12.8
  spice: add post-0.12.8 upstream security fixes

 Config.in.legacy                                   | 23 +++++++++
 ...sible-DoS-attempts-during-protocol-handsh.patch | 60 ++++++++++++++++++++++
 ...0001-fix-missing-monitor_latency-argument.patch | 28 ----------
 ...nt-integer-overflows-in-capability-checks.patch | 43 ++++++++++++++++
 ...l-Prevent-overflow-reading-messages-from-.patch | 33 ++++++++++++
 package/spice/Config.in                            | 46 -----------------
 package/spice/spice.hash                           |  2 +-
 package/spice/spice.mk                             | 35 +++++--------
 8 files changed, 174 insertions(+), 96 deletions(-)
 create mode 100644 package/spice/0001-Prevent-possible-DoS-attempts-during-protocol-handsh.patch
 delete mode 100644 package/spice/0001-fix-missing-monitor_latency-argument.patch
 create mode 100644 package/spice/0002-Prevent-integer-overflows-in-capability-checks.patch
 create mode 100644 package/spice/0003-main-channel-Prevent-overflow-reading-messages-from-.patch

-- 
2.11.0
