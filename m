From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 13 Aug 2018 06:11:34 -0700
Subject: [Buildroot] [RFC PATCH 1/2] scancpan: support more licenses
In-Reply-To: <20180813131135.32651-1-chrismcc@gmail.com>
References: <20180813131135.32651-1-chrismcc@gmail.com>
Message-ID: <20180813131135.32651-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

from perl-module-build Module/Build/Base.pm %licenses
GPL, LGPT, and BSD

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 utils/scancpan | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index da8e7b91ac..2070e2a233 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -692,8 +692,19 @@ while (my ($distname, $dist) = each %dist) {
                     : $dist->{license};
         # BR requires license name as in http://spdx.org/licenses/
         $license =~ s|apache_2_0|Apache-2.0|;
+        $license =~ s|apache_1_1|Apache-1.1|;
+        $license =~ s|apache|Apache-2.0|;
         $license =~ s|artistic_2|Artistic-2.0|;
+        $license =~ s|artistic|Artistic-1.0|;
+        $license =~ s|lgpl_2_1|LGPL-2.1|;
+        $license =~ s|lgpl_3_0|LGPL-3.0|;
+        $license =~ s|lgpl|LGPL-2.1|;
+        $license =~ s|bsd|BSD|;
+        $license =~ s|gpl_2|GPL-2.0|;
+        $license =~ s|gpl_3|GPL-3.0|;
+        $license =~ s|gpl|GPL-1.0|;
         $license =~ s|mit|MIT|;
+        $license =~ s|mozilla_1_1|Mozilla-1.1|;
         $license =~ s|openssl|OpenSSL|;
         $license =~ s|perl_5|Artistic or GPL-1.0+|;
         my $license_files = join q{ }, keys %{$license_files{$distname}};
-- 
2.14.4
