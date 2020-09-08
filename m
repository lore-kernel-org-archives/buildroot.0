From: Robin Jarry <robin.jarry@6wind.com>
Date: Tue,  8 Sep 2020 10:10:22 +0200
Subject: [Buildroot] [PATCH v2 0/4] pycompile: fix .pyc source paths +
 improvements
In-Reply-To: <20200904112908.21686-1-julien.floret@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
Message-ID: <20200908081026.4701-1-robin.jarry@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series is about fixing the original .py source paths encoded into
.pyc files. It comes with small improvements on pycompile.py as well.

The first version of the patch was actually not working at all... No
.pyc file was compiled. We did not see it because
BR2_PACKAGE_PYTHON*_PYC_ONLY were not selected and therefore, the .pyc
files were generated automatically at runtime.

This v2 should work properly.

Robin Jarry (4):
  pycompile: add main entry point
  pycompile: sort imports
  pycompile: fix .pyc original source file paths
  pycompile: add --verbose option

 package/python/python.mk     |   6 +-
 package/python3/python3.mk   |   6 +-
 support/scripts/pycompile.py | 158 +++++++++++++++++++++--------------
 3 files changed, 104 insertions(+), 66 deletions(-)

Differences with v1:

  * split in multiple commits
  * fixed the script itself
  * sorted imports at the top of the file
  * added new --verbose option

-- 
2.28.0
