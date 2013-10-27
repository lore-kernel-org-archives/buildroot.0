From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Oct 2013 17:24:05 +0000
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem/instrument-build
Message-ID: <cover.1382894622.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series is an RFC to add support for instrumenting the build process,
reworked after discussion both on the ML and during the developpers' day.

It works as thus;
  - we register a set of hooks
  - hooks are called before and after each steps

There are currently two hooks defined:
  - log steps with timings  (as an example of hos to do a hook)
  - call a user-supplied script

This is just a RFC for now, and if it is accepted, new hooks can be
defined later on.

I'm planning on adding at least one other hook, that runs all scripts
present in support/step-hooks/ (or whatever its name).

Open for comments! ;-)

Changes v1 -> v2:
  - removed the intra-steps instrumentation  (Thomas, Peter)
  - accept a list of user-supplied hooks, not only one hook  (Thomas)

Regards,
Yann E. MORIN.


The following changes since commit 200bf74e8e4686c3f132a6600ae6803eda8b588a:

  Update config.guess and config.sub scripts to latest versions. (2013-10-27 15:29:38 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/instrument-build

for you to fetch changes up to a4b9a0c71f89f16b00a75ba0b37f19c71c0300c3:

  pkg-infra: add user-supplied step-hooks (2013-10-27 16:51:34 +0000)

----------------------------------------------------------------
Yann E. MORIN (4):
      post-{build,images} hooks: export BUILD_DIR too
      pkg-infra: introduce pre/post-step hooks
      pkg-infra: add hook to log timing of steps
      pkg-infra: add user-supplied step-hooks

 Makefile                            |  4 +--
 docs/manual/customize-rootfs.txt    |  5 ++--
 docs/manual/debugging-buildroot.txt | 33 +++++++++++++++++++++
 docs/manual/developer-guide.txt     |  2 ++
 package/Makefile.in                 |  5 ++++
 package/pkg-generic.mk              | 59 +++++++++++++++++++++++++++++++++++++
 6 files changed, 104 insertions(+), 4 deletions(-)
 create mode 100644 docs/manual/debugging-buildroot.txt

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
