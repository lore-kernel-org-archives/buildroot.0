From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:05:45 +0200
Subject: [Buildroot] [git commit] scancpan: trim the abstract
Message-ID: <20181010070555.AF68481E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8966be9d21a9569104e4988397c37fd4703a6854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index 0724049441..20ab27caa1 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -688,6 +688,7 @@ while (my ($distname, $dist) = each %dist) {
     my $brname = brname( $fsname );
     mkdir $dirname unless -d $dirname;
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
+        $dist->{abstract} =~ s|\s+$||;
         my $abstract = wrap( q{}, qq{\t  }, $dist->{abstract} );
         my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
         say qq{write ${cfgname}} unless $quiet;
