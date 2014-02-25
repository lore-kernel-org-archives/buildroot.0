From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 25 Feb 2014 16:45:35 +0100
Subject: [Buildroot] [PATCH v2 0/2] improve virtual package management
Message-ID: <1393343137-4209-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series improves virtual package management by:

- using make control functions in dependency check.
- adding a tutorial to the user manual.

Changes v1 -> v2:
  - rebased on master.
  - replaced 'infrastructure' by 'management' as this mechanism does not (yet?)
    provide a "$(eval $(virtual-package))" helper
  - converted code examples to plain sections (suggested by Yann E. Morin).

Best regards,
ELB

Eric Le Bihan (2):
  packages: improve dependency check in virtual packages.
  manual: add virtual package tutorial.

 docs/manual/adding-packages-virtual.txt  |   99 ++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt          |    2 +
 package/luainterpreter/luainterpreter.mk |    6 ++
 package/opengl/libegl/libegl.mk          |    7 +--
 package/opengl/libgles/libgles.mk        |    7 +--
 package/opengl/libopenmax/libopenmax.mk  |    7 +--
 package/opengl/libopenvg/libopenvg.mk    |    7 +--
 package/powervr/powervr.mk               |    7 +--
 8 files changed, 122 insertions(+), 20 deletions(-)
 create mode 100644 docs/manual/adding-packages-virtual.txt

-- 
1.7.9.5
