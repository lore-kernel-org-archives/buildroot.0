From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:54:54 +0200
Subject: [Buildroot] [PATCH v3 3/4] docs/manual: update contribute.txt to
	cover get-developers
In-Reply-To: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1473713695-2611-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the contribute.txt part of the manual to tell
people to use get-developers to get the appropriate "git send-email"
command when sending patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 1b1f4de..2973ef7 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -283,10 +283,18 @@ automatically adding the +Signed-off-by+ line.
 Once patch files are generated, you can review/edit the commit message
 before submitting them, using your favorite text editor.
 
-Lastly, send/submit your patch set to the Buildroot mailing list:
+Buildroot provides a handy tool to know to whom your patches should be
+sent, called +get-developers+. This tool reads your patches and
+outputs the appropriate +git send-email+ command to use:
 
 ---------------------
-$ git send-email --to buildroot at buildroot.org outgoing/*
+$ ./support/scripts/get-developers outgoing/*
+---------------------
+
+Use the output of +get-developers+ to send your patches:
+
+---------------------
+$ git send-email --to buildroot at buildroot.org --to bob --to alice outgoing/*
 ---------------------
 
 Note that +git+ should be configured to use your mail account.
-- 
2.7.4
