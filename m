From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 23:03:28 +0200
Subject: [Buildroot] [PATCH v2] dependencies.sh: suppress output of locale
In-Reply-To: <20120711111748.1fbc0b54@skate>
References: <20120711111748.1fbc0b54@skate>
Message-ID: <1342299808-850-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: Use grep -q as suggested by ThomasP
 support/dependencies/dependencies.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
tg: (b8b57bb..) t/dependencies-dont-print-locale (depends on: master)
