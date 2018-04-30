From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 30 Apr 2018 12:23:57 -0700
Subject: [Buildroot] [PATCH 0/2] Allow host python3 without a target python
Message-ID: <20180430192359.15733-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's currently not possible to select the default host python to be
python3 without also turning on target python3.

There was a previous patch that attemped to resolve this
https://patchwork.ozlabs.org/patch/854602/ but there were issues.

This should solve those issues, using the approach I described in
comment #4.

This series does not yet hunt down every non-python-package that uses
host-python to make sure it gets the proper host python version.  I just
did the packages I needed to test with our project and will wait to see
if the approach is accepted before working on the remaining packages.

Trent Piepho (2):
  host-python: Select host python version when no target python
  packages: Use PKG_PYTHON_HOST_PYTHON for host python

 package/Config.in.host         | 1 +
 package/gtest/gtest.mk         | 5 ++---
 package/ninja/ninja.mk         | 3 +--
 package/pkg-python.mk          | 6 +++++-
 package/python/python.mk       | 2 +-
 package/python3/Config.in.host | 8 ++++++++
 package/python3/python3.mk     | 2 +-
 7 files changed, 19 insertions(+), 8 deletions(-)
 create mode 100644 package/python3/Config.in.host

-- 
2.14.3
