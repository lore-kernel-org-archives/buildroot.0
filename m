From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:28 -0200
Subject: [Buildroot] [PATCH 00/14] fix Python code style
Message-ID: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series fixes code style warnings reported by flake8 in the Python scripts
in the tree.

I am ignoring this script for now:
support/scripts/xorg-release
I opened a thread about it:
http://lists.busybox.net/pipermail/buildroot/2018-January/211557.html

The first 12 patches fix each script.
I tried to do the minimum to accomplish the task avoiding any unrelated
refactoring, what IMO brings these advantages:
 - small chance of introducing regressions;
 - easy code review;
 - less testing effort.
Most of the commit messages are terse as the changes I introduced are minimal.
If I missed to explain any change that is not obvious, please ask me on the
review.

Patch 13 adds support to install flake8 on the fly to the Docker image, needed
by the next patch.

Patch 14 creates a job in gitlab to run flake8:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/48876752

And here a complete run on gitlab using current Docker image:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/16432662

Regards,
Ricardo


Ricardo Martincoski (14):
  graph-depends: fix code style
  check-uniq-files: fix code style
  graph-build-time: fix code style
  pycompile: fix code style
  size-stats: fix code style
  testing/tests/boot/test_atf: fix code style
  check-package: fix code style
  diffconfig: fix code style
  genrandconfig: fix code style
  get-developers: fix code style
  scanpypi: fix code style
  size-stats-compare: fix code style
  support/dockerfile: allow to install packages
  .gitlab-ci.yml: check flake8

 .gitlab-ci.yml                         |  16 +++++
 .gitlab-ci.yml.in                      |  16 +++++
 support/docker/Dockerfile              |   8 ++-
 support/scripts/brpkgutil.py           |   8 ++-
 support/scripts/check-uniq-files       |   4 +-
 support/scripts/graph-build-time       |  24 ++++---
 support/scripts/graph-depends          |  68 +++++++++++-------
 support/scripts/pycompile.py           |   3 +
 support/scripts/size-stats             |   8 ++-
 support/testing/tests/boot/test_atf.py | 124 +++++++++++++++++----------------
 utils/checkpackagelib/lib_config.py    |   9 ++-
 utils/checkpackagelib/lib_hash.py      |   9 ++-
 utils/checkpackagelib/lib_mk.py        |   9 ++-
 utils/checkpackagelib/lib_patch.py     |   3 +-
 utils/checkpackagelib/readme.txt       |   2 -
 utils/diffconfig                       |  22 +++---
 utils/genrandconfig                    |  34 ++++-----
 utils/get-developers                   |   4 +-
 utils/getdeveloperlib.py               |  52 ++++++++------
 utils/scanpypi                         |  13 ++--
 utils/size-stats-compare               |   5 +-
 21 files changed, 269 insertions(+), 172 deletions(-)

-- 
2.7.4
