From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  7 Oct 2018 22:04:28 +0200
Subject: [Buildroot] [PATCH] manual: add expected order of 'depends on'
Message-ID: <20181007200428.30319-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed in [1], our guideline for the ordering of 'depends on'
lines is not written down. Fix that.

[1] http://lists.busybox.net/pipermail/buildroot/2018-October/232413.html

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
-- 
2.19.0
