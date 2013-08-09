From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  9 Aug 2013 12:16:46 +0200
Subject: [Buildroot] [PATCH v3 1/3] manual: contribute.txt: add patch
	revision section
In-Reply-To: <1376043408-9367-1-git-send-email-s.martin49@gmail.com>
References: <1376043408-9367-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1376043408-9367-2-git-send-email-s.martin49@gmail.com>
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

Signed-off-by: Vinicius Tinti <viniciustinti@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2 -> v3:
(fixes and rewordings suggested or spotted by Thomas P. and Thomas De S.)
- add "Cover letter" section
- reword "Patch revision changelog" section
- remove "Keeping patch revision in the same thread" section
- update commit message

changes v1 -> v2:
- minor rewordings + misc. formating fixes
---
 docs/manual/contribute.txt | 70 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 0106df0..9f3b641 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -42,10 +42,6 @@ To generate it, run:
 This will generate patch files in the +outgoing+ subdirectory,
 automatically adding the +signed-off-by+ line.
 
-If you want to present the whole patch set in a separate mail, add
-+--cover-letter+ to the previous command line (+man git-format-patch+
-for further information).
-
 Once patch files are generated, you can review/edit the commit message
 before submitting them using your favorite text editor.
 
@@ -62,6 +58,72 @@ Make sure posted *patches are not line-wrapped*, otherwise they cannot
 easily be applied. In such a case, fix your e-mail client, or better,
 use +git send-email+ to send your patches.
 
+Cover letter
+~~~~~~~~~~~~
+
+If you want to present the whole patch set in a separate mail, add
++--cover-letter+ to the +git format-patch+ command
+(see +man git-format-patch+ for further information).
+
+A 'cover letter' may be useful to introduce the changes you propose
+in the following cases:
+
+* large number of commits in the series;
+
+* deep impact of the changes in the rest of the project;
+
+* RFC footnote:[RFC: (Request for comments) change proposal];
+
+* whenever you feel it will help presenting your work, your choices,
+  the review process, etc.
+
+Patch revision changelog
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+When improvements are requested, the new revision of the each commit
+should include a changelog of the modifications between each submission.
+
+This changelog is added when editing the commit message.
+Below the +Signed-off-by+ section, add +---+ and your changelog.
+
+Although the changelog will be visible for the reviewers in the mail
+thread, as well as in http://patchwork.buildroot.org[patchwork], +git+
+will automatically ignores lines below +---+ when the patch will be
+merged.
+
+Hereafter the recommended layout:
+
+---------------
+Patch title less than 80-character length
+
+Some more paragraph giving some more details.
+
+And yet another paragraph giving more details.
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
+is simply composed of the letter +v+ followed by an +integer+ greater or
+equal to two (i.e. "PATCH v2", "PATCH v3" ...).
+
+This can be easily handled with +git format-patch+ by using the option
++--subject-prefix+:
+
+---------------------
+$ git format-patch --subject-prefix "PATCH v4" \
+    -M -o outgoing origin/master
+---------------------
+
 Reviewing/Testing patches
 -------------------------
 
-- 
1.8.3.4
