From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:57:15 +0200
Subject: [Buildroot] [git commit] docs/manual: add useful tips on patch
	versioning and patch submission
Message-ID: <20150919135725.229EF81842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59fa7b7f7c78dd3733abe010ba2c34d107245c56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added an alternative on patch versioning (the -v option) and added a
tip on how to automatically mark a previous commit as superseded.

[Thomas: minor tweaks.]

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 4d7a833..b74897d 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -298,6 +298,13 @@ $ git format-patch --subject-prefix "PATCH v4" \
     -M -s -o outgoing origin/master
 ---------------------
 
+Since git version 1.8.1, you can also use +-v <n>+ (where <n> is the
+version number):
+
+---------------------
+$ git format-patch -v4 -M -s -o outgoing origin/master
+---------------------
+
 When you provide a new version of a patch, please mark the old one as
 superseded in http://patchwork.buildroot.org[patchwork]. You need to
 create an account on http://patchwork.buildroot.org[patchwork] to be
@@ -306,6 +313,13 @@ the status of patches you submitted yourself, which means the email
 address you register in http://patchwork.buildroot.org[patchwork] should
 match the one you use for sending patches to the mailing list.
 
+You can also add the +--in-reply-to <message-id>+ option when
+submitting a patch to the mailing list. The id of the mail to reply to
+can be found under the "Message Id" tag on
+http://patchwork.buildroot.org[patchwork].  The advantage of
+*in-reply-to* is that patchwork will automatically mark the previous
+version of the patch as superseded.
+
 [[reporting-bugs]]
 === Reporting issues/bugs or getting help
 
