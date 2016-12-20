From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:20 +0100
Subject: [Buildroot] [PATCH v5 03/19] core: do not reset
	DEPENDENCIES_HOST_PREREQ in dependencies.mk
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-4-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usually, Buildroot does never initialize variables with empty content.
DEPENDENCIES_HOST_PREREQ was an unjustified exception.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

Notes:
    v3:
      - New patch

 support/dependencies/dependencies.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4334dac..d4b0409 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -5,8 +5,6 @@
 #
 ################################################################################
 
-DEPENDENCIES_HOST_PREREQ :=
-
 # suitable-host-pkg: calls check-host-$(1).sh shell script. Parameter (2)
 # can be the candidate to be checked. If not present, the check-host-$(1).sh
 # script should use 'which' to find a candidate. The script should return
-- 
1.9.1
