From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 02:57:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070119105705.318784859C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 02:57:03 -0800 (Fri, 19 Jan 2007)
New Revision: 17375

Log:
- add some anchors to the sample makefile to make ease navigation


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 09:47:29 UTC (rev 17374)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 10:57:03 UTC (rev 17375)
@@ -449,64 +449,64 @@
    afterwards.</p>
 
 <pre>
-     1  #############################################################
-     2  #
-     3  # foo
-     4  #
-     5  #############################################################
-     6  FOO_VERSION:=1.0
-     7  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
-     8  FOO_SITE:=http://www.foosoftware.org/downloads
-     9  FOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
-    10  FOO_BINARY:=foo
-    11  FOO_TARGET_BINARY:=usr/bin/foo
-    12
-    13  $(DL_DIR)/$(FOO_SOURCE):
-    14          $(WGET) -P $(DL_DIR) $(FOO_SITE)/$(FOO_SOURCE)
-    15
-    16  $(FOO_DIR)/.source: $(DL_DIR)/$(FOO_SOURCE)
-    17          $(ZCAT) $(DL_DIR)/$(FOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-    18          touch $@
-    19
-    20  $(FOO_DIR)/.configured: $(FOO_DIR)/.source
-    21          (cd $(FOO_DIR); rm -rf config.cache ; \
-    22                  $(TARGET_CONFIGURE_OPTS) \
-    23                  CFLAGS="$(TARGET_CFLAGS)" \
-    24                  ./configure \
-    25                  --target=$(GNU_TARGET_NAME) \
-    26                  --host=$(GNU_TARGET_NAME) \
-    27                  --build=$(GNU_HOST_NAME) \
-    28                  --prefix=/usr \
-    29                  --sysconfdir=/etc \
-    30          );
-    31          touch $@
-    32
-    33  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
-    34          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
-    35
-    36  $(TARGET_DIR)/$(FOO_TARGET_BINARY): $(FOO_DIR)/$(FOO_BINARY)
-    37          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) install
-    38          rm -Rf $(TARGET_DIR)/usr/man
-    39
-    40  foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)
-    41
-    42  foo-source: $(DL_DIR)/$(FOO_SOURCE)
-    43
-    44  foo-clean:
-    45          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) uninstall
-    46          -$(MAKE) -C $(FOO_DIR) clean
-    47
-    48  foo-dirclean:
-    49          rm -rf $(FOO_DIR)
-    50
-    51 #############################################################
-    52 #
-    53 # Toplevel Makefile options
-    54 #
-    55 #############################################################
-    56 ifeq ($(strip $(BR2_PACKAGE_FOO)),y)
-    57 TARGETS+=foo
-    58 endif
+     <a name="line1" id="line1">1</a>  #############################################################
+     <a name="line2" id="line2">2</a>  #
+     <a name="line3" id="line3">3</a>  # foo
+     <a name="line4" id="line4">4</a>  #
+     <a name="line5" id="line5">5</a>  #############################################################
+     <a name="line6" id="line6">6</a>  FOO_VERSION:=1.0
+     <a name="line7" id="line7">7</a>  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
+     <a name="line8" id="line8">8</a>  FOO_SITE:=http://www.foosoftware.org/downloads
+     <a name="line9" id="line9">9</a>  FOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
+    <a name="line10" id="line10">10</a>  FOO_BINARY:=foo
+    <a name="line11" id="line11">11</a>  FOO_TARGET_BINARY:=usr/bin/foo
+    <a name="line12" id="line12">12</a>
+    <a name="line13" id="line13">13</a>  $(DL_DIR)/$(FOO_SOURCE):
+    <a name="line14" id="line14">14</a>          $(WGET) -P $(DL_DIR) $(FOO_SITE)/$(FOO_SOURCE)
+    <a name="line15" id="line15">15</a>
+    <a name="line16" id="line16">16</a>  $(FOO_DIR)/.source: $(DL_DIR)/$(FOO_SOURCE)
+    <a name="line17" id="line17">17</a>          $(ZCAT) $(DL_DIR)/$(FOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+    <a name="line18" id="line18">18</a>          touch $@
+    <a name="line19" id="line19">19</a>
+    <a name="line20" id="line20">20</a>  $(FOO_DIR)/.configured: $(FOO_DIR)/.source
+    <a name="line21" id="line21">21</a>          (cd $(FOO_DIR); rm -rf config.cache ; \
+    <a name="line22" id="line22">22</a>                  $(TARGET_CONFIGURE_OPTS) \
+    <a name="line23" id="line23">23</a>                  CFLAGS="$(TARGET_CFLAGS)" \
+    <a name="line24" id="line24">24</a>                  ./configure \
+    <a name="line25" id="line25">25</a>                  --target=$(GNU_TARGET_NAME) \
+    <a name="line26" id="line26">26</a>                  --host=$(GNU_TARGET_NAME) \
+    <a name="line27" id="line27">27</a>                  --build=$(GNU_HOST_NAME) \
+    <a name="line28" id="line28">28</a>                  --prefix=/usr \
+    <a name="line29" id="line29">29</a>                  --sysconfdir=/etc \
+    <a name="line30" id="line30">30</a>          );
+    <a name="line31" id="line31">31</a>          touch $@
+    <a name="line32" id="line32">32</a>
+    <a name="line33" id="line33">33</a>  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
+    <a name="line34" id="line34">34</a>          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
+    <a name="line35" id="line35">35</a>
+    <a name="line36" id="line36">36</a>  $(TARGET_DIR)/$(FOO_TARGET_BINARY): $(FOO_DIR)/$(FOO_BINARY)
+    <a name="line37" id="line37">37</a>          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) install
+    <a name="line38" id="line38">38</a>          rm -Rf $(TARGET_DIR)/usr/man
+    <a name="line39" id="line39">39</a>
+    <a name="line40" id="line40">40</a>  foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)
+    <a name="line41" id="line41">41</a>
+    <a name="line42" id="line42">42</a>  foo-source: $(DL_DIR)/$(FOO_SOURCE)
+    <a name="line43" id="line43">43</a>
+    <a name="line44" id="line44">44</a>  foo-clean:
+    <a name="line45" id="line45">45</a>          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) uninstall
+    <a name="line46" id="line46">46</a>          -$(MAKE) -C $(FOO_DIR) clean
+    <a name="line47" id="line47">47</a>
+    <a name="line48" id="line48">48</a>  foo-dirclean:
+    <a name="line49" id="line49">49</a>          rm -rf $(FOO_DIR)
+    <a name="line50" id="line50">50</a>
+    <a name="line51" id="line51">51</a> #############################################################
+    <a name="line52" id="line52">52</a> #
+    <a name="line53" id="line53">53</a> # Toplevel Makefile options
+    <a name="line54" id="line54">54</a> #
+    <a name="line55" id="line55">55</a> #############################################################
+    <a name="line56" id="line56">56</a> ifeq ($(strip $(BR2_PACKAGE_FOO)),y)
+    <a name="line57" id="line57">57</a> TARGETS+=foo
+    <a name="line58" id="line58">58</a> endif
 
 </pre>
 
