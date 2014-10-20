From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Oct 2014 21:39:19 +0200
Subject: [Buildroot] [PATCHv3 buildroot-test 0/9] autobuild-run improvements
Message-ID: <1413833968-11808-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This series against the buildroot-test repo makes some improvements to the
autobuild-run script.

v3:
- introduce missing usage of do_send_results (and move patch backwards)
- update TODO list

v2:
- reorder patches
- take into account comments on boolean logic in first patch
- place docopt directly in scripts/ instead of in a subdirectory
- remove patch adding --git (Yann, Thomas)
- some bug fixes in the first version of the patches

As you can see, this iteration still has the docopt patches. Thomas Petazzoni
has expressed his reservations against the introduction of docopt, because the
benefits wouldn't weigh out against the addition of an external Python module.
Thomas told me on IRC he would have a deeper look onto this before making a
final decision.

In case the final decision is not to introduce docopt, following improvements
could be done to the current code:
  - save the arguments from the command-line into a dictionary instead of plain
    variables
  - keep the added ini_config() method to also save the options in a dictionary,
    and use the added merge() method to merge both arguments and config options
    into one final configuration, without needing to handle it manually.

Thomas De Schampheleire (9):
  scripts: add python module docopt
  autobuild-run: use docopt for argument parsing
  autobuild-run: add option --make-opts for custom Buildroot options
  autobuild-run: use **kwargs to avoid explicit parameter passthroughs
  autobuild-run: check-requirements does not need to know the login
    details
  autobuild-run: set LC_ALL=C to not use locale settings of host machine
  autobuild-run: improve the logic to generate build-end.log
  autobuild-run: save config.log files for failed package
  autobuild-run: extend TODO list

 scripts/autobuild-run      | 309 ++++++++++++++++--------
 scripts/docopt.LICENSE-MIT |  23 ++
 scripts/docopt.py          | 581 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 811 insertions(+), 102 deletions(-)
 create mode 100644 scripts/docopt.LICENSE-MIT
 create mode 100644 scripts/docopt.py

-- 
1.8.5.1
