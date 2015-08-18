From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2015 21:23:15 +0200
Subject: [Buildroot] [PATCH 0/2 v2] package/protobuf: misc fixes (branch
	yem/protobuf)
Message-ID: <cover.1439925738.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes two things wrt protobuf:

  - remove a false comment in protobuf-c, implying that there was a
    dependency on protobuf, which is wrong,

  - make protobuf depend on shared libs to fix an idiosyncracy of the
    autoconf macro that checks for threads and forcibly wants to link it
    shared, always.


Changes v1 -> v2:
  - rebase on top of master, after the thread fixes


Regards,
Yann E. MORIN.


The following changes since commit 932442e7a30e6d2e08c1ba8cb1d4c1cf7464926c:

  ola: Add patch to fix linking issue (2015-08-18 21:06:20 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/protobuf

for you to fetch changes up to f3cf57fe430940d32733da671c2a9bbac56b1cb9:

  package/protobuf: needs dynamic libraries (2015-08-18 21:18:01 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/protobuf-c: threads dependency is a direct dependency
      package/protobuf: needs dynamic libraries

 package/mosh/Config.in       | 6 ++++--
 package/ola/Config.in        | 6 ++++--
 package/protobuf-c/Config.in | 2 +-
 package/protobuf/Config.in   | 6 ++++--
 4 files changed, 13 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