@@ -516,7 +516,7 @@
     the other <code>*.mk</code> files in the <code>package</code>
     directory.</p>
 
-    <p>At lines 6-11, a couple of useful variables are defined :</p>
+    <p>At lines <a href="#line6">6-11</a>, a couple of useful variables are defined :</p>
 
     <ul>
 
@@ -545,21 +545,21 @@
 
     </ul>
 
-    <p>Lines 13-14 defines a target that downloads the tarball from
+    <p>Lines <a href="#line13">13-14</a> defines a target that downloads the tarball from
     the remote site to the download directory
     (<code>DL_DIR</code>).</p>
 
-    <p>Lines 16-18 defines a target and associated rules that
+    <p>Lines <a href="#line16">16-18</a> defines a target and associated rules that
     uncompress the downloaded tarball. As you can see, this target
     depends on the tarball file, so that the previous target (line
-    13-14) is called before executing the rules of the current
+    <a href="#line13">13-14</a>) is called before executing the rules of the current
     target. Uncompressing is followed by <i>touching</i> a hidden file
     to mark the software has having been uncompressed. This trick is
     used everywhere in Buildroot <i>Makefile</i> to split steps
     (download, uncompress, configure, compile, install) while still
     having correct dependencies.</p>
 
-    <p>Lines 20-31 defines a target and associated rules that
+    <p>Lines <a href="#line20">20-31</a> defines a target and associated rules that
     configures the software. It depends on the previous target (the
     hidden <code>.source</code> file) so that we are sure the software has
     been uncompressed. In order to configure it, it basically runs the
