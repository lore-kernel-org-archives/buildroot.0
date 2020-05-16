From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 05:37:31 +0000
Subject: [Buildroot] [Bug 12901] New: GObject introspection doesn't build on
 2020-05 rc1 (wrong path for g-ir-scanner)
Message-ID: <bug-12901-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12901

            Bug ID: 12901
           Summary: GObject introspection doesn't build on 2020-05 rc1
                    (wrong path for g-ir-scanner)
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: info at hifiberry.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Trying the 2020-05 release candidate, but can't get gobject introspection to
compile

[102/193] Generating Gst-1.0.gir with a custom command
FAILED: gst/Gst-1.0.gir
/home/matuschd/buildroot-2020.05-rc1/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/home/matuschd/buildroot-2020.05-rc1/output/host/bin/g-ir-scanner
-I/home/matuschd/buildroot-2020.05-rc1/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/home/matuschd/buildroot-2020.05-rc1/output/host/include/gobject-introspection-1.0
-I/home/matuschd/buildroot-2020.05-rc1/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/home/matuschd/buildroot-2020.05-rc1/output/host/include
-I/home/matuschd/buildroot-2020.05-rc1/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/home/matuschd/buildroot-2020.05-rc1/output/host/include/glib-2.0
-I/home/matuschd/buildroot-2020.05-rc1/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/home/matuschd/buildroot-2020.05-rc1/output/host/lib/glib-2.0/include
-pthread --no-libtool --namespace=Gst --nsversion=1.0 --warn-all --output
gst/Gst-1.0.gir '--add-init-section=extern void
gst_init(gint*,gchar**);g_setenv("GST_REGISTRY_DISABLE", "yes",
TRUE);g_setenv("GST_REGISTRY_1.0", "/no/way/this/exists.reg",
TRUE);g_setenv("GST_PLUGIN_PATH_1_0", "",
TRUE);g_setenv("GST_PLUGIN_SYSTEM_PATH_1_0", "", TRUE);gst_init(NULL,NULL);'
--quiet --c-include=gst/gst.h
-I/home/matuschd/buildroot-2020.05-rc1/output/build/gstreamer1-1.16.2/gst
-I/home/matuschd/buildroot-2020.05-rc1/output/build/gstreamer1-1.16.2/build/gst
-I./. -I../. -I./gst/parse -I../gst/parse
--filelist=/home/matuschd/buildroot-2020.05-rc1/output/build/gstreamer1-1.16.2/build/gst/b408f4a@@gstreamer-1.0 at sha/Gst_1.0_gir_filelist
--include=GLib-2.0 --include=GObject-2.0 --include=GModule-2.0
--symbol-prefix=gst --identifier-prefix=Gst --pkg-export=gstreamer-1.0
--cflags-begin -fvisibility=hidden -fno-strict-aliasing -DG_DISABLE_CAST_CHECKS
-DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -Wno-unused -Wmissing-declarations
-Wmissing-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wformat
-Wformat-nonliteral -Wformat-security -Wold-style-definition -Winit-self
-Wmissing-include-dirs -Waddress -Waggregate-return -Wno-multichar
-Wdeclaration-after-statement -Wvla -Wpointer-arith -I./. -I../. -I./gst/parse
-I../gst/parse
-I/home/matuschd/buildroot-2020.05-rc1/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/matuschd/buildroot-2020.05-rc1/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0
-I/home/matuschd/buildroot-2020.05-rc1/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/glib-2.0/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --cflags-end
--library gstreamer-1.0
-L/home/matuschd/buildroot-2020.05-rc1/output/build/gstreamer1-1.16.2/build/gst
-L/home/matuschd/buildroot-2020.05-rc1/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
--extra-library=gobject-2.0 --extra-library=glib-2.0 --extra-library=pcre
--extra-library=ffi --extra-library=gmodule-2.0 --extra-library=dl
--extra-library=m --sources-top-dirs
/home/matuschd/buildroot-2020.05-rc1/output/build/gstreamer1-1.16.2/subprojects/
--sources-top-dirs
/home/matuschd/buildroot-2020.05-rc1/output/build/gstreamer1-1.16.2/build/subprojects/
/bin/sh: 1:
/home/matuschd/buildroot-2020.05-rc1/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/home/matuschd/buildroot-2020.05-rc1/output/host/bin/g-ir-scanner:
not found
[103/193] Generating symbol file
'gst/b408f4a@@gstreamer-1.0 at sha/libgstreamer-1.0.so.0.1602.0.symbols'
ninja: build stopped: subcommand failed.

The make file is looking for g-ir-scanner at 
/home/matuschd/buildroot-2020.05-rc1/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/home/matuschd/buildroot-2020.05-rc1/output/host/bin/g-ir-scanner

However, the binary is at
/home/matuschd/buildroot-2020.05-rc1//output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/g-ir-scanner

It seems for some unknown reason, $HOME is inserted into the path which seems
to be incorrect

-- 
You are receiving this mail because:
You are on the CC list for the bug.
