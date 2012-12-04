From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 10:28:31 -0800
Subject: [Buildroot] [git commit] dependencies.sh: check for java tools if
	classpath is enabled
Message-ID: <20121204190928.84A4F99716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4be86184e032652863ea826edb9018f5f9b64b7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9f0f6a9..1b79b23 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -158,3 +158,11 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
        exit 1 ;
    fi
 fi
+if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
+    for prog in java javac jar; do
+	if ! which $prog > /dev/null ; then
+	    /bin/echo -e "\nYou must install '$prog' on your build machine\n" >&2
+	    exit 1
+	fi
+    done
+fi
