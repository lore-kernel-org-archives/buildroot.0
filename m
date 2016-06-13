From: Viacheslav Volkov <sv99@inbox.ru>
Date: Mon, 13 Jun 2016 22:40:57 +0300
Subject: [Buildroot] [PATCH] scanpan: downgrade needed host perl version
Message-ID: <20160613194057.46504-1-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

support/scripts/scancpan - require host perl 5.022

on the Ubuntu 14.04 - perl version v5.18.2

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
---
 support/scripts/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 6c70cfb..fb445cf 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -471,7 +471,7 @@ unshift @INC, sub {
 } # END OF FATPACK CODE
 
 
-use 5.022;      # same major version as target perl
+use 5.018;      # same major version as target perl
 use strict;
 use warnings;
 use Fatal qw(open close);
-- 
2.8.3
