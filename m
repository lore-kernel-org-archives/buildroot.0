From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:14:35 +0100
Subject: [Buildroot] [PATCH 0/5] test-pkg: by default only test a subset of
	toolchains
Message-ID: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

During the Buildroot Developers meeting, we discussed how to make
test-pkg more usable for our contributors. Our idea is that test-pkg
should not test all toolchains by default, but only a smaller subset
of "interesting" toolchains, that exhibit the most common problems we
encounter with new packages.

This series does that by:

 - Fixing genrandconfig and test-pkg to ignore comments and empty
   lines in the toolchain CSV file.

 - Adjust the toolchain CSV file to have the interesting toolchains
   first, adding comments and empty lines along the way to clarify
   what is going on.

 - Update test-pkg to test only the first 7 toolchains, add a --all
   option to test all toolchains, and a --number option to test only
   the first N toolchains.

 - Update the Buildroot manual accordingly.

Thanks!

Thomas

Thomas Petazzoni (5):
  utils/genrandconfig: filter empty lines and comments in CSV file
  test-pkg: filter empty lines and comments in CSV file
  toolchain-configs.csv: re-organize for test-pkg
  test-pkg: test a subset of toolchains by default, add -a and -n
    options
  docs/manual: update the documentation about test-pkg

 docs/manual/adding-packages-tips.txt               | 11 ++--
 .../autobuild/toolchain-configs.csv                | 30 ++++++++---
 utils/genrandconfig                                |  5 +-
 utils/test-pkg                                     | 58 +++++++++++++++++++---
 4 files changed, 86 insertions(+), 18 deletions(-)

-- 
2.13.6
