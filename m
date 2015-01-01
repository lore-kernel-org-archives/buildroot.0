From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 21:03:49 +0100
Subject: [Buildroot] [PATCH 0/4 v9] Improve silent builds (branch
	yem/fabio/silent)
Message-ID: <cover.1420142462.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch set improves silent builds.

Silent builds are also nice when top-level parallel make is being used
to reduce the output clutter.

Some downloaders, like git or wget, insist on reporting progress on
stderr instead of stdout, so redirecting stdout is not enough, we need
to pass the quiet information all the way down to the beackends, so
they know they have to be silent. Sigh... :-(

Changes v8 -> v9:
  - propagate to all download backends  (Fabio)

Changes v7 -> v8:
  - simplify by just consigning stdout to oblivion  (Yann)

Regards,
Yann E. MORIN.


The following changes since commit b7e7b417fa1210a7f9c4e76ee747238981dcd012:

  wpa_supplicant: fix indentation and change file permissions (2015-01-01 11:31:14 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fabio/silent

for you to fetch changes up to 8745e57788ef111547ca0a3f4b407b09cafb20f0:

  package/pkg-download: do not hard-code QUIET (2015-01-01 21:00:16 +0100)

----------------------------------------------------------------
Fabio Porcedda (2):
      Makefile: improve detection of make "-s" flag
      pkg-download: silence downloads if make is silent

Yann E. MORIN (2):
      support/download: support -q in all download backends
      package/pkg-download: do not hard-code QUIET

 Makefile                    |  2 +-
 package/pkg-download.mk     | 16 ++++++++++++----
 support/download/bzr        | 23 ++++++++++++++++-------
 support/download/check-hash |  8 ++++++++
 support/download/cp         | 20 +++++++++++++++-----
 support/download/cvs        | 23 +++++++++++++++--------
 support/download/dl-wrapper | 13 +++++++------
 support/download/git        | 24 ++++++++++++++++--------
 support/download/hg         | 24 ++++++++++++++++--------
 support/download/scp        | 20 +++++++++++++++-----
 support/download/svn        | 22 +++++++++++++++-------
 support/download/wget       | 20 +++++++++++++++-----
 12 files changed, 151 insertions(+), 64 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
