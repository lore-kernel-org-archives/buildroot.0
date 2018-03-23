From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 22:48:12 +0100
Subject: [Buildroot] [PATCH v2 0/3] test-pkg: by default only test a subset
 of toolchains
Message-ID: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the Buildroot Developers meeting at ELCE 2017, we discussed how
to make test-pkg more usable for our contributors. Our idea is that
test-pkg should not test all toolchains by default, but only a smaller
subset of "interesting" toolchains, that exhibit the most common
problems we encounter with new packages.

This series does that by:

 - Adjust the toolchain CSV file to have the interesting toolchains
   first, adding comments and empty lines along the way to clarify
   what is going on.

 - Update test-pkg to test only the first 7 toolchains, add a --all
   option to test all toolchains, and a --number option to test only
   the first N toolchains.

 - Update the Buildroot manual accordingly.

Thanks!

Thomas

Changes since v1:

 - Drop the first two patches, since they have been merged.

 - In the CSV list of toolchains, add better comments to explain the
   two "sections" of the toolchain list, as suggested by Yann
   E. Morin.

 - In the test-pkg script changes themselves:

    - Keep alphabetic sorting in the definition of the 'o' variable that
      contains the list of short options. Suggested by Yann E. Morin. 'h'
      for help remains a special case and therefore remains at the first
      position.
    - Keep alphabetic sorting when handling options. Here as well, --help
      remains first, as it already was. Suggested by Yann E. Morin.
    - Use spaces and not tabs for indentation. Suggested by Yann E. Morin.

Thomas Petazzoni (3):
  toolchain-configs.csv: re-organize for test-pkg
  test-pkg: test a subset of toolchains by default, add -a and -n
    options
  docs/manual: update the documentation about test-pkg

 docs/manual/adding-packages-tips.txt               | 11 +++--
 .../autobuild/toolchain-configs.csv                | 32 ++++++++++---
 utils/test-pkg                                     | 56 +++++++++++++++++++---
 3 files changed, 83 insertions(+), 16 deletions(-)

-- 
2.14.3
