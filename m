From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 22:30:21 +0200
Subject: [Buildroot] [PATCH 1/3] legacy: increase the duration during whih
 we keep legacy symbols
In-Reply-To: <cover.1616963387.git.yann.morin.1998@free.fr>
References: <cover.1616963387.git.yann.morin.1998@free.fr>
Message-ID: <d41046d49bd9db1ccc30dea7d1f4d8c2310d3536.1616963387.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our LTS is only one-year long (actually, more like 13 mopnths), which
is still seen as too short by some, who do not have the bandwidth,
willingness, and/or capability to update once a year.

As such, the 2-year retention guarantee for the legacy symbols, is
often not enough, and people miss on them when eventually migrating.

Furthermore, the cuystoms so far has been to drop the symbols only after
a 5-year period has elapsed:
    f289b1b36f5c  legacy: drop options removed more than 5 years ago now
    a52e106bbd08  legacy: remove options made legacy 5 years ago
    a7f49a9693d7  Config.in.legacy: drop 2013.02 entries

So, make the customs the new rule: increase the retenetion period to 5
years.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8ebbc4c295..967b67e03e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -6,7 +6,7 @@
 # This will make the transition for the user more convenient.
 #
 # When adding legacy symbols to this file, add them to the front. The oldest
-# symbols will be removed again after about two years.
+# symbols will be removed again after at least five years.
 #
 # The symbol should be copied as-is from the place where it was previously
 # defined, but the help text should be removed or replaced with something that
-- 
2.25.1
