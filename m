From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Tue,  8 Sep 2015 17:28:04 +0200
Subject: [Buildroot] [PATCH v2 1/1] docs/website: contribute.txt update with
	useful tips on patch versioning and patch submission
In-Reply-To: <1441718566-6551-1-git-send-email-francesco.nwokeka@gmail.com>
References: <1441718566-6551-1-git-send-email-francesco.nwokeka@gmail.com>
Message-ID: <1441726084-15422-1-git-send-email-francesco.nwokeka@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added an alternative on patch versioning (the -v option) and added a tip on how to automatically mark a previous commit as superseded

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>

---
v1 -> v2: adjusted previous patch with observations from mailing list

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
---
 docs/manual/contribute.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 40579f9..e8707cc 100644
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
@@ -306,6 +313,12 @@ the status of patches you submitted yourself, which means the email
 address you register in http://patchwork.buildroot.org[patchwork] should
 match the one you use for sending patches to the mailing list.
 
+You can also add the +--in-reply-to <message-id>+ flag when
+submitting a patch to the mailing list. The id of the mail
+to reply to can be found under the "Message Id" tag on the patchwork website.
+The advantage of *in-reply-to* is that patchwork will automatically mark the
+previous patch as superseded.
+
 [[reporting-bugs]]
 === Reporting issues/bugs or getting help
 
-- 
2.5.1
