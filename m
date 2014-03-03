From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 03 Mar 2014 11:41:49 +0100
Subject: [Buildroot] [PATCH 4/4] website: new website !
In-Reply-To: <1393784504-11327-5-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393784504-11327-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1393784504-11327-5-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <a0e90776-1f6d-4f58-b932-c89de0730566@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian <maxime.hadjinlian@gmail.com> schreef:
>A new menu and logo for the website, also some of the contents has been
>reworked.
>
>This patch also removes files that are no longer used, like the old
>stylesheet and a few pages. The content of theses pages has mostly been
>merged in other pages or was redudant with the manual.
>
>Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>---
> docs/about.html      |  11 +----
> docs/contribute.html |  39 ++++++++++++++++++
> docs/developer.html  |  47 ---------------------
> docs/docs.html       |   4 +-
> docs/download.html   |  46 ++++++++++++++++++---
> docs/footer.html     |  24 +++--------
> docs/header.html     | 104 ++++++++++++++++++++---------------------------
> docs/images/logo.png | Bin 129459 -> 117499 bytes
> docs/index.html      |  34 +++++++++++++++-
> docs/lists.html      |  40 ------------------
> docs/news.html       | 113 ++++++++++++++++++++++++++-------------------------
> docs/sponsors.html   |   2 +-
> docs/stylesheet.css  |  75 ----------------------------------
> docs/support.html    |  45 ++++++++++++++++++++
> 14 files changed, 268 insertions(+), 316 deletions(-)
> create mode 100644 docs/contribute.html
> delete mode 100644 docs/developer.html
> delete mode 100644 docs/lists.html
> delete mode 100644 docs/stylesheet.css
> create mode 100644 docs/support.html
>
>diff --git a/docs/about.html b/docs/about.html
>index ae409fc..c2e963a 100644
>--- a/docs/about.html
>+++ b/docs/about.html
>@@ -1,15 +1,7 @@
> <!--#include file="header.html" -->
> 
>-
>-<!-- Begin Introduction section -->
>-
>-<h3>Buildroot: making Embedded Linux easy</h3>
>-
> <div align="center">
>-<a href="images/menuconfig.png">
>- <img src="images/menuconfig_small.png" width="340" height="220"
>- alt="Buildroot menuconfig" border="0">
>-</a>
>+  <img src="images/menuconfig.png" width="340" height="220" alt="Buildroot menuconfig" border="0">
> </div>
> 
> <p>Buildroot is a set of Makefiles and patches that makes it easy to
>@@ -60,5 +52,4 @@ cross-compilation process.</p>
> GENERAL PUBLIC LICENSE V2 (Or later)</a>. Stable releases are
> delivered every three months.</p>
> 
>-
> <!--#include file="footer.html" -->
>diff --git a/docs/contribute.html b/docs/contribute.html
>new file mode 100644
>index 0000000..d7f5dfc
>--- /dev/null
>+++ b/docs/contribute.html
>@@ -0,0 +1,39 @@
>+<!--#include file="header.html" -->
>+
>+<h2>Contribute</h2>
>+
>+Buildroot is an open source project and if you want to contribute, here a few
>+pointers to get you started.
>+
>+<p>Don't forget to look at <a href="./support.html">Support</a> if you need any
>+help.
>+And thanks for your help !</p>
>+
>+<h3>Autobuilder</h3>
>+
>+The <a href="http://autobuild.buildroot.org/">Autobuilder</a> are used to test

This should be Autobuilders (plural)

>+Buildroot with a lot of differents settings (toolchains, various packages, etc)

different

>+on all the supported platforms.
>+
>+<p>But despite our best effort sometimes, it fails..</p>

The comma should be moved to before sometimes.


>+<p>That's where you can help ! Look at a package that fails and try to fix it !</p>
>+
>+<h3>Wiki</h3>
>+
>+Have a look at the <a href="http://elinux.org/Buildroot">eLinux Wiki</a> a todo
>+list is available there, which can help you find out what you could do to help
>+Buildroot.
>+
>+<h3>Patchwork</h3>
>+
>+The <a href="http://patchwork.ozlabs.org/project/buildroot/list/">Patchwork</a>

'the' should be removed.

>+is a patch tracking system, if you submit a patch, they will appear here.

It will

>+
>+<p>You can have a look at a patch that interest
 you and test it on your machine,

interests

>+if it succeed, you can send a <a

Succeeds

>+  href="http://buildroot.org/downloads/manual/manual.html#_reviewing_testing_patches">"Tested-by"</a>,
>+if it fails, you can also send a mail on the <a
>+  href="http://buildroot.org/downloads/manual/manual.html#_mailing_list">mailing
>+  list</a> and report what has happened to you.</p>
>+

Note that I'm preparing a patch to the documentation that also describes the different things people can contribute to...


