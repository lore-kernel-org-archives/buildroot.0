From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 08:13:45 -0700
Subject: [Buildroot] [PATCH 4/4] scancpan: skip Dist::Zilla
Message-ID: <20180810151345.17792-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

skip Dist::Zilla when finding dependancies

---

Dist::Zilla will pull in lots of unneeded dependancies
./utils/scancpan Class-Load will bring in ~250 perl-foo packages

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index da8e7b91ac..1dbda7261f 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -590,6 +590,7 @@ sub fetch {
             next if $modname eq q{perl};
             next if $modname =~ m|^Alien|;
             next if $modname =~ m|^Win32|;
+	    next if $modname =~ m|^Dist::Zilla|;
             next if !($test && $top) && $modname =~ m|^Test|;
             next if Module::CoreList::is_core( $modname, undef, $] );
             # we could use the host Module::CoreList data, because host perl and
-- 
2.14.4
