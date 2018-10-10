From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:10 +0200
Subject: [Buildroot] [PATCH 02/13] scancpan: trim the abstract
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010064621.19253-3-francois.perrad@gadz.org>
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
index 072404944..20ab27caa 100755
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
-- 
2.17.1
