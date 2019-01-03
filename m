From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  3 Jan 2019 21:40:15 +0100
Subject: [Buildroot] [PATCH 00/11] support/download: fix scp and reintroduce
 source-check
Message-ID: <20190103204026.23512-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hello and happy 2019 to you all!

This series has two parts:
1. fix the broken scp download helper (seems no-one is using it on recent
   releases?) (patches 1 and 2)

2. reintroduce source-check (patches 3-11)

Details in the commit messages...

Best regards,
Thomas


Thomas De Schampheleire (11):
  support/download: fix scp downloads
  support/download: fix scp download with scheme prefix 'scp://'
  support/download: reintroduce 'source-check' target
  support/download: implement source-check in hg backend
  support/download: implement source-check in wget backend
  support/download: implement source-check in file backend
  support/download: implement source-check in scp backend
  support/download: implement source-check in git backend
  support/download: implement source-check in bzr backend
  support/download: implement source-check in cvs backend
  support/download: implement source-check in svn backend

 Config.in                   |  4 ++
 Makefile                    |  7 +++
 package/pkg-download.mk     | 20 ++++++++
 package/pkg-generic.mk      | 14 +++++-
 support/download/bzr        |  9 ++++
 support/download/cvs        | 11 +++++
 support/download/dl-wrapper | 99 ++++++++++++++++++++-----------------
 support/download/file       | 12 ++++-
 support/download/git        | 22 ++++++---
 support/download/hg         |  7 +++
 support/download/scp        | 22 ++++++++-
 support/download/svn        |  7 +++
 support/download/wget       |  7 +++
 13 files changed, 187 insertions(+), 54 deletions(-)

-- 
2.18.1
