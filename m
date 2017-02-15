From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 22:44:32 +0100
Subject: [Buildroot] [PATCH 0/7 v4] support/test-pkg: fixes and enhancements
Message-ID: <cover.1487195062.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series brings a few fixes and improvements to the test-pkg script.

Changes v3 -> v4:
  - drop patches already applied
  - run legal-info as well  (Romain, Thomas)
  - add anentry in the manual  (Thomas)
  - misc cleanups in 3 new patches

Changes v2 -> v3:
  - drop patches already applied
  - simplify the config check  (Cam)
  - be less verbose  (Thomas)
  - fix coding style  (Thomas)

Changes v2 -> v3:
  - simplify the code to store missing config lines  (Luca)
  - properly run when -r is not provided
  - add 5th path to use an alternate list
  - add 6th patch to print the progress [n/N] for each toolchain


Regards,
Yann E. MORIN.


The following changes since commit 8ae3dce5275915a1784b00bf145af907827fed0d

  postgresql: disable spinlocks on openrisc (2017-02-15 22:34:44 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 58d4b1a3fa0de47c84ee8bc281d3b89edfe5b40c

  support/test-pkg: run legal-info (2017-02-15 22:37:30 +0100)


----------------------------------------------------------------
Yann E. MORIN (7):
      docs/manual: document the test-pkg script
      support/test-pkg: add option to use an alternate list of toolchains
      support/test-pkg: print number of toolchain and progress
      support/test-pkg: the list of toolchains really contains URLs
      support/test-pkg: cannonicalize paths early
      support/test-pkg: create build dir from caller
      support/test-pkg: run legal-info

 docs/manual/adding-packages-tips.txt |  91 +++++++++++++++++++++++++++++++
 support/scripts/test-pkg             | 101 +++++++++++++++++++++++------------
 2 files changed, 159 insertions(+), 33 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
