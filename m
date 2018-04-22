From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 23:20:02 +0200
Subject: [Buildroot] [PATCH 0/3] Fix udftools in static linking scenarios
Message-ID: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of 3 patches aim at fixing the build of udftools in static
linking scenarios.

The first patch is a somewhat unrelated fix, which is really trivial,
and not specific to static linking.

The second patch fixes the readline package to install a pkg-config
file.

The third patch fixes the udftools package to use the readline
pkg-config file.

The overall solution is I believe the most correct one (use a
pkg-config file), but is admittedly a bit complex and requires to
autoreconf two more packages. If people don't like it, I'll be happy
to change it to just pass "-lncurses" when building udftools, which
would achieve the same effect.

Thanks,

Thomas

Thomas Petazzoni (3):
  udftool: add missing dependency on readline
  readline: install a .pc file
  udftools: fix static linking against readline

 ...c-readline.pc.in-fix-Requires.private-val.patch | 62 ++++++++++++++++++++++
 package/readline/readline.mk                       | 17 +++++-
 ...c-detect-readline-via-pkg-config-when-pos.patch | 60 +++++++++++++++++++++
 package/udftools/udftools.mk                       |  2 +
 4 files changed, 139 insertions(+), 2 deletions(-)
 create mode 100644 package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch
 create mode 100644 package/udftools/0002-configure.ac-detect-readline-via-pkg-config-when-pos.patch

-- 
2.14.3
