From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Dec 2010 16:06:08 -0300
Subject: [Buildroot] [PATCH 12/13] uclibc: fix program invocation name
	config option for the snapshot version
In-Reply-To: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292353569-30172-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We didn't have UCLIBC_HAS___PROGNAME in the sample config so when
program invocation name was enabled we got a stalling point.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/uClibc-snapshot.config |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index e5d2bea..9d6acc4 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -111,6 +111,7 @@ UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+# UCLIBC_HAS___PROGNAME is not set
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
-- 
1.7.2.2
