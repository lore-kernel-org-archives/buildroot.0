From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 06 Mar 2014 11:07:30 +0100
Subject: [Buildroot] [PATCH 2 of 7] manual: contributing: move section on
 patch reviews up and change intro
In-Reply-To: <patchbomb.1394100448@argentina>
References: <patchbomb.1394100448@argentina>
Message-ID: <be3e92ee4f9fed1805bb.1394100450@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch moves the section about patch reviews and the
Tested-by/Reviewed-by/Acked-by tags upwards. Additionally, the first
paragraph is removed and replaced by another one. There are no other changes
in the text.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
v2: fix indentation of Acked-by paragraph (Samuel), some rephrasing (Arnout)

 docs/manual/contribute.txt |  127 ++++++++++++++++++++--------------------
 1 files changed, 65 insertions(+), 62 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -79,6 +79,74 @@ basically two things that can be done:
 Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
 ---------------------
 
+Reviewing and testing patches
+-----------------------------
+
+With the amount of patches sent to the mailing list each day, the
+maintainer has a very hard job to judge which patches are ready to apply
+and which ones aren't. Contributors can greatly help here by reviewing
+and testing these patches.
+
+In the review process, do not hesitate to respond to patch submissions
+for remarks, suggestions or anything that will help everyone to
+understand the patches and make them better. Please use internet
+style replies in plain text emails when responding to patch
+submissions.
+
+To indicate approval of a patch, there are three formal tags that keep
+track of this approval. To add your tag to a patch, reply to it with the
+approval tag below the original author's Signed-off-by line. These tags
+will be picked up automatically by patchwork (see
+ref:apply-patches-patchwork[]) and will be part of the commit log when
+the patch is accepted.
+
+Tested-by:: Indicates that the patch has been tested successfully.
+  You are encouraged to specify what kind of testing you performed
+  (compile-test on architecture X and Y, runtime test on target A,
+  ...). This additional information helps other testers and the
+  maintainer.
+
+Reviewed-by:: Indicates that you code-reviewed the patch and did your
+  best in spotting problems, but you are not sufficiently familiar with
+  the area touched to provide an Acked-by tag. This means that there
+  may be remaining problems in the patch that would be spotted by
+  someone with more experience in that area. Should such problems be
+  detected, your Reviewed-by tag remains appropriate and you cannot
+  be blamed.
+
+Acked-by:: Indicates that you code-reviewed the patch and you are
+  familiar enough with the area touched to feel that the patch can be
+  committed as-is (no additional changes required). In case it later
+  turns out that something is wrong with the patch, your Acked-by could
+  be considered inappropriate. The difference between Acked-by and
+  Reviewed-by is thus mainly that you are prepared to take the blame on
+  Acked patches, but not on Reviewed ones.
+
+If you reviewed a patch and have comments on it, you should simply reply
+to the patch stating these comments, without providing a Reviewed-by or
+Acked-by tag. These tags should only be provided if you judge the patch
+to be good as it is.
+
+It is important to note that neither Reviewed-by nor Acked-by imply
+that testing has been performed. To indicate that you both reviewed and
+tested the patch, provide two separate tags (Reviewed/Acked-by and
+Tested-by).
+
+Note also that _any developer_ can provide Tested/Reviewed/Acked-by
+tags, without exception, and we encourage everyone to do this. Buildroot
+does not have a defined group of _core_ developers, it just so happens
+that some developers are more active than others. The maintainer will
+value tags according to the track record of their submitter. Tags
+provided by a regular contributor will naturally be trusted more than
+tags provided by a newcomer. As you provide tags more regularly, your
+'trustworthiness' (in the eyes of the maintainer) will go up, but _any_
+tag provided is valuable.
+
+Buildroot's Patchwork website can be used to pull in patches for testing
+purposes. Please see xref:apply-patches-patchwork[] for more
+information on using Buildroot's Patchwork website to apply patches.
+
+
 [[submitting-patches]]
 Submitting patches
 ------------------
@@ -194,68 +262,6 @@ This can be easily handled with +git for
     -M -o outgoing origin/master
 ---------------------
 
-Reviewing/Testing patches
--------------------------
-
-The review process for new patches is done over the mailing list. Once
-a patch is submitted to the mailing list, other developers will provide
-feedback to the patch via emails sent through the mailing list.
-
-In the review process, do not hesitate to respond to patch submissions
-for remarks, suggestions or anything that will help everyone to
-understand the patches and make them better. Please use internet
-style replies in plain text emails when responding to patch
-submissions.
-
-Some tags are used to help following the state of any patch posted on
-the mailing-list:
-
-Tested-by:: Indicates that the patch has been tested in one way or
-  another. You are encouraged to specify what kind of testing you
-  performed (compile-test on architecture X and Y, runtime test on
-  target A, ...). This additional information helps other testers and
-  the maintainer.
-
-Reviewed-by:: Indicates that you code-reviewed the patch and did your
-  best in spotting problems, but you are not sufficiently familiar with
-  the area touched to provide an Acked-by tag. This means that there
-  may be remaining problems in the patch that would be spotted by
-  someone with more experience in that area. Should such problems be
-  detected, your Reviewed-by tag remains appropriate and you cannot
-  be blamed.
-
-Acked-by:: Indicates that you code-reviewed the patch and you are
-familiar enough with the area touched to feel that the patch can be
-committed as-is (no additional changes required). In case it later turns
-out that something is wrong with the patch, your Acked-by could be
-considered inappropriate. The difference between Acked-by and
-Reviewed-by is thus mainly that you are prepared to take the blame on
-Acked patches, but not on Reviewed ones.
-
-If you reviewed a patch and have comments on it, you should simply reply
-to the patch stating these comments, without providing a Reviewed-by or
-Acked-by tag. These tags should only be provided if you judge the patch
-to be good as it is.
-
-It is important to note that neither Reviewed-by nor Acked-by imply
-that testing has been performed. To indicate that you both reviewed and
-tested the patch, provide two separate tags (Reviewed/Acked-by and
-Tested-by).
-
-Note also that _any developer_ can provide Tested/Reviewed/Acked-by
-tags, without exception, and we encourage everyone to do this. Buildroot
-does not have a defined group of _core_ developers, it just so happens
-that some developers are more active than others. The maintainer will
-value tags according to the track record of their submitter. Tags
-provided by a regular contributor will naturally be trusted more than
-tags provided by a newcomer. As you provide tags more regularly, your
-'trustworthiness' (in the eyes of the maintainer) will go up, but _any_
-tag provided is valuable.
-
-Buildroot's Patchwork website can be used to pull in patches for testing
-purposes. Please see xref:apply-patches-patchwork[] for more
-information on using Buildroot's Patchwork website to apply patches.
-
 [[reporting-bugs]]
 Reporting issues/bugs, get help
 -------------------------------
