From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Mar 2009 10:09:45 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20090302100945.6A6897656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-02 10:09:44 +0000 (Mon, 02 Mar 2009)
New Revision: 25481

Log:
docs/buildroot: use DESTDIR / install-strip for target install example

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-03-02 09:32:46 UTC (rev 25480)
+++ trunk/buildroot/docs/buildroot.html	2009-03-02 10:09:44 UTC (rev 25481)
@@ -1014,7 +1014,7 @@
     <a name="ex2line34" id="ex2line34">34</a>          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
     <a name="ex2line35" id="ex2line35">35</a>
     <a name="ex2line36" id="ex2line36">36</a>  $(TARGET_DIR)/$(FOO_TARGET_BINARY): $(FOO_DIR)/$(FOO_BINARY)
-    <a name="ex2line37" id="ex2line37">37</a>          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) install
+    <a name="ex2line37" id="ex2line37">37</a>          $(MAKE) DESTDIR=$(TARGET_DIR) -C $(FOO_DIR) install-strip
     <a name="ex2line38" id="ex2line38">38</a>          rm -Rf $(TARGET_DIR)/usr/man
     <a name="ex2line39" id="ex2line39">39</a>
     <a name="ex2line40" id="ex2line40">40</a>  foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)
@@ -1111,8 +1111,8 @@
     <p>Lines <a href="#ex2line36">36-38</a> defines a target and associated rules
     that install the software inside the target filesystem. It depends on the
     binary file in the source directory, to make sure the software has
-    been compiled. It uses the <code>install</code> target of the
-    software <code>Makefile</code> by passing a <code>prefix</code>
+    been compiled. It uses the <code>install-strip</code> target of the
+    software <code>Makefile</code> by passing a <code>DESTDIR</code>
     argument, so that the <code>Makefile</code> doesn't try to install
     the software inside host <code>/usr</code> but inside target
     <code>/usr</code>. After the installation, the
