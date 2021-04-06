From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 22:47:00 +0000
Subject: [Buildroot] [PATCH 0/4] Improvements to skarnet/s6 packages
Message-ID: <Mm17ytsW8iOupX2ch0YDuwnP8Xr2etORTSUEYiC74s@cp4-web-034.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch set introduces mostly structural improvements to all
skarnet/s6 packages. These changes make the packages easier to
maintain, extend and depend on with better build guarantees in different
configuration scenarios.

s6-networking is also enhanced with the ability to build with bearssl.

I intend to continue contributing to these packages with regular version
bumps and other enhancements.

Dick Olsson (4):
  package/{skalibs,execline,s6,s6-dns}: change prefix and shared options
  package/s6-*: use shared options and cleanup dependencies
  package/s6-networking: support building with bearssl
  DEVELOPERS: Add Dick Olsson for all skarnet and s6 packages

 DEVELOPERS                                    | 13 ++++++++
 package/execline/execline.mk                  | 28 +++++++---------
 package/mdevd/mdevd.mk                        | 11 +------
 package/s6-dns/s6-dns.mk                      | 19 +++--------
 package/s6-linux-init/Config.in               |  2 --
 package/s6-linux-init/s6-linux-init.mk        | 14 +++-----
 package/s6-linux-utils/s6-linux-utils.mk      | 11 +------
 package/s6-networking/s6-networking.mk        | 19 +++++------
 .../s6-portable-utils/s6-portable-utils.mk    | 11 +------
 package/s6-rc/s6-rc.mk                        | 28 ++++------------
 package/s6/s6.mk                              | 28 +++++-----------
 package/skalibs/skalibs.mk                    | 33 +++++++++++++++++--
 12 files changed, 88 insertions(+), 129 deletions(-)

-- 
2.30.2
