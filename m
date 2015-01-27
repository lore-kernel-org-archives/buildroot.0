From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 27 Jan 2015 17:02:11 +0100
Subject: [Buildroot] [PATCH 0/2] new packages: libzip and sigrok
Message-ID: <1422374533-11694-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for building a minimal subset of the sigrok
software  suite. The motivation for merging these patches is making
sigrok-cli available for users of ACME board (http://baylibre.com/acme/).

The first patch adds libzip package - this is required to build libsigrok.

The second patch adds sigrok libraries and sigrok-cli executable in
a single package. The sources for sigrok modules are cloned from current
git HEADs. This is because ACME driver for sigrok isn't upstream yet and
we would like to make it available in buildroot as soon as it's merged.

Bartosz Golaszewski (2):
  libzip: new package
  sigrok: new package

 package/Config.in                                 |  2 ++
 package/libzip/Config.in                          |  7 +++++
 package/libzip/libzip.mk                          | 15 +++++++++
 package/sigrok/Config.in                          | 37 +++++++++++++++++++++++
 package/sigrok/libserialport/libserialport.mk     | 15 +++++++++
 package/sigrok/libsigrok/libsigrok.mk             | 16 ++++++++++
 package/sigrok/libsigrokdecode/libsigrokdecode.mk | 16 ++++++++++
 package/sigrok/sigrok.mk                          | 10 ++++++
 package/sigrok/sigrokcli/sigrokcli.mk             | 14 +++++++++
 9 files changed, 132 insertions(+)
 create mode 100644 package/libzip/Config.in
 create mode 100644 package/libzip/libzip.mk
 create mode 100644 package/sigrok/Config.in
 create mode 100644 package/sigrok/libserialport/libserialport.mk
 create mode 100644 package/sigrok/libsigrok/libsigrok.mk
 create mode 100644 package/sigrok/libsigrokdecode/libsigrokdecode.mk
 create mode 100644 package/sigrok/sigrok.mk
 create mode 100644 package/sigrok/sigrokcli/sigrokcli.mk

-- 
2.1.4