>+<!--#include file="footer.html" -->
>diff --git a/docs/developer.html b/docs/developer.html
>deleted file mode 100644
>index ee83324..0000000
>--- a/docs/developer.html
>+++ /dev/null
>@@ -1,47 +0,0 @@
>-<!--#include file="header.html" -->
>-
>-
>-<h3>Developer Access</h3>
>-
>-Because we use Git for version control, you don't need developer (ssh)
>-access on uclibc.org to contribute to Buildroot, but you can request
>-it if needed.
>-
>-<p>
>-
>-To obtain developer access, you will need to demonstrate you are
>-serious by submitting a few good patches first.  Then, you will need
>-to select a username to use when logging in, you will need to send me
>-the username you have selected, you must send me your preferred
>-contact email address, and finally, you must send me an ssh version 2
>-DSA key with 1024 bits (the default) or more.  If you do not currently
>-have an ssh version 2 DSA key, you can generate a key using the
>-command<pre>ssh-keygen -t dsa</pre> This will create the
>-files <pre>/home/&lt;USERNAME&gt;/ssh/id_dsa
>-/home/&lt;USERNAME&gt;/.ssh/id_dsa.pub</pre> It is recommended that
>-you generate a key with a "passphrase" for security reasons.
>-
>-<p>
>-Make the file known to the system by running
>-
>-<pre>ssh-add ~/.ssh/id_dsa</pre>
>-
>-You must then send the content of 'id_dsa.pub' to me so I can setup your account.
>-The content of 'id_dsa' should of course be kept secret.
>-
>-<p>
>-
>-Once you have an account, you can use it to store Git
>-repositories. Simply put them in subdirectories of your ~/git, and
>-touch ~/git/<repo>/git-daemon-export-ok, after which the hourly
>-cronjob will pick them up and show them in cgit. They are also
>-available though git-daemon:
>-
>-<pre>git clone git://git.buildroot.net/~&lt;USERNAME&gt/git/&lt;REPO&gt;</pre>
>-
>-For additional detail on how to use Git, please visit the
>-<a href="http://git-scm.org/">the Git website</a>.
>-
>-<!--#include file="footer.html" -->
>-
>-
>diff --git a/docs/docs.html b/docs/docs.html
>index bd8753c..1e24553 100644
>--- a/docs/docs.html
>+++ b/docs/docs.html
>@@ -1,6 +1,6 @@
> <!--#include file="header.html" -->
> 
>-<h3>Documentation</h3>
>+<h2>Documentation</h2>
> 
> <p>The Buildroot user manual is where you want to start reading if you
> wish to understand how Buildroot works, or wish to change/extend/fix
>@@ -28,7 +28,7 @@ help:</p>
> 
> <ul>
> 
>-  <li>On the <a href="lists.html">buildroot mailing list</a>
>+  <li>On the <a href="support.html">buildroot mailing list</a>
>   at <code>buildroot at uclibc.org</code></li>
> 
>   <li>On the <a href="irc://freenode.net/#buildroot">Buildroot IRC
>diff --git a/docs/download.html b/docs/download.html
>index bae86df..a259a6e 100644
>--- a/docs/download.html
>+++ b/docs/download.html
>@@ -1,8 +1,6 @@
> <!--#include file="header.html" -->
> 
>-
>-
>-<h3>Download</h3>
>+<h2>Download</h2>
> 
> <p>
> 
>@@ -43,8 +41,46 @@ follow development, but cannot or do not wish to use Git.
> 	<li> Click here to <a href="http://git.buildroot.net/buildroot">browse the source tree</a>.
> 	</li>
> 
>-	<li>Anonymous <a href="git.html">Git access</a> is available.
>-	</li>
> </ul>
> 
>+
>+<h2>Repository</h2>
>+
>+The buildroot repository can be browsed online through cgit at
>+<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
>+To grab a copy of the repository use
>+
>+<pre>
>+git clone git://git.buildroot.net/buildroot</pre>
>+
>+Or if you're behind a firewall blocking git:
>+
>+<pre>
>+git clone http://git.buildroot.net/git/buildroot.git</pre>
>+
>+<p>
>+
>+Please use the native git protocol if at all possible, as it's a lot
>+more efficient than HTTP.
>+
>+<p>
>+
>+If you are not already familiar with using Git, we recommend you visit <a
>+href="http://git-scm.org">the Git website</a>.
>+
>+<p>
>+
>+Once you've checked out a copy of the source tree, you can update your source
>+tree at any time so it is in sync with the latest and greatest by entering your
>+buildroot directory and running the command:
>+
>+<pre>
>+git pull
>+</pre>
>+
>+Because you've only been granted anonymous access to the tree, you won't be
>+able to push your changes to the repo. Changes can instead be submitted for
>+inclusion by posting them to the buildroot mailing list or to the <a
>+href="https://bugs.uclibc.org/">Bug and Patch Tracking System</a>.

I would remove the suggestion to send patches to the bug tracker...

>+
> <!--#include file="footer.html" -->
>diff --git a/docs/footer.html b/docs/footer.html
>index d3b239b..0a555cc 100644
>--- a/docs/footer.html
>+++ b/docs/footer.html
>@@ -1,21 +1,7 @@
>-<!-- Footer -->
>-
>-
>-    </td>
>-    </tr>
>-    </table>
>-
>-<hr />
>-
>-    <p>
>-    <font face="arial, helvetica, sans-serif" size="-1">
>-	<a HREF="/copyright.txt">Copyright &copy; 1999-2005 Erik Andersen,
>-	2006-2014 The Buildroot developers</a>
>-	<br>
>-	Mail all comments, insults, suggestions and bribes to
>-	<br>
>-	The Buildroot developers <A HREF="mailto:buildroot@buildroot.org">buildroot at buildroot.org</A><BR>
>-    </font>
>-
>+    </div> <!-- /container -->
>+    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
>+    <script type="text/javascript" src="js/bootstrap.min.js"></script>
>+    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
>+    <script type="text/javascript" src="js/buildroot.js"></script>
>   </body>
> </html>
>diff --git a/docs/header.html b/docs/header.html
>index 625c079..f64869f 100644
>--- a/docs/header.html
>+++ b/docs/header.html
>@@ -1,67 +1,51 @@
>-<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
>-"http://www.w3.org/TR/REC-html40/loose.dtd">
>-
>-<html>
>+<!DOCTYPE html>
>+<html lang="en">
>   <head>
>-    <title>Buildroot</title>
>+    <meta charset="utf-8">
>+    <title>Buildroot: making embedded Linux easy</title>

We should add 'since 2002' here, or whatever the start year was ;-)

Best regards,
Thomas
