From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Apr 2014 21:00:28 +0200
Subject: [Buildroot] [PATCH 0/4] evemu: disable python binding if not needed
Message-ID: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Patch 1/4] is a replacement for evemu-0002-disable-tests-patch, because
I think it is nicer to add the evemu disable feature the same way
as with the python binding (see [Patch 3/4]) and maybe this version
is suitable for upstream...

[Patch 2/4] fixes host-python/host-python3 dependency

[Patch 3/4] enables python binding only for python2

[Patch 4/4] enables python binding for python3 (with two python3
related fixes), but something seems to be broken with the
evemu-1.2.0/config-aux/py-compile script, I get no compile error and
no compiled python binding files on the target.

Patch evemu-0008-python-fix-device-open-for-python3.patch fixed an python3
binding runtime failure from an earlier build (still with
EVEMU_DEPENDENCIES += host-python), which leaves non compiled python
source files in the site-packages/evemu directory...

Peter Seiderer (4):
  evemu: disable tests via evemu configure option
  evemu: fix host-python/host-python3 dependency
  evemu: build python2 binding only if target python2 is enabled
  evemu: enable python3 bindings

 ...-00008-python-fix-device-open-for-python3.patch | 35 ++++++++++++++++
 package/evemu/evemu-0002-disable-tests.patch       | 19 ---------
 ...005-configure.ac-add-disable-tests-option.patch | 44 +++++++++++++++++++++
 ...gure.ac-add-disable-python-binding-option.patch | 46 ++++++++++++++++++++++
 ...-fixes-the-syntax-for-raising-exceptions-.patch | 39 ++++++++++++++++++
 package/evemu/evemu.mk                             | 14 ++++++-
 6 files changed, 176 insertions(+), 21 deletions(-)
 create mode 100644 package/evemu/evemu-00008-python-fix-device-open-for-python3.patch
 delete mode 100644 package/evemu/evemu-0002-disable-tests.patch
 create mode 100644 package/evemu/evemu-0005-configure.ac-add-disable-tests-option.patch
 create mode 100644 package/evemu/evemu-0006-configure.ac-add-disable-python-binding-option.patch
 create mode 100644 package/evemu/evemu-0007-Description-fixes-the-syntax-for-raising-exceptions-.patch

-- 
1.8.1.4
