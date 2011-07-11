From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:53:21 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.08/debugging-improvements
Message-ID: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a small set of patches that improves a few things around
debugging.

The main change is that debugging symbols are now enabled by
default. As explained in the commit log, the reasoning is that
debugging symbols in the staging directory are often useful for remote
debugging, and disk space is typically not a problem for the staging
directory, as it remains on the development workstation. Binaries and
libraries for the target are still stripped by default, getting rid of
all debugging symbols.

Regards,

Thomas

The following changes since commit bd76bc5f80b963570e8eda92efc961e683264402:

  CHANGES: update with recent changes (2011-07-11 07:44:24 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.08/debugging-improvements

Thomas Petazzoni (4):
      debug: do not force installation of gdbserver
      debug: enable debugging symbols by default
      debug: provide an option to copy the gdbserver to the target
      config: improve help text and prompt for debugging related options

 Config.in                                |   34 ++++++++++++++++++-----------
 toolchain/gdb/Config.in                  |    8 +++++++
 toolchain/toolchain-external/ext-tool.mk |   10 ++++++++
 3 files changed, 39 insertions(+), 13 deletions(-)

Thanks,
-- 
Thomas Petazzoni
