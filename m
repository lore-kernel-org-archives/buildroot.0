From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 01:11:24 +0200
Subject: [Buildroot] [pull request] [RFC] Pull request for branch
	yem/instrument-build
Message-ID: <cover.1381705600.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This is an RFC about instrumenting the build process.

It works as thus:
  - we register a set of hooks
  - hooks are called before and after each steps

There are currently two hooks defined:
  - log steps with timings
  - call a user-supplied script

This is just a RFC for now, new hooks can be defined later on.

I'm planning on adding at least one other hook, that runs all scripts
present in support/step-hooks/ (or whatever its name). Eventually,
the user-supplied hook could be made to accept a directory instead of
a file, and run all scripts in that directory, too.

Open for comments! ;-)

Regards,
Yann E. MORIN.


The following changes since commit 9f7e8f120dfeddd8b49eb4d232253cc3f9ac8efa:

  package/weston: add RPi compositor (2013-10-11 08:56:53 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/instrument-build

for you to fetch changes up to 3f8ce54570cde2f93d5f61c80a1b28af046b4926:

  pkg-infra: add user-supplied step-hooks (2013-10-14 00:58:46 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      pkg-infra: introduce pre/post-step hooks
      pkg-infra: add hook to log timing of steps
      Makefile: export BUILD_DIR
      pkg-infra: add user-supplied step-hooks

 Makefile               |  1 +
 package/pkg-generic.mk | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
