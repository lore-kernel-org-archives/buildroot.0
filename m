From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:37 +0100
Subject: [Buildroot] [PATCH 00/11] pkg-stats json output improvements
Message-ID: <20200103151849.10956-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patches add several improvements for the json output of the
pkg-stats script.

- add developers information to the packages
- add supported defconfigs to json
- add license information to json
- add package dependencies to json
- add more generic status field to the packages

Heiko Thiery (11):
  support/scripts/pkg-stats: store latest version in a hash
  support/scripts/pkg-stats: store pkg dir path
  support/scripts/pkg-stats: store patch info in a hash
  support/scripts/pkg-stats: do not exclued pkg name in json output
  support/scripts/pkg-stats: parse and set developers info
  support/scripts/pkg-stats: store licences of package
  support/scripts/pkg-stats: store dependencies of package
  support/scripts/pkg-stats: add generic package status field
  support/scripts/pkg-stats; use url status from dict for check
  support/scripts/pkg-stats: add package count to stats
  support/scripts/pkg-stats: create and store defconfig information

 support/scripts/pkg-stats | 252 +++++++++++++++++++++++++++++++-------
 1 file changed, 207 insertions(+), 45 deletions(-)

-- 
2.20.1
