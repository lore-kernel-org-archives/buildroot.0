From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2013 19:19:39 +0100
Subject: [Buildroot] [pull request v5] Pull request for branch
	yem-host-image-tools
Message-ID: <cover.1363544331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds a few host packages usefull for manipulating the
generated filesystem images.

It is of much interest now that the post-image series from Thomas
has been applied.

I plan on submitting sample post-{build,image} scripts demonstrating
use of those packages in the (hopefuly near) future (my current scripts
are working great, but need some cleanup first).


Changes v4 -> v5:
  -  add licensing terms  (Thomas)

Changes v3 -> v4:
  - rebased on master

Changes v2 -> v3:
  - rebased onto the 'next' branch for Peter

Changes v1 -> v2:
  - use $(HOST_CONFIGURE_OPTS) instead of hand-crafted CC et al.  (Thomas)
  - use $(BR2_GNU_MIRROR)  (Thomas)
  - strip superfluous spaces  (Thomas)


The following changes since commit eaf746eb9e8b10d5ff5011a989014b3df4b31ddc:

  zeromq: add PGM/EPGM support (2013-03-17 16:03:40 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-host-image-tools

Yann E. MORIN (6):
      package/e2fsprogs: add host-package selection
      package/dosfstools: add host-package selection
      package/libconfuse: add host variant
      package/genimage: new host-only package
      package/genpart: new host-only package
      package/mtools: new host-package

 package/Config.in.host                        |    5 +++++
 package/dosfstools/Config.in.host             |    6 ++++++
 package/dosfstools/dosfstools.mk              |    9 +++++++++
 package/e2fsprogs/Config.in.host              |    6 ++++++
 package/genimage/Config.in.host               |   12 ++++++++++++
 package/genimage/genimage.mk                  |   13 +++++++++++++
 package/genpart/Config.in.host                |    8 ++++++++
 package/genpart/genpart-fix-return-code.patch |   25 +++++++++++++++++++++++++
 package/genpart/genpart.mk                    |   18 ++++++++++++++++++
 package/libconfuse/libconfuse.mk              |    1 +
 package/mtools/Config.in.host                 |    9 +++++++++
 package/mtools/mtools.mk                      |   17 +++++++++++++++++
 12 files changed, 129 insertions(+), 0 deletions(-)
 create mode 100644 package/dosfstools/Config.in.host
 create mode 100644 package/e2fsprogs/Config.in.host
 create mode 100644 package/genimage/Config.in.host
 create mode 100644 package/genimage/genimage.mk
 create mode 100644 package/genpart/Config.in.host
 create mode 100644 package/genpart/genpart-fix-return-code.patch
 create mode 100644 package/genpart/genpart.mk
 create mode 100644 package/mtools/Config.in.host
 create mode 100644 package/mtools/mtools.mk

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
