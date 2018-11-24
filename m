From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Nov 2018 22:51:57 +0100
Subject: [Buildroot] [PATCH 0/3] golang: fix build with oldisj codesourcery
 amd64 toolchain
Message-ID: <cover.1543096295.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

That toolchain seems to suffer from bug #20006
    https://sourceware.org/bugzilla/show_bug.cgi?id=20006

So, like bug 19615, introduce a config option for 20006, and mask away
all golang packages.

Additionally, make golang packages abide by the number of CPUs to use.


Regards,
Yann E. MORIN.


The following changes since commit a554109af857b7b53598c5a9e0ee1d2729da73df

  package/usb_modeswitch: disable parallel build (2018-11-24 13:03:23 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 3eaf225466a426cf89218531a5c9d685c2224a18

  package: hide golang packages for toolchains with binutils bug 20006 (2018-11-24 22:50:48 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      infra/pkg-golang: enforce number of parallel jobs
      toolchain: CodeSourcery AMD64 affected by PR20006
      package: hide golang packages for toolchains with binutils bug 20006

 package/docker-containerd/Config.in                                 | 4 ++++
 package/docker-engine/Config.in                                     | 4 ++++
 package/docker-proxy/Config.in                                      | 4 ++++
 package/flannel/Config.in                                           | 4 ++++
 package/mender/Config.in                                            | 4 ++++
 package/pkg-golang.mk                                               | 6 ++++--
 package/runc/Config.in                                              | 4 ++++
 toolchain/Config.in                                                 | 5 +++++
 .../toolchain-external-codesourcery-amd64/Config.in                 | 1 +
 9 files changed, 34 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
