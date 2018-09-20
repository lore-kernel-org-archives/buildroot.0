From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 00:01:13 +0200
Subject: [Buildroot] [git commit] utils/scancpan: support more licenses
Message-ID: <20180920220103.3A00D88819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8d768b247db4359bcbc8e4bfdea23763ee52230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Reviewed-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index 8f47521692..3b77b21330 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -699,9 +699,16 @@ while (my ($distname, $dist) = each %dist) {
                     ? join q{ or }, @{$dist->{license}}
                     : $dist->{license};
         # BR requires license name as in http://spdx.org/licenses/
+        $license =~ s|apache_1_1|Apache-1.1|;
         $license =~ s|apache_2_0|Apache-2.0|;
+        $license =~ s|artistic|Artistic-1.0|;
         $license =~ s|artistic_2|Artistic-2.0|;
+        $license =~ s|lgpl_2_1|LGPL-2.1|;
+        $license =~ s|lgpl_3_0|LGPL-3.0|;
+        $license =~ s|gpl_2|GPL-2.0|;
+        $license =~ s|gpl_3|GPL-3.0|;
         $license =~ s|mit|MIT|;
+        $license =~ s|mozilla_1_1|Mozilla-1.1|;
         $license =~ s|openssl|OpenSSL|;
         $license =~ s|perl_5|Artistic or GPL-1.0+|;
         my $license_files = join q{ }, keys %{$license_files{$distname}};
