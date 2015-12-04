From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  4 Dec 2015 20:26:55 +0100
Subject: [Buildroot] [V3 0/2] SpamAssassin
Message-ID: <1449257217-8021-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

V3:
- fix Perl/CPAN infrastructure
- patch SpamAssassin in order to avoid host-perl modules dependencies

See previous discussion in https://patchwork.ozlabs.org/patch/464635/

Francois Perrad (2):
  pkg-perl: avoid insertion of host-perl in the shebang of scripts
  perl-mail-spamassassin: new package

 package/Config.in                                  |  1 +
 .../0001-without-host-perl-dependencies.patch      | 64 ++++++++++++++++++++++
 package/perl-mail-spamassassin/Config.in           | 26 +++++++++
 .../perl-mail-spamassassin.hash                    |  3 +
 .../perl-mail-spamassassin.mk                      | 31 +++++++++++
 package/pkg-perl.mk                                |  1 +
 6 files changed, 126 insertions(+)
 create mode 100644 package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
 create mode 100644 package/perl-mail-spamassassin/Config.in
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.hash
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.mk

--
2.5.0
