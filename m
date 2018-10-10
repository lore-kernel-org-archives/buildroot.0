From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:18 +0200
Subject: [Buildroot] [PATCH 10/13] scancpan: add PERL_FOO_DISTNAME in
 perl-foo.mk
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010064621.19253-11-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this variable is needed for upgrading package with scancpan

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index 066882c08..e16a18303 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -747,6 +747,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname} && $host_dependencies;
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license;
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
+        say {$fh} qq{${brname}_DISTNAME = ${distname}};
         say {$fh} qq{};
         foreach (sort @{$deps_optional{$distname}}) {
             next if grep { $_ eq $distname; } @{$deps_runtime{$_}};     # avoid cyclic dependencies
-- 
2.17.1
