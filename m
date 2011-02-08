From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Feb 2011 08:45:42 +0100
Subject: [Buildroot] [PATCH 1/1] Do not mention
	toolchain/uClibc/uClibc.config-locale
In-Reply-To: <cover.1297151135.git.thomas.petazzoni@free-electrons.com>
References: <cover.1297151135.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6d62ddb2c67276b41031b90b8877c231cd9bca7c.1297151135.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uClibc configuration file toolchain/uClibc/uClibc.config-locale
does not exist anymore.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 8d74410..352962d 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -408,20 +408,20 @@
       the one used in the Linux kernel or Buildroot, appears. Make
       your configuration changes as appropriate.</li>
 
-      <li>Copy the <code>.config</code> file to
-      <code>toolchain/uClibc/uClibc.config</code> or
-      <code>toolchain/uClibc/uClibc.config-locale</code>. The former
-      is used if you haven't selected locale support in Buildroot
-      configuration, and the latter is used if you have selected
-      locale support.</li>
+      <li>Copy the <code>$(O)/toolchain/uclibc-VERSION/.config</code>
+      file to a different place
+      (like <code>toolchain/uClibc/uClibc-myconfig.config</code>,
+      or <code>board/mymanufacturer/myboard/uClibc.config</code>) and
+      adjust the uClibc configuration (configuration
+      option <code>BR2_UCLIBC_CONFIG</code>) to use this configuration
+      instead of the default one.</li>
 
       <li>Run the compilation of Buildroot again.</li>
     </ol>
 
     <p>Otherwise, you can simply change
-    <code>toolchain/uClibc/uClibc.config</code> or
-    <code>toolchain/uClibc/uClibc.config-locale</code>, without running
-    the configuration assistant.</p>
+    <code>toolchain/uClibc/uClibc.config</code>, without running the
+    configuration assistant.</p>
 
     <p>If you want to use an existing config file for uclibc, then see
     section <a href="#environment_variables">environment variables</a>.</p>
-- 
1.7.0.4
