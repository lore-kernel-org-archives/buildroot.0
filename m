From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 14:41:00 +0100
Subject: [Buildroot] [git commit] utils/scancpan: add a full stop to the
 help text when missing
Message-ID: <20181101133903.527AC846ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccd05f6fe5ca90c969d8a468390ada162c1d9c92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index e77863de34..5465ff4304 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -690,6 +690,7 @@ while (my ($distname, $dist) = each %dist) {
     mkdir $dirname unless -d $dirname;
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
         $dist->{abstract} =~ s|\s+$||;
+        $dist->{abstract} .= q{.} unless $dist->{abstract} =~ m|\.$|;
         my $abstract = wrap( q{}, qq{\t  }, $dist->{abstract} );
         my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
         say qq{write ${cfgname}} unless $quiet;
