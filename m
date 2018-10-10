From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:08 +0200
Subject: [Buildroot] [PATCH 00/13] scancpan
Message-ID: <20181010064621.19253-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without runtime dependencies, the build time is speed up (in parallel mode).
And now, I can upgrade easily all perl modules.

Francois Perrad (13):
  scancpan: wrap abstract if too long
  scancpan: trim the abstract
  scancpan: sort license files
  scancpan: sort license in hash file
  scancpan: split multiple dependencies on multiple lines
  scancpan: remove run-time dependencies
  perl-*: regeneration of hash files
  perl-*: regeneration of Config.in files
  perl-*: regeneration of *.mk files
  scancpan: add PERL_FOO_DISTNAME in perl-foo.mk
  perl-*: regeneration with _DISTNAME
  pkg-perl: add a target which upgrades all packages from metacpan
  [RFC] pkg-perl: add per package upgrade target

 .../perl-apache-logformat-compiler.mk         |  3 ++-
 package/perl-appconfig/Config.in              |  3 ++-
 package/perl-appconfig/perl-appconfig.mk      |  1 +
 .../perl-astro-suntime/perl-astro-suntime.mk  |  1 +
 .../perl-class-inspector.mk                   |  1 +
 package/perl-class-load/perl-class-load.mk    |  7 +-----
 .../perl-class-std-fast.mk                    |  2 +-
 package/perl-class-std/perl-class-std.mk      |  1 +
 package/perl-convert-asn1/Config.in           |  3 ++-
 .../perl-convert-asn1/perl-convert-asn1.mk    |  1 +
 .../perl-cookie-baker/perl-cookie-baker.mk    |  3 ++-
 .../perl-crypt-blowfish.mk                    |  1 +
 package/perl-crypt-cbc/perl-crypt-cbc.mk      |  1 +
 .../perl-crypt-openssl-guess.mk               |  1 +
 package/perl-crypt-openssl-random/Config.in   |  2 +-
 .../perl-crypt-openssl-random.mk              |  1 +
 package/perl-crypt-openssl-rsa/Config.in      |  2 +-
 .../perl-crypt-openssl-rsa.mk                 |  1 +
 package/perl-data-dump/perl-data-dump.mk      |  1 +
 .../perl-data-optlist/perl-data-optlist.mk    |  2 +-
 package/perl-data-uuid/perl-data-uuid.mk      |  1 +
 package/perl-date-manip/perl-date-manip.mk    |  1 +
 .../perl-datetime-tiny/perl-datetime-tiny.mk  |  1 +
 package/perl-dbd-mysql/perl-dbd-mysql.mk      |  8 ++++--
 package/perl-dbi/perl-dbi.mk                  |  1 +
 .../perl-devel-stacktrace-ashtml.mk           |  2 +-
 .../perl-devel-stacktrace.mk                  |  1 +
 .../perl-device-serialport.mk                 |  1 +
 package/perl-digest-hmac/Config.in            |  4 +--
 package/perl-digest-hmac/perl-digest-hmac.mk  |  1 +
 package/perl-digest-md5/perl-digest-md5.mk    |  1 +
 package/perl-digest-sha1/perl-digest-sha1.mk  |  1 +
 .../perl-dist-checkconflicts.mk               |  2 +-
 package/perl-encode-detect/Config.in          |  2 +-
 .../perl-encode-detect/perl-encode-detect.mk  |  1 +
 package/perl-encode-locale/Config.in          |  2 +-
 .../perl-encode-locale/perl-encode-locale.mk  |  1 +
 .../perl-extutils-config.mk                   |  1 +
 .../perl-extutils-helpers.mk                  |  1 +
 .../perl-extutils-installpaths.mk             |  1 +
 package/perl-file-listing/Config.in           |  4 +--
 .../perl-file-listing/perl-file-listing.mk    |  2 +-
 .../perl-file-sharedir-install.mk             |  1 +
 .../perl-file-sharedir/perl-file-sharedir.mk  |  3 ++-
 package/perl-file-slurp/perl-file-slurp.mk    |  1 +
 package/perl-file-util/perl-file-util.mk      |  1 +
 .../perl-filesys-notify-simple.mk             |  1 +
 package/perl-gd/perl-gd.mk                    |  1 +
 package/perl-gdgraph/perl-gdgraph.mk          |  2 +-
 package/perl-gdtextutil/perl-gdtextutil.mk    |  1 +
 .../perl-hash-multivalue.mk                   |  1 +
 package/perl-html-parser/perl-html-parser.mk  |  2 +-
 package/perl-html-tagset/Config.in            |  4 +--
 package/perl-html-tagset/perl-html-tagset.mk  |  1 +
 .../perl-http-cookies/perl-http-cookies.mk    |  2 +-
 package/perl-http-daemon/Config.in            |  5 ++--
 package/perl-http-daemon/perl-http-daemon.mk  |  2 +-
 package/perl-http-date/Config.in              |  5 ++--
 package/perl-http-date/perl-http-date.mk      |  1 +
 .../perl-http-entity-parser.mk                |  9 ++-----
 .../perl-http-headers-fast.mk                 |  3 ++-
 .../perl-http-message/perl-http-message.mk    |  2 +-
 .../perl-http-multipartparser.mk              |  1 +
 package/perl-http-negotiate/Config.in         |  6 ++---
 .../perl-http-negotiate.mk                    |  2 +-
 package/perl-io-html/Config.in                |  5 ++--
 package/perl-io-html/perl-io-html.mk          |  1 +
 .../perl-io-interface/perl-io-interface.mk    |  1 +
 .../perl-io-socket-multicast.mk               |  2 +-
 .../perl-io-socket-ssl/perl-io-socket-ssl.mk  |  2 +-
 .../perl-json-maybexs/perl-json-maybexs.mk    |  1 +
 package/perl-json-tiny/perl-json-tiny.mk      |  1 +
 package/perl-libwww-perl/perl-libwww-perl.mk  | 15 +----------
 package/perl-lwp-mediatypes/Config.in         |  5 ++--
 .../perl-lwp-mediatypes.mk                    |  1 +
 package/perl-mail-dkim/perl-mail-dkim.mk      |  2 +-
 package/perl-mailtools/perl-mailtools.hash    |  5 ++--
 package/perl-mailtools/perl-mailtools.mk      |  2 +-
 .../perl-mime-base64-urlsafe.mk               |  1 +
 package/perl-mime-base64/Config.in            |  5 ++--
 package/perl-mime-base64/perl-mime-base64.mk  |  1 +
 package/perl-mime-tools/perl-mime-tools.mk    |  2 +-
 .../perl-module-build-tiny.mk                 |  6 ++++-
 .../perl-module-build/perl-module-build.mk    |  1 +
 package/perl-module-implementation/Config.in  |  4 +--
 .../perl-module-implementation.mk             |  2 +-
 .../perl-module-runtime.mk                    |  1 +
 .../perl-mojolicious-plugin-authentication.mk |  2 +-
 package/perl-mojolicious/perl-mojolicious.mk  |  1 +
 package/perl-net-dns/perl-net-dns.mk          |  2 +-
 package/perl-net-http/perl-net-http.hash      |  5 ++--
 package/perl-net-http/perl-net-http.mk        |  2 +-
 package/perl-net-ping/perl-net-ping.mk        |  1 +
 package/perl-net-snmp/perl-net-snmp.mk        |  1 +
 package/perl-net-ssh2/perl-net-ssh2.mk        |  2 ++
 package/perl-net-ssleay/perl-net-ssleay.mk    |  1 +
 package/perl-net-telnet/perl-net-telnet.mk    |  1 +
 package/perl-netaddr-ip/perl-netaddr-ip.mk    |  1 +
 .../perl-number-bytes-human.mk                |  1 +
 .../perl-package-stash/perl-package-stash.mk  |  2 +-
 package/perl-params-util/perl-params-util.mk  |  1 +
 package/perl-path-tiny/perl-path-tiny.mk      |  1 +
 package/perl-plack/perl-plack.mk              | 17 ++-----------
 .../perl-posix-strftime-compiler.mk           |  1 +
 .../perl-stream-buffered.mk                   |  1 +
 package/perl-sub-install/perl-sub-install.mk  |  1 +
 package/perl-sys-meminfo/perl-sys-meminfo.mk  |  1 +
 package/perl-sys-mmap/perl-sys-mmap.hash      |  2 +-
 package/perl-sys-mmap/perl-sys-mmap.mk        |  3 ++-
 package/perl-time-hires/perl-time-hires.mk    |  1 +
 .../perl-time-parsedate.mk                    |  1 +
 package/perl-timedate/Config.in               |  2 +-
 package/perl-timedate/perl-timedate.mk        |  1 +
 package/perl-try-tiny/perl-try-tiny.mk        |  1 +
 package/perl-uri/perl-uri.hash                |  5 ++--
 package/perl-uri/perl-uri.mk                  |  1 +
 .../perl-www-form-urlencoded.mk               |  1 +
 package/perl-www-robotrules/Config.in         |  5 ++--
 .../perl-www-robotrules.mk                    |  2 +-
 package/perl-x10/perl-x10.mk                  |  2 +-
 package/perl-xml-libxml/perl-xml-libxml.mk    |  3 ++-
 .../perl-xml-namespacesupport.mk              |  1 +
 .../perl-xml-sax-base/perl-xml-sax-base.mk    |  1 +
 package/perl-xml-sax/perl-xml-sax.mk          |  2 +-
 package/pkg-generic.mk                        |  6 ++++-
 package/pkg-perl.mk                           | 20 +++++++++++++++
 utils/scancpan                                | 25 +++++++++++++------
 127 files changed, 203 insertions(+), 128 deletions(-)

-- 
2.17.1
