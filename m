From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 13:17:13 +0100
Subject: [Buildroot] [git commit] gitlab-ci: regenerate after new tests were
 added
Message-ID: <20200321120715.EC56982960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c7fbf7561a70db3d11526e75992a615b2fa9893
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent perl-crypt-ssleay, perl-lwp-protocol-https, and
perl-html-parser packages aditions came with associated new
runtime tests, which is good, but forgot to regenerate the
gitlab-ci.yml file with the updated list of tests.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cde757681e..34fed3d81b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -427,12 +427,15 @@ tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_opkg.TestOpkg: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
+tests.package.test_perl_crypt_ssleay.TestPerlCryptSSLeay: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
 tests.package.test_perl_encode_detect.TestPerlEncodeDetect: { extends: .runtime_test }
 tests.package.test_perl_gdgraph.TestPerlGDGraph: { extends: .runtime_test }
+tests.package.test_perl_html_parser.TestPerlHTMLParser: { extends: .runtime_test }
 tests.package.test_perl_io_socket_multicast.TestPerlIOSocketMulticast: { extends: .runtime_test }
 tests.package.test_perl_io_socket_ssl.TestPerlIOSocketSSL: { extends: .runtime_test }
 tests.package.test_perl_libwww_perl.TestPerllibwwwperl: { extends: .runtime_test }
+tests.package.test_perl_lwp_protocol_https.TestPerlLWPProtocolhttps: { extends: .runtime_test }
 tests.package.test_perl_mail_dkim.TestPerlMailDKIM: { extends: .runtime_test }
 tests.package.test_perl_x10.TestPerlX10: { extends: .runtime_test }
 tests.package.test_perl_xml_libxml.TestPerlXMLLibXML: { extends: .runtime_test }
