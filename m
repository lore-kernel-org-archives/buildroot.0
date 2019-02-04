From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  4 Feb 2019 19:05:45 +0100
Subject: [Buildroot] [PATCHv2 0/8] fix scp and reintroduce source-check
 target
Message-ID: <20190204180553.18394-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hello,

After the overwhelming support for 'source-check' at the Buildroot Developer
Days ;-) , here is a second iteration of this series.

The first commit is actually a bugfix separate from source-check. In v1 of this
series it was also included as the second of two 'scp'-related bugfixes, but it
seems only the first bug-fix was applied at that time, which I hadn't realized
until now.

Patches 2-8 are the actual source-check releated ones.
For git, svn, bzr and cvs, there is no actual implementation which means that
the corresponding download scripts will perform the standard download logic,
which will also verify the validity of the specified revision on the remote
server, but not as optimal as for the other methods.

Best regards,
Thomas

Thomas De Schampheleire (8):
  support/download/scp: fix download with scheme prefix 'scp://'
  support/download: reintroduce 'source-check' target
  support/download/hg: implement source-check
  support/download/wget: implement source-check
  support/download/file: implement source-check
  Config.in: reintroduce BR2_SSH
  support/download/scp: implement source-check
  support/download/{bzr,cvs,git,svn}: highlight unimplemented
    source-check

 Config.in                   |  4 ++
 Makefile                    |  7 +++
 package/pkg-download.mk     | 20 ++++++++
 package/pkg-generic.mk      | 14 +++++-
 support/download/bzr        |  2 +
 support/download/cvs        |  2 +
 support/download/dl-wrapper | 99 ++++++++++++++++++++-----------------
 support/download/file       | 12 ++++-
 support/download/git        |  2 +
 support/download/hg         |  7 +++
 support/download/scp        | 17 +++++++
 support/download/svn        |  2 +
 support/download/wget       |  7 +++
 13 files changed, 149 insertions(+), 46 deletions(-)

-- 
2.19.2
