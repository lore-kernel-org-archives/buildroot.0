From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 28 Oct 2018 16:23:12 +0100
Subject: [Buildroot] [PATCH 1/2] scancpan: add a full stop to the help text
 when missing
Message-ID: <20181028152313.23272-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index 4b93ef769..9e0245d4b 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -701,6 +701,7 @@ while (my ($distname, $dist) = each %dist) {
     }
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
         $dist->{abstract} =~ s|\s+$||;
+        $dist->{abstract} .= q{.} unless $dist->{abstract} =~ m|\.$|;
         my $abstract = wrap( q{}, qq{\t  }, $dist->{abstract} );
         my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
         say qq{write ${cfgname}} unless $quiet;
-- 
2.17.1
