From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 24 Jul 2014 20:50:01 +0200
Subject: [Buildroot] [PATCH] support/script/scancpan: more license name
	ajustment
Message-ID: <1406227801-31828-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index de11ef1..50d9bab 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -645,7 +645,10 @@ while (my ($distname, $dist) = each %dist) {
         my $license = ref $dist->{license} eq 'ARRAY'
                     ? join q{ or }, @{$dist->{license}}
                     : $dist->{license};
+        # BR requires license name as in http://spdx.org/licenses/
+        $license =~ s|apache_2_0|Apache-2.0|;
         $license =~ s|artistic_2|Artistic-2.0|;
+        $license =~ s|mit|MIT|;
         $license =~ s|openssl|OpenSSL|;
         $license =~ s|perl_5|Artistic or GPLv1+|;
         my $license_files = join q{ }, @{$license_files{$distname}};
-- 
1.9.1
