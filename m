From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 09:23:44 +0100
Subject: [Buildroot] [git commit] docs/manual: standardize a bit more the
 formatting of commit titles
Message-ID: <20190116083042.EA71E86485@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74fc5dce223a2688b22e33961ccc28b7b3c43468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, our commit titles are not very well standardized, and it
would be great to standardize them a little bit more. A number of
people use "<pkg>: " as prefix, others use "package/<pkg>: ". Some
people start the rest of the commit title (after the prefix) with an
upper-case letter, some with a lower-case letter.

In an attempt to standardize this, this commit updates the manual with
some examples of good commit titles.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Carlos Santos <casantos@datacom.com.br>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 60bfb961f0..5530ce1546 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -194,14 +194,29 @@ bisect+ to locate the origin of a problem.
 
 First of all, it is essential that the patch has a good commit
 message. The commit message should start with a separate line with a
-brief summary of the change, starting with the name of the affected
-package. The body of the commit message should describe _why_ this
+brief summary of the change, prefixed by the area touched by the
+patch. A few examples of good commit titles:
+
+* +package/linuxptp: bump version to 2.0+
+
+* +configs/imx23evk: bump Linux version to 4.19+
+
+* +package/pkg-generic: postpone evaluation of dependency conditions+
+
+* +boot/uboot: needs host-{flex,bison}+
+
+* +support/testing: add python-ubjson tests+
+
+The description that follows the prefix should start with a lower case
+letter (i.e "bump", "needs", "postpone", "add" in the above examples).
+
+Second, the body of the commit message should describe _why_ this
 change is needed, and if necessary also give details about _how_ it
 was done. When writing the commit message, think of how the reviewers
 will read it, but also think about how you will read it when you look
 at this change again a few years down the line.
 
-Second, the patch itself should do only one change, but do it
+Third, the patch itself should do only one change, but do it
 completely. Two unrelated or weakly related changes should usually be
 done in two separate patches. This usually means that a patch affects
 only a single package. If several changes are related, it is often
