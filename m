From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 11 Oct 2018 18:12:44 +0200
Subject: [Buildroot] [V2 0/4] scancpan
Message-ID: <20181011161248.13457-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without runtime dependencies, the build time is speed up (in parallel mode).
And now, I can upgrade easily all perl modules.

V1 [1-9/13] --> merged
V1 [10-13/13] --> V2
  + update manual with the new variable
  + regeneration of *_DISTNAME with some new packages (Moo, ...)

Francois Perrad (4):
  scancpan: add PERL_FOO_DISTNAME in perl-foo.mk
  perl-*: regeneration with _DISTNAME
  pkg-perl: add a target which upgrades all packages
  [RFC] pkg-perl: add per package upgrade target

 docs/manual/adding-packages-perl.txt          | 10 +++++++---
 .../perl-apache-logformat-compiler.mk         |  1 +
 package/perl-appconfig/perl-appconfig.mk      |  1 +
 .../perl-astro-suntime/perl-astro-suntime.mk  |  1 +
 .../perl-class-inspector.mk                   |  1 +
 package/perl-class-load/perl-class-load.mk    |  1 +
 .../perl-class-method-modifiers.mk            |  1 +
 .../perl-class-std-fast.mk                    |  1 +
 package/perl-class-std/perl-class-std.mk      |  1 +
 .../perl-convert-asn1/perl-convert-asn1.mk    |  1 +
 .../perl-cookie-baker/perl-cookie-baker.mk    |  1 +
 .../perl-crypt-blowfish.mk                    |  1 +
 package/perl-crypt-cbc/perl-crypt-cbc.mk      |  1 +
 .../perl-crypt-openssl-guess.mk               |  1 +
 .../perl-crypt-openssl-random.mk              |  1 +
 .../perl-crypt-openssl-rsa.mk                 |  1 +
 package/perl-data-dump/perl-data-dump.mk      |  1 +
 .../perl-data-optlist/perl-data-optlist.mk    |  1 +
 package/perl-data-uuid/perl-data-uuid.mk      |  1 +
 package/perl-date-manip/perl-date-manip.mk    |  1 +
 .../perl-datetime-tiny/perl-datetime-tiny.mk  |  1 +
 package/perl-dbd-mysql/perl-dbd-mysql.mk      |  2 ++
 package/perl-dbi/perl-dbi.mk                  |  1 +
 .../perl-devel-globaldestruction.mk           |  1 +
 .../perl-devel-stacktrace-ashtml.mk           |  1 +
 .../perl-devel-stacktrace.mk                  |  1 +
 .../perl-device-serialport.mk                 |  1 +
 package/perl-digest-hmac/perl-digest-hmac.mk  |  1 +
 package/perl-digest-md5/perl-digest-md5.mk    |  1 +
 package/perl-digest-sha1/perl-digest-sha1.mk  |  1 +
 .../perl-dist-checkconflicts.mk               |  1 +
 .../perl-encode-detect/perl-encode-detect.mk  |  1 +
 .../perl-encode-locale/perl-encode-locale.mk  |  1 +
 .../perl-exporter-tiny/perl-exporter-tiny.mk  |  1 +
 .../perl-extutils-config.mk                   |  1 +
 .../perl-extutils-helpers.mk                  |  1 +
 .../perl-extutils-installpaths.mk             |  1 +
 .../perl-file-listing/perl-file-listing.mk    |  1 +
 .../perl-file-sharedir-install.mk             |  1 +
 .../perl-file-sharedir/perl-file-sharedir.mk  |  1 +
 package/perl-file-slurp/perl-file-slurp.mk    |  1 +
 package/perl-file-util/perl-file-util.mk      |  1 +
 .../perl-filesys-notify-simple.mk             |  1 +
 package/perl-gd/perl-gd.mk                    |  1 +
 package/perl-gdgraph/perl-gdgraph.mk          |  1 +
 package/perl-gdtextutil/perl-gdtextutil.mk    |  1 +
 .../perl-hash-multivalue.mk                   |  1 +
 package/perl-html-parser/perl-html-parser.mk  |  1 +
 package/perl-html-tagset/perl-html-tagset.mk  |  1 +
 .../perl-http-cookies/perl-http-cookies.mk    |  1 +
 package/perl-http-daemon/perl-http-daemon.mk  |  1 +
 package/perl-http-date/perl-http-date.mk      |  1 +
 .../perl-http-entity-parser.mk                |  1 +
 .../perl-http-headers-fast.mk                 |  1 +
 .../perl-http-message/perl-http-message.mk    |  1 +
 .../perl-http-multipartparser.mk              |  1 +
 .../perl-http-negotiate.mk                    |  1 +
 package/perl-io-html/perl-io-html.mk          |  1 +
 .../perl-io-interface/perl-io-interface.mk    |  1 +
 .../perl-io-socket-multicast.mk               |  1 +
 .../perl-io-socket-ssl/perl-io-socket-ssl.mk  |  1 +
 .../perl-json-maybexs/perl-json-maybexs.mk    |  1 +
 package/perl-json-tiny/perl-json-tiny.mk      |  1 +
 package/perl-libwww-perl/perl-libwww-perl.mk  |  1 +
 .../perl-lwp-mediatypes.mk                    |  1 +
 package/perl-mail-dkim/perl-mail-dkim.mk      |  1 +
 package/perl-mailtools/perl-mailtools.mk      |  1 +
 .../perl-mime-base64-urlsafe.mk               |  1 +
 package/perl-mime-base64/perl-mime-base64.mk  |  1 +
 package/perl-mime-tools/perl-mime-tools.mk    |  1 +
 .../perl-module-build-tiny.mk                 |  1 +
 .../perl-module-build/perl-module-build.mk    |  1 +
 .../perl-module-implementation.mk             |  1 +
 .../perl-module-runtime.mk                    |  1 +
 .../perl-mojolicious-plugin-authentication.mk |  1 +
 package/perl-mojolicious/perl-mojolicious.mk  |  1 +
 package/perl-moo/perl-moo.mk                  |  1 +
 package/perl-net-dns/perl-net-dns.mk          |  1 +
 package/perl-net-http/perl-net-http.mk        |  1 +
 package/perl-net-ping/perl-net-ping.mk        |  1 +
 package/perl-net-snmp/perl-net-snmp.mk        |  1 +
 package/perl-net-ssh2/perl-net-ssh2.mk        |  2 ++
 package/perl-net-ssleay/perl-net-ssleay.mk    |  1 +
 package/perl-net-telnet/perl-net-telnet.mk    |  1 +
 package/perl-netaddr-ip/perl-netaddr-ip.mk    |  1 +
 .../perl-number-bytes-human.mk                |  1 +
 .../perl-package-stash/perl-package-stash.mk  |  1 +
 package/perl-params-util/perl-params-util.mk  |  1 +
 package/perl-path-tiny/perl-path-tiny.mk      |  1 +
 package/perl-plack/perl-plack.mk              |  1 +
 .../perl-posix-strftime-compiler.mk           |  1 +
 package/perl-role-tiny/perl-role-tiny.mk      |  1 +
 .../perl-stream-buffered.mk                   |  1 +
 .../perl-sub-exporter-progressive.mk          |  1 +
 package/perl-sub-install/perl-sub-install.mk  |  1 +
 package/perl-sub-quote/perl-sub-quote.mk      |  1 +
 package/perl-sys-meminfo/perl-sys-meminfo.mk  |  1 +
 package/perl-sys-mmap/perl-sys-mmap.mk        |  1 +
 package/perl-time-hires/perl-time-hires.mk    |  1 +
 .../perl-time-parsedate.mk                    |  1 +
 package/perl-timedate/perl-timedate.mk        |  1 +
 package/perl-try-tiny/perl-try-tiny.mk        |  1 +
 package/perl-type-tiny/perl-type-tiny.mk      |  1 +
 package/perl-uri/perl-uri.mk                  |  1 +
 .../perl-www-form-urlencoded.mk               |  1 +
 .../perl-www-robotrules.mk                    |  1 +
 package/perl-x10/perl-x10.mk                  |  1 +
 package/perl-xml-libxml/perl-xml-libxml.mk    |  1 +
 .../perl-xml-namespacesupport.mk              |  1 +
 .../perl-xml-sax-base/perl-xml-sax-base.mk    |  1 +
 package/perl-xml-sax/perl-xml-sax.mk          |  1 +
 package/pkg-generic.mk                        |  6 +++++-
 package/pkg-perl.mk                           | 20 +++++++++++++++++++
 utils/scancpan                                |  1 +
 114 files changed, 145 insertions(+), 4 deletions(-)

-- 
2.17.1
