From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jul 2014 22:31:46 +0200
Subject: [Buildroot] [git commit] support/script/scancpan: more license name
	ajustment
Message-ID: <20140724203151.D989C9D2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=827ba10035e1cc3e07af058fc0ea433c2766aed8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
