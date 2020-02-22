From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 22 Feb 2020 09:57:04 +0100
Subject: [Buildroot] [PATCH v3 00/12] pkg-stats json output improvements
Message-ID: <20200222085715.23769-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds several improvements for the json output of the
pkg-stats script.

- add developers information to the packages
- add supported defconfigs to json
- add license information to json
- add more generic status field to the packages for easier post
  processing

---
v2 -> v3:
- keep variable latest_release but change format
- add check for license file hashes
- introduce a na status for the checks
- add a list of all possible checks to the json output
- add the cve check status

v1 -> v2:
- cleanup and recreation of patches
- remove pkg name from dumping to json
- use patch_files instead of combine count and files in dict
- include getdevelopers.py to reuse Developers class

---
Heiko Thiery (12):
  support/scripts/pkg-stats: store latest version in a dict
  support/scripts/pkg-stats: store patch files for the package
  support/scripts/pkg-stats: set developers info
  support/scripts/pkg-stats: store licences of package
  support/scripts/pkg-stats: add package status
  support/scripts/pkg-stats: add package count to stats
  support/scripts/pkg-stats: store pkg dir path
  support/scripts/pkg-stats: add defconfig support
  support/scripts/pkg-stats: add support for license hash check
  support/scripts/pkg-stats: set status to 'na' for virtual packages
  support/scripts/pkg-stats: initialize all package status checks
  support/scripts/pkg-stats: add status for cve check

 support/scripts/pkg-stats | 272 +++++++++++++++++++++++++++++---------
 1 file changed, 212 insertions(+), 60 deletions(-)

-- 
2.20.1
