From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Jun 2014 14:44:24 +0100
Subject: [Buildroot] [PATCH 0/5] Add support for gnupg2
Message-ID: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series of patches add support for gnupg2 by adding the gnupg2 
package. The pth and libksba packages are added because they are direct 
dependencies of gnupg2.
It also makes gnupg and gnupg2 mutual exclusive because they can't be 
installed at the same time due to file collisions.
And it also add support for pinentry by adding this package to make the 
gnupg and gnupg2 packages more useful. Right now we can't even generate 
a key with "gpg --gen-key" because there isn't a pinentry program to ask 
for a passphrase.

Vicente Olivert Riera (5):
  pth: new package
  libksba: new package
  gnupg2: new package
  gnupg: Make gnupg and gnupg2 mutual exclusive
  pinentry: new package

 package/Config.in                               |    4 +
 package/gnupg/Config.in                         |    1 +
 package/gnupg2/Config.in                        |   39 ++++++++++++
 package/gnupg2/gnupg2.mk                        |   27 ++++++++
 package/libksba/Config.in                       |    7 ++
 package/libksba/libksba.mk                      |   16 +++++
 package/pinentry/Config.in                      |   53 ++++++++++++++++
 package/pinentry/pinentry.mk                    |   47 ++++++++++++++
 package/pth/Config.in                           |   10 +++
 package/pth/pth-001-disable-documentation.patch |   74 +++++++++++++++++++++++
 package/pth/pth.mk                              |   28 +++++++++
 11 files changed, 306 insertions(+), 0 deletions(-)
 create mode 100644 package/gnupg2/Config.in
 create mode 100644 package/gnupg2/gnupg2.mk
 create mode 100644 package/libksba/Config.in
 create mode 100644 package/libksba/libksba.mk
 create mode 100644 package/pinentry/Config.in
 create mode 100644 package/pinentry/pinentry.mk
 create mode 100644 package/pth/Config.in
 create mode 100644 package/pth/pth-001-disable-documentation.patch
 create mode 100644 package/pth/pth.mk