@@ -571,14 +571,14 @@
     filesystem. Finally it creates a <code>.configured</code> file to
     mark the software as configured.</p>
 
-    <p>Lines 33-34 defines a target and a rule that compiles the
+    <p>Lines <a href="#line33">33-34</a> defines a target and a rule that compiles the
     software. This target will create the binary file in the
     compilation directory, and depends on the software being already
     configured (hence the reference to the <code>.configured</code>
     file). It basically runs <code>make</code> inside the source
     directory.</p>
 
-    <p>Lines 36-38 defines a target and associated rules that install
+    <p>Lines <a href="#line36">36-38</a> defines a target and associated rules that install
     the software inside the target filesystem. It depends on the
     binary file in the source directory, to make sure the software has
     been compiled. It uses the <code>install</code> target of the
@@ -589,7 +589,7 @@
     <code>/usr/man</code> directory inside the target filesystem is
     removed to save space.</p>
 
-    <p>Line 40 defines the main target of the software, the one
+    <p>Line <a href="#line40">40</a> defines the main target of the software, the one
     that will be eventually be used by the top level
     <code>Makefile</code> to download, compile, and then install
     this package. This target should first of all depends on all
@@ -598,7 +598,7 @@
     final binary. This last dependency will call all previous
     dependencies in the correct order. </p>
 
-    <p>Line 42 defines a simple target that only downloads the code
+    <p>Line <a href="#line42">42</a> defines a simple target that only downloads the code
     source. This is not used during normal operation of Buildroot, but
     is needed if you intend to download all required sources at once
     for later offline build. Note that if you add a new package providing
@@ -606,24 +606,24 @@
     users that wish to do offline-builds. Furthermore it eases checking
     if all package-sources are downloadable.</p>
 
-    <p>Lines 44-46 define a simple target to clean the software build
+    <p>Lines <a href="#line44">44-46</a> define a simple target to clean the software build
     by calling the <i>Makefiles</i> with the appropriate option.<br>
     The <code>clean</code> target should run <code>make clean</code>
     on $(BUILD_DIR)/package-version and MUST uninstall all files of the
     package from $(STAGING_DIR) and from $(TARGET_DIR).</p>
 
-    <p>Lines 48-49 define a simple target to completely remove the
+    <p>Lines <a href="#line48">48-49</a> define a simple target to completely remove the
     directory in which the software was uncompressed, configured and
     compiled. This target MUST completely rm $(BUILD_DIR)/package-version.</p>
 
-    <p>Lines 51-58 adds the target <code>foo</code> to the list
+    <p>Lines <a href="#line51">51-58</a> adds the target <code>foo</code> to the list
     of targets to be compiled by Buildroot by first checking if
     the configuration option for this package has been enabled
     using the configuration tool, and if so then "subscribes"
     this package to be compiled by adding it to the TARGETS
     global variable.  The name added to the TARGETS global
     variable is the name of this package's target, as defined on
-    line 40, which is used by Buildroot to download, compile, and
+    line <a href="#line40">40</a>, which is used by Buildroot to download, compile, and
     then install this package.</p>
 
 
