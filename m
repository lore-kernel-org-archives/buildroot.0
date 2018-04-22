From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Apr 2018 11:07:52 +0200
Subject: [Buildroot] [PATCH 3/6 v2] download/git: ensure we checkout to a
 clean state
In-Reply-To: <cover.1524388060.git.yann.morin.1998@free.fr>
References: <cover.1524388060.git.yann.morin.1998@free.fr>
Message-ID: <73552fa4a7889918dbb404da99a2bbbdbdba5cf4.1524388060.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Force the checkout to ignore any local changes. This allows recovering
from a previous partial checkout (e.g. killed by the user, or by a CI
job...)

git checkout -f has been supported since the inception of git, so we can
use it without any second thought.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index ebd04bc7b3..d97d07c51f 100755
--- a/support/download/git
+++ b/support/download/git
@@ -125,7 +125,7 @@ fi
 
 # Checkout the required changeset, so that we can update the required
 # submodules.
-_git checkout -q "'${cset}'"
+_git checkout -f -q "'${cset}'"
 
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
-- 
2.14.1
