From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 18:05:27 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/polarssl-hiawatha
Message-ID: <cover.1334073813.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are two new packages, adding polarssl and hiawatha. The
combination of both allows to have a SSL-capable Web server in 327 KB
(212 KB for the polarssl shared library and 115 KB for the Hiawatha
web server), which is much smaller than the 1.5+ MB needed for
Lighttpd+OpenSSL. Those packages can therefore be an useful addition
on devices where space matters, and that also require a SSL-capable
web server.

Best regards,

Thomas

The following changes since commit 8876b6751e0bc19a3754290061808f0f8420708e:

  Fix makedevs to allow longer path names (2012-04-08 19:46:52 +0200)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/polarssl-hiawatha

Thomas Petazzoni (2):
      polarssl: new package
      hiawatha: new package

 package/Config.in                                  |    4 +
 package/hiawatha/Config.in                         |   26 +++++++++
 .../hiawatha-support-for-external-polarssl.patch   |   60 ++++++++++++++++++++
 package/hiawatha/hiawatha.mk                       |   13 ++++
 package/polarssl/Config.in                         |   28 +++++++++
 package/polarssl/polarssl-no-programs.patch        |   26 +++++++++
 package/polarssl/polarssl-no-test-suite.patch      |   26 +++++++++
 .../polarssl-shared-and-static-library.patch       |   52 +++++++++++++++++
 package/polarssl/polarssl.mk                       |   13 ++++
 9 files changed, 248 insertions(+), 0 deletions(-)
 create mode 100644 package/hiawatha/Config.in
 create mode 100644 package/hiawatha/hiawatha-support-for-external-polarssl.patch
 create mode 100644 package/hiawatha/hiawatha.mk
 create mode 100644 package/polarssl/Config.in
 create mode 100644 package/polarssl/polarssl-no-programs.patch
 create mode 100644 package/polarssl/polarssl-no-test-suite.patch
 create mode 100644 package/polarssl/polarssl-shared-and-static-library.patch
 create mode 100644 package/polarssl/polarssl.mk

Thanks,
-- 
Thomas Petazzoni
