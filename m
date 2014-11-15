From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Nov 2014 17:19:24 +0100
Subject: [Buildroot] [PATCH 0/4] pkg-infra: differentiate remote and local
	tarball filenames (branch yem/download)
Message-ID: <cover.1416068004.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces a new variable, FOO_UPSTREAM_SOURCE, so as to be
able to differentiate remote and local tarball filenames.

This is needed when upstream tarballs are not named the way we expect them
to be. For example, the GitHub API only provides a request like:
    GET /repos/:owner/:repo/:archive_format/:ref

So far, we're not using this API, and directly use a non-stable scheme
to retrieve the tarballs. That scheme has proven to break from time to
time, so we'll soon need to switch to the API, which is guaranteed to be
stable.

So, we need to be able to differentiate the filename remote knows the
tarball by, and the local filename we want to save that tarball as.

Changes to the GitHub helper will come in a later series, because it is
a bit more involved, and still needs some ironing out. Alternate forges
may also get added in the future, which would require such a feature.

Regards,
Yann E. MORIN.


The following changes since commit f0bd293ffd227908e1d09d61e08486d5259b5cfb:

  host-qemu: fix install (2014-11-15 14:28:45 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/download

for you to fetch changes up to 51470d856dde581d14c2e20bad669cd36332ae5b:

  docs/manual: document the new variable FOO_UPSTREAM_SOURCE (2014-11-15 16:55:39 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      pkg-infra: always specify the local tarball name when calling DOWNLOAD
      pkg-infra: squash DOWNLOAD_INNER into DOWNLOAD
      pkg-infra: differentiate remote tarball name from local filename
      docs/manual: document the new variable FOO_UPSTREAM_SOURCE

 docs/manual/adding-packages-generic.txt | 11 +++++++++++
 package/pkg-download.mk                 |  5 +----
 package/pkg-generic.mk                  |  6 +++++-
 3 files changed, 17 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
