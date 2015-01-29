From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 29 Jan 2015 12:35:35 +0100
Subject: [Buildroot] [PATCH v2 0/5] new packages: libzip and sigrok
Message-ID: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for building a minimal subset of the sigrok
software  suite. The motivation for merging these patches is making
sigrok-cli available for users of ACME board (http://baylibre.com/acme/).

v2:
- Split sigrok package into separate packages for each library and sigrok-cli.
- Properly handle conditional dependencies.
- Don't require libsigrokdecode in order to build sigrok-cli.
- Other minor fixes according to the code review.

v1:
http://lists.busybox.net/pipermail/buildroot/2015-January/118135.html

Bartosz Golaszewski (5):
  libzip: new package
  libserialport: new package
  libsigrok: new package
  sigrok-cli: new package
  libsigrokdecode: new package

 package/Config.in                          |  5 ++++
 package/libserialport/Config.in            |  8 ++++++
 package/libserialport/libserialport.mk     | 25 +++++++++++++++++
 package/libsigrok/Config.in                | 22 +++++++++++++++
 package/libsigrok/libsigrok.mk             | 45 ++++++++++++++++++++++++++++++
 package/libsigrokdecode/Config.in          | 20 +++++++++++++
 package/libsigrokdecode/libsigrokdecode.mk | 26 +++++++++++++++++
 package/libzip/Config.in                   |  8 ++++++
 package/libzip/libzip.mk                   | 15 ++++++++++
 package/sigrok-cli/Config.in               | 17 +++++++++++
 package/sigrok-cli/sigrok-cli.mk           | 32 +++++++++++++++++++++
 11 files changed, 223 insertions(+)
 create mode 100644 package/libserialport/Config.in
 create mode 100644 package/libserialport/libserialport.mk
 create mode 100644 package/libsigrok/Config.in
 create mode 100644 package/libsigrok/libsigrok.mk
 create mode 100644 package/libsigrokdecode/Config.in
 create mode 100644 package/libsigrokdecode/libsigrokdecode.mk
 create mode 100644 package/libzip/Config.in
 create mode 100644 package/libzip/libzip.mk
 create mode 100644 package/sigrok-cli/Config.in
 create mode 100644 package/sigrok-cli/sigrok-cli.mk

-- 
2.1.4
