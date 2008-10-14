From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 14 Oct 2008 09:20:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20081014162055.A36573C873@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2008-10-14 09:20:55 -0700 (Tue, 14 Oct 2008)
New Revision: 23678

Log:
- extend documentation to mention adding package/foo/Config.in to package/Config.in


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2008-10-14 15:16:20 UTC (rev 23677)
+++ trunk/buildroot/docs/buildroot.html	2008-10-14 16:20:55 UTC (rev 23678)
@@ -882,7 +882,19 @@
 
     <p>Of course, you can add other options to configure particular
     things in your software. </p>
-
+    <p>Finally you have to add your new <code>foo/Config.in</code> to
+    <code>package/Config.in</code>. The files included there are
+    <em>sorted alphabetically</em> per category and are <em>NOT<em>
+    supposed to contain anything but the <em>bare</em> name of the package.</p>
+<pre>
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/procps/Config.in"
+endif
+</pre>
+   <p><strong>Note:</strong><br>
+   Generally all packages should live <em>directly</em> in the
+   <code>package</code> directory to make it easier to find them.
+   </p>
    <h3>The real <i>Makefile</i></h3>
 
    <p>Finally, here's the hardest part. Create a file named
