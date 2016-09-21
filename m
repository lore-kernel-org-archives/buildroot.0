From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 09:06:08 +0200
Subject: [Buildroot] [git commit] docs/manual: update contribute.txt to
	cover get-developers
Message-ID: <20160921071839.D249D7FC9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6017cb8fbd6ea24911fe156c37366ca67278f77f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates the contribute.txt part of the manual to tell
people to use get-developers to get the appropriate "git send-email"
command when sending patches.

[Peter: use --cc instead of --to as suggested by Yann/Arnout]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 1b1f4de..d4ec2e1 100644
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
+$ git send-email --to buildroot at buildroot.org --cc bob --cc alice outgoing/*
 ---------------------
 
 Note that +git+ should be configured to use your mail account.
