From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  5 Jan 2020 10:23:22 +0100
Subject: [Buildroot] [PATCH v2 0/8] pkg-stats json output improvements
Message-ID: <20200105092329.6288-1-heiko.thiery@gmail.com>
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
- add more generic status field to the packages

---
v1 -> v2:
- cleanup and recreation of patches
- remove pkg name from dumping to json
- use patch_files instead of combine count and files in dict
- include getdevelopers.py to reuse Developers class

---
Heiko Thiery (8):
  support/scripts/pkg-stats: store latest version in a dict
  support/scripts/pkg-stats: store patch files for the package
  support/scripts/pkg-stats: set developers info
  support/scripts/pkg-stats: store licences of package
  support/scripts/pkg-stats: add package status
  support/scripts/pkg-stats: add package count to stats
  support/scripts/pkg-stats: store pkg dir path
  support/scripts/pkg-stats: add defconfig support

 support/scripts/pkg-stats | 208 +++++++++++++++++++++++++++-----------
 1 file changed, 151 insertions(+), 57 deletions(-)

-- 
2.20.1
