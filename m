From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:43:12 +0200
Subject: [Buildroot] [git commit] manual: add expected order of 'depends on'
Message-ID: <20181008154213.2E5998E423@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1759f0634a4148d2092a0afe2f6748f5ccc8c0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed in [1], our guideline for the ordering of 'depends on'
lines is not written down. Fix that.

[1] http://lists.busybox.net/pipermail/buildroot/2018-October/232413.html

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index f5e1e313d5..9f85ac63e6 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -46,9 +46,11 @@ is as follows:
 
 1. The type of option: +bool+, +string+... with the prompt
 2. If needed, the +default+ value(s)
-3. Any dependency of the +depends on+ form
-4. Any dependency of the +select+ form
-5. The help keyword and help text.
+3. Any dependencies on the target in +depends on+ form
+4. Any dependencies on the toolchain in +depends on+ form
+5. Any dependencies on other packages in +depends on+ form
+6. Any dependency of the +select+ form
+7. The help keyword and help text.
 
 You can add other sub-options into a +if BR2_PACKAGE_LIBFOO...endif+
 statement to configure particular things in your software. You can look at
