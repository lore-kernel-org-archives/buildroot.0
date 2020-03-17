From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Mar 2020 14:58:33 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] Makefile: correct make
 4.3+ workaround for 2019.02.x
Message-ID: <20200317134820.DD3A58216C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ad1dee15ae33c9785eb414b3fcc5b098fdf68c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Commit bdb4a9e110b67ebe3336a (Makefile: work around a bug in newly released
make 4.3) backported a fix from master, but it doesn't work on 2019.02.x as
the br2-external file is called .br-external.mk, not .br2-external.mk.

Adjust the workaround to match.

Reported-by: Mircea GLIGA <mgliga@bitdefender.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 337ac016d7..1f6c2a6dd6 100644
--- a/Makefile
+++ b/Makefile
@@ -190,7 +190,7 @@ $(error $(BR2_EXTERNAL_ERROR))
 endif
 
 # Workaround bug in make-4.3: https://savannah.gnu.org/bugs/?57676
-$(BASE_DIR)/.br2-external.mk:;
+$(BASE_DIR)/.br-external.mk:;
 
 # To make sure that the environment variable overrides the .config option,
 # set this before including .config.
