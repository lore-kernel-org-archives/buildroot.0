From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Mon, 27 Feb 2017 14:26:00 +0100
Subject: [Buildroot] [PATCH 0/1] python-pylibftdi new package
Message-ID: <1488201961-15539-1-git-send-email-christian.kellermann@solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear List,

This patch adds the python binding for libftdi. However it contains a
hackish patch which I would like to discuss. Pylibftdi uses the ctypes
find_library call to find the libusb and libftdi libraries. This in
turn seems to rely on ldconfig which is not part of buildroot.

Patching it out here seems to work fine, but this kind of hides the
general problem of fixing find_library in the python package. How
would one do this properly?

Thanks,

Christian


Christian Kellermann (1):
  libftdi: new package

 package/Config.in                                         |  1 +
 .../python-pylibftdi/0001-do-not-use-find-library.patch   | 14 ++++++++++++++
 package/python-pylibftdi/Config.in                        | 13 +++++++++++++
 package/python-pylibftdi/python-libftdi.hash              |  3 +++
 package/python-pylibftdi/python-libftdi.mk                | 15 +++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/python-pylibftdi/0001-do-not-use-find-library.patch
 create mode 100644 package/python-pylibftdi/Config.in
 create mode 100644 package/python-pylibftdi/python-libftdi.hash
 create mode 100644 package/python-pylibftdi/python-libftdi.mk

-- 
2.1.4
