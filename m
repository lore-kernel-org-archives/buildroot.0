From: Robin Jarry <robin.jarry@6wind.com>
Date: Thu, 10 Sep 2020 10:32:50 +0200
Subject: [Buildroot] [PATCH v4 0/2] pycompile: fix .pyc source paths +
 improvements
In-Reply-To: <20200904112908.21686-1-julien.floret@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
Message-ID: <20200910083252.7102-1-robin.jarry@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is about fixing the original .py source paths encoded into
.pyc files. It comes with small improvements on pycompile.py as well.

The first two commits of v2 have been applied already, I am sending the
last two which needed some rework.

Also, v3 has a problem with python 3.4 and earlier (especially python
2). This v4 should work with all versions of python.

Robin Jarry (2):
  support/scripts/pycompile: fix .pyc original source file paths
  support/scripts/pycompile: add --verbose option

 package/python/python.mk     |   6 +-
 package/python3/python3.mk   |   6 +-
 support/scripts/pycompile.py | 153 +++++++++++++++++++++++------------
 3 files changed, 108 insertions(+), 57 deletions(-)

Differences since v3:

  * Fixed errors with python <3.4.

Differences since v2:

  * Used str.format() instead of % format.
  * Renamed the TARGET positional argument into --strip-root which is
    more explicit. The script is called with --strip-root=$(TARGET_DIR).
  * Homogenized the arguments metavars.
  * Used argparse type callbacks for directory arguments checking.

-- 
2.28.0
