From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 01:09:40 +0200
Subject: [Buildroot] [git commit] dependencies.sh: suppress output of locale
Message-ID: <20120714231012.169CF90BCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99dd58418daee463074d7fd38d6ea98aca97d304
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c47ffcf..9f0f6a9 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -153,7 +153,7 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
        /bin/echo -e "\nYou need locale support on your build machine to build a toolchain supporting locales\n"
        exit 1 ;
    fi
-   if ! locale -a | grep -i utf8$ ; then
+   if ! locale -a | grep -q -i utf8$ ; then
        /bin/echo -e "\nYou need at least one UTF8 locale to build a toolchain supporting locales\n"
        exit 1 ;
    fi
