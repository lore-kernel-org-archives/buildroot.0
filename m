From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu,  8 Aug 2019 20:10:10 -0300
Subject: [Buildroot] [PATCH 0/5] test infra using Python 3
Message-ID: <20190808231015.14330-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This small series changes the runtime test infra to use Python 3 only.
The reasoning to not keep Python 2 compatibility is part of the commit log for
the last patch.

Patch 1 is not really related to this migration but it is part of this series
only to avoid unnecessary conflicts (in case it stays on the patch backlog for a
while) because the same file is changed by another patch in the series.

Patch 2 and 3 are related to the migration but could be applied right-away
because they don't need the changes to the docker image. Alternatively they
could be squashed to the last patch.

Patch 4 adds Python 3 to the docker image.

Patch 5 migrates the test infra to use Python 3.

Below a full run of '-runtime-tests' for:
 - master [1];
 - master + 1,2,3 [2];
 - master + local docker image + full series [3].

[1] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/75061226
[2] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/75061478
[3] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/75066229

Regards,
Ricardo

Ricardo Martincoski (5):
  support/testing: check ubi image before booting
  support/testing: do not print non-utf-8 chars on cbor test
  support/testing: factor out run_cmd_on_host
  support/docker: add python3
  support/testing: switch to Python 3 only

 support/docker/Dockerfile                     |  3 +++
 support/testing/infra/__init__.py             | 19 +++++++++++++++----
 support/testing/infra/emulator.py             |  1 +
 support/testing/run-tests                     |  2 +-
 support/testing/tests/core/test_hardening.py  |  6 +-----
 .../testing/tests/core/test_post_scripts.py   |  2 +-
 support/testing/tests/download/gitremote.py   |  3 ++-
 support/testing/tests/download/test_git.py    |  2 +-
 support/testing/tests/fs/test_ext.py          |  6 +-----
 support/testing/tests/fs/test_f2fs.py         |  5 +----
 support/testing/tests/fs/test_jffs2.py        |  6 ++----
 support/testing/tests/fs/test_squashfs.py     |  4 +---
 support/testing/tests/fs/test_ubi.py          |  5 ++---
 .../tests/package/sample_python_cbor_enc.py   |  2 +-
 .../testing/tests/utils/test_check_package.py |  3 ++-
 15 files changed, 35 insertions(+), 34 deletions(-)

-- 
2.17.1
