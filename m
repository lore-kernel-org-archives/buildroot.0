From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Nov 2016 23:18:31 +0100
Subject: [Buildroot] [PATCH 0/5 v2] package/pseudo: fix build and better
	mimic fakeroot
Message-ID: <cover.1478643505.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

When we switched from using fakeroot to using pseudo, a lot of
assumptions were made, in that we assumed pseudo was by default
behaving as fakeroot did.

That is wrong. pseudo is a little bit more versatile than fakeroot
is, so using it is a little bit more involved.

First, its buildsystem is a bit convoluted, and can incorrectly guess
the host charateristics, like bitness.

Second, it needs to be told at runtime where to look at, and put its
own stuff. It correctly gueses, but prints a warning that it had to
gues, and the location to store its DB is not optimum (even if not
incorrect).

So, this series ensures that pseudo is correctly built and that we
correctly specify the runtime configuration.


Regards,
Yann E. MORIN.


The following changes since commit 64904f0f6d691cfea5ae1c8f58e2d61aac0684c2

  mpv: fix build on powerpc64 w/ altivec (2016-11-08 09:37:17 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 29ffadca0013de2c9d9c7e749f13cb6e0361a9f0

  package/pseudo: provide better legacy handling for fakeroot (2016-11-08 23:17:51 +0100)


----------------------------------------------------------------
Yann E. MORIN (5):
      package/pseudo: enforce the host bitness
      package/pseudo: force rpath and pass our host CFLAGS
      package/pseudo: wrap the real pseudo with a wrapper
      fs: call the pseudo wrapper
      package/pseudo: provide better legacy handling for fakeroot

 fs/common.mk                  |  2 +-
 package/pseudo/pseudo-wrapper | 19 +++++++++++++++++++
 package/pseudo/pseudo.mk      | 14 +++++++++++++-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 package/pseudo/pseudo-wrapper

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
