From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 00:02:11 +0200
Subject: [Buildroot] [git commit] scancpan: skip Dist::Zilla
Message-ID: <20180920220203.054B08881D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9963cd2b51f2f5d64c576ad2f2188a644627be3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index 3b77b21330..ee547c3e7b 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -601,6 +601,7 @@ sub fetch {
             # we could use the host Module::CoreList data, because host perl and
             # target perl have the same major version
             next if ${$dep}{phase} eq q{develop};
+            next if ${$dep}{phase} eq q{x_Dist_Zilla};
             next if !($test && $top) && ${$dep}{phase} eq q{test};
             my $distname = $mcpan->module( $modname )->{distribution};
             if (${$dep}{phase} eq q{runtime}) {
