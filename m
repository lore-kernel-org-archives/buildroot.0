From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:24:30 +0100
Subject: [Buildroot] [git commit] manual: clarify
	Tested-by/Reviewed-by/Acked-by tags
Message-ID: <20140302152442.0D0FA9936F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ebeecbd1c522fda612a1793e294231ec64b6933
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the manual with more clarified descriptions of tags
Tested-by, Reviewed-by, and Acked-by, as discussed on the Buildroot
developer days in February 2014.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |   45 ++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 5602335..4f44dcc 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -145,10 +145,47 @@ submissions.
 Some tags are used to help following the state of any patch posted on
 the mailing-list:
 
-Acked-by:: Indicates that the patch can be committed.
-
-Tested-by:: Indicates that the patch has been tested. It is useful
-  but not necessary to add a comment about what has been tested.
+Tested-by:: Indicates that the patch has been tested in one way or
+  another. You are encouraged to specify what kind of testing you
+  performed (compile-test on architecture X and Y, runtime test on
+  target A, ...). This additional information helps other testers and
+  the maintainer.
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
+familiar enough with the area touched to feel that the patch can be
+committed as-is (no additional changes required). In case it later turns
+out that something is wrong with the patch, your Acked-by could be
+considered inappropriate. The difference between Acked-by and
+Reviewed-by is thus mainly that you are prepared to take the blame on
+Acked patches, but not on Reviewed ones.
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
 
 Buildroot's Patchwork website can be used to pull in patches for testing
 purposes. Please see xref:apply-patches-patchwork[] for more
