From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 20:33:17 +0200
Subject: [Buildroot] [PATCH 0/4] Misc Python fixes and updates
Message-ID: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are four patches doing misc Python fixes and updates. Patch 1 and
2 combined solve one autobuilder issues (decimal module does not build
on configurations where fenv is not available), and patch 4 solves
another autobuilder issue (python-numpy does not build on
configurations where fenv is not available).

Thanks,

Thomas

Thomas Petazzoni (4):
  mpdecimal: new package
  python3: optional decimal module support
  python3: define license and license files
  python-numpy: add patch to fix build on uClibc

 package/Config.in                                  |  1 +
 package/mpdecimal/Config.in                        | 10 +++
 package/mpdecimal/mpdecimal.mk                     | 24 +++++++
 .../python-numpy-0001-no-fenv-on-uclibc.patch      | 79 ++++++++++++++++++++++
 package/python3/Config.in                          |  6 ++
 package/python3/python3-111-optional-decimal.patch | 53 +++++++++++++++
 package/python3/python3.mk                         |  9 +++
 7 files changed, 182 insertions(+)
 create mode 100644 package/mpdecimal/Config.in
 create mode 100644 package/mpdecimal/mpdecimal.mk
 create mode 100644 package/python-numpy/python-numpy-0001-no-fenv-on-uclibc.patch
 create mode 100644 package/python3/python3-111-optional-decimal.patch

-- 
2.0.0
