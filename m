From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 16 Oct 2014 21:20:12 +0200
Subject: [Buildroot] [PATCH buildroot-test 0/8] autobuild-run improvements
Message-ID: <1413487212-5336-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This series against the buildroot-test repo makes some improvements to the
autobuild-run script. The changes that matter to me most are the support for
make-opts and a custom git wrapper, as I need this in order to run
autobuild-run in a corporate environment.

However, the series also includes some other changes:
- introduction of docopt to simplify the addition of new arguments/options
- general improvements to the script

Thomas De Schampheleire (8):
  autobuild-run: check-requirements does not need to know the login
    details
  scripts: add python module docopt
  autobuild-run: use docopt for argument parsing
  autobuild-run: convert regular function comments into docstrings
  autobuild-run: add option --make-opts for custom Buildroot options
  autobuild-run: create main method to locally-scope all variables
  autobuild-run: use **kwargs to avoid explicit parameter passthroughs
  autobuild-run: add support for custom git wrapper

 scripts/autobuild-run      | 295 +++++++++++++----------
 scripts/docopt/LICENSE-MIT |  23 ++
 scripts/docopt/__init__.py |   0
 scripts/docopt/docopt.py   | 581 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 779 insertions(+), 120 deletions(-)
 create mode 100644 scripts/docopt/LICENSE-MIT
 create mode 100644 scripts/docopt/__init__.py
 create mode 100644 scripts/docopt/docopt.py

-- 
1.8.5.1
