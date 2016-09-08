From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 Sep 2016 23:11:43 +0200
Subject: [Buildroot] [PATCH 0/2 v2] libssh/ssh2: fix dependencies due to
	libgcrypt (branch yem/libgcrypt-fixes)
Message-ID: <cover.1473369033.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Since 2f89476 (package/libgpg-error: bump to version 1.23), libssh and
libssh2 have inherited the dependency from libgcrypt (propagated from
libgpg-error).

However, since they can use either openssl or libgcrypt as a backend,
the dependency should be relaxed when openssl is available.

But the test is broken and inverted: it will make them unavailable as
soon as openssl is enabled.

This causes further issues for libssh, as it can be selected when
openssl is enabled (see first patch).

This series fixes this dependency.


Changes v1 -> v2:
  - invert the selection to use openssl as a fallback  (Thomas)
  - drop the arch dependency  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit d8983d0c7604681577c7641c1fb198a7095ef037

  cifs-utils: bump to version 6.6 (2016-09-08 08:49:36 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d43755749a1facb634718891552836557cb9d480

  package/libssh2: fix dependency on libgcrypt (2016-09-08 23:08:51 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/libssh: fix dependency on libgcrypt
      package/libssh2: fix dependency on libgcrypt

 package/libssh/Config.in   | 3 +--
 package/libssh/libssh.mk   | 4 ++--
 package/libssh2/Config.in  | 3 +--
 package/libssh2/libssh2.mk | 4 ++--
 4 files changed, 6 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
