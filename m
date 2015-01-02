From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 Jan 2015 16:53:37 +0100
Subject: [Buildroot] [PATCH 0/3 v10] Improve silent builds (branch
	yem/fabio/silent)
Message-ID: <cover.1420213948.git.yann.morin.1998@free.fr>
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


Changes v9 -> v10:
  - do not redirect stdout at all  (Thomas)
  - on unknown options, print an error message in backends  (Fabio)

Changes v8 -> v9:
  - propagate to all download backends  (Fabio)

Changes v7 -> v8:
  - simplify by just consigning stdout to oblivion  (Yann)


Regards,
Yann E. MORIN.


The following changes since commit 81cbf0bf84bb62d1b40f9ea4e30296b5ef495556:

  libevent: add optional dependency on OpenSSL (2015-01-02 16:37:48 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fabio/silent

for you to fetch changes up to 9b12978224418fe368d83e1ca7988619a18e9b74:

  package/pkg-download: do not hard-code QUIET (2015-01-02 16:51:53 +0100)

----------------------------------------------------------------
Fabio Porcedda (1):
      pkg-download: silence downloads if make is silent

Yann E. MORIN (2):
      support/download: support -q in all download backends
      package/pkg-download: do not hard-code QUIET

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
 11 files changed, 150 insertions(+), 63 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
