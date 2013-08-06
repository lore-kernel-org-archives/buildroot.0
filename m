From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  6 Aug 2013 23:36:21 +0200
Subject: [Buildroot] [PATCH 2/5] manual: add patch revision and versioning
	section
In-Reply-To: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
References: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1375824984-8226-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vinicius Tinti <viniciustinti@gmail.com>

Improve the contribute manual section by adding an explanation about patch
review and version.

The section now provides advices in how to respond maintainers requests and how
to proceed on replying them.

[Samuel: minor rewordings + misc. formating fixes]
Signed-off-by: Vinicius Tinti <viniciustinti@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/contribute.txt | 66 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 0106df0..6d2cf5b 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -62,6 +62,72 @@ Make sure posted *patches are not line-wrapped*, otherwise they cannot
 easily be applied. In such a case, fix your e-mail client, or better,
 use +git send-email+ to send your patches.
 
+Patch revision
+~~~~~~~~~~~~~~
+
+Sometimes, changes will be requested to your patch before getting merged.
+Whenever it happens, the new revision of the pacthset should include a
+changelog of the modifications between each submission, and being reposted,
+as much as possible, as response to the original thread.
+
+Patch revision changelog
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+When editing your commit, below the +signed-off-by+ section, add +---+, then
+and your changelog below.
+
+Although the changelog will be visible for the reviewers in the mail
+thread, as well as in http://patchwork.buildroot.org[patchwork], +git+
+will automatically ignore lines below +---+ when the patch will be
+merged.
+
+For longer series, a per-patch changelog should be placed in each commit,
+and the cover letter must contain a summary of these changes.
+
+The following suggested layout example is not mandatory.
+
+---------------
+Patch title less than 80-character length
+
+Some paragraph describing what the patch does and why
+
+Signed-off-by John Doe <john.doe@noname.org>
+
+---
+Changes v2 -> v3:
+  - foo bar  (suggested by Jane)
+  - bar buz
+
+Changes v1 -> v2:
+  - alpha bravo  (suggested by John)
+  - charly delta
+---------------
+
+Any patch revision should include the version number. The version number
+is simply composed by the letter +v+ followed by an +integer+ greater or
+equal 2 (two) (i.e. "PATCH v2", "PATCH v3" ...).
+
+This can be easly handle in +git-format-patch+ command by using the option
++--subject-prefix+:
+
+---------------------
+ $ git format-patch --subject-prefix "PATCH v4" -M -n -s -o outgoing origin/master
+---------------------
+
+Keeping patch revision in the same thread
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Mail clients will handle this automatically reply in the same thread but
++git+ won't.
+
+Hence the +--in-reply-to+ option in +git-send-email+ must be used.
+Get the last +Message-ID+ (it can be found your mail client by accessing
+the raw mail). Then use this message id to send your revision patch:
+
+---------------------
+ $ git send-email --to buildroot at busybox.net --in-reply-to mymsgid at noname.org outgoing/*
+---------------------
+
 Reviewing/Testing patches
 -------------------------
 
-- 
1.8.3.4
