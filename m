From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 17 Sep 2015 11:29:57 +1200
Subject: [Buildroot] [PATCH v4 0/2] Micropython package
In-Reply-To: <CAFOYHZB-oynjvUKa9CkHvBpvw+kuSuPLgWrZZwEOr7YSQOvW0g@mail.gmail.com>
References: <CAFOYHZB-oynjvUKa9CkHvBpvw+kuSuPLgWrZZwEOr7YSQOvW0g@mail.gmail.com>
Message-ID: <1442446199-15963-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thought you might be interested in mircopython a minimal python 3
implementation. It's designed for micro controllers but is also well suited
to other general purpose embedded CPUs.

Cheers,
Chris

Changes since v1:
- Add dependency on host-pkgconf.
- Use $(TARGET_MAKE_ENV) in make invocation for micropython
  (micropython-lib doesn't need it because it doesn't use anything setup by
  it).
- Override PREFIX to install to /usr/bin instead of /usr/local/bin
- Update/add some comments.

Changes since v2:
- Use $(TARGET_MAKE_ENV) in micropython-lib for consistency
- Update LICENSE for micropython-lib (thanks to Vincent for the shell
  snippet that saved me having to check them manually).
- Add patch to take the version number from the package instead of from the
  buildroot git repository.

Changes since v3:
- Split into 2 patches
- Separate build and install steps for micropython
- Minor style fixes

Chris Packham (2):
  micropython: new package
  micropython-lib: new packages

 package/Config.in                          |  2 ++
 package/micropython-lib/Config.in          |  7 +++++++
 package/micropython-lib/micropython-lib.mk | 18 +++++++++++++++++
 package/micropython/0001-fix-version.patch | 22 ++++++++++++++++++++
 package/micropython/Config.in              | 12 +++++++++++
 package/micropython/micropython.mk         | 32 ++++++++++++++++++++++++++++++
 6 files changed, 93 insertions(+)
 create mode 100644 package/micropython-lib/Config.in
 create mode 100644 package/micropython-lib/micropython-lib.mk
 create mode 100644 package/micropython/0001-fix-version.patch
 create mode 100644 package/micropython/Config.in
 create mode 100644 package/micropython/micropython.mk

-- 
2.5.0
