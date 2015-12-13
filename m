From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Dec 2015 18:28:11 +0100
Subject: [Buildroot] [V5] SpamAssassin
Message-ID: <1450027692-16039-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

V4 -> V5: no functional changes
    - add some comments from Thomas Petazzoni

V3 -> V4: add remarks from Bernd Kuhls
- SpamAssassin
    - add perl-db-file as optional dependency
    - set VENDORPREFIX
    - set INSTALLVENDORCONF
- fix perl-db-file
    - patch from Bernd Kuhls, see https://patchwork.ozlabs.org/patch/553054/

V3:
- fix Perl/CPAN infrastructure
- patch SpamAssassin in order to avoid host-perl modules dependencies

See previous discussion in https://patchwork.ozlabs.org/patch/464635/

Francois Perrad (1):
  perl-mail-spamassassin: new package

 package/Config.in                                  |  1 +
 .../0001-without-host-perl-dependencies.patch      | 64 ++++++++++++++++++++++
 package/perl-mail-spamassassin/Config.in           | 28 ++++++++++
 .../perl-mail-spamassassin.hash                    |  3 +
 .../perl-mail-spamassassin.mk                      | 38 +++++++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
 create mode 100644 package/perl-mail-spamassassin/Config.in
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.hash
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.mk

--
2.5.0
