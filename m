From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Feb 2016 16:10:26 +0000
Subject: [Buildroot] [Bug 8681] New: kbd 2.0.3 does not build on rpi
Message-ID: <bug-8681-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8681

            Bug ID: 8681
           Summary: kbd 2.0.3 does not build on rpi
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: buildroot at netsolux.ch
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

On rpi platform kbd 2.0.3 does not build.

I have the error :

for i in include sun amiga atari i386/azerty i386/bepo i386/dvorak i386/fgGIod
i386/qwerty i386/qwertz i386/include i386/olpc i386/colemak mac/include
mac/all; do \
        install -d -m 755 /data/b/buildroot/output/target/usr/share/keymaps/$i
;\
        install -m 644 keymaps_Z/$i/*
/data/b/buildroot/output/target/usr/share/keymaps/$i ;\
done
rm -f /data/b/buildroot/output/target/usr/share/keymaps/ppc; ln -s mac
/data/b/buildroot/output/target/usr/share/keymaps/ppc
make[4]: Leaving directory '/data/b/buildroot/output/build/kbd-2.0.3/data'
make[3]: Leaving directory '/data/b/buildroot/output/build/kbd-2.0.3/data'
make[2]: Leaving directory '/data/b/buildroot/output/build/kbd-2.0.3/data'
Making install in po
make[2]: Entering directory '/data/b/buildroot/output/build/kbd-2.0.3/po'
/bin/sh @MKINSTALLDIRS@ /data/b/buildroot/output/target/usr/share
/bin/sh: @MKINSTALLDIRS@: No such file or directory
Makefile:259: recipe for target 'install-data-yes' failed
make[2]: *** [install-data-yes] Error 127
make[2]: Leaving directory '/data/b/buildroot/output/build/kbd-2.0.3/po'
Makefile:439: recipe for target 'install-recursive' failed
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory '/data/b/buildroot/output/build/kbd-2.0.3'
package/pkg-generic.mk:276: recipe for target
'/data/b/buildroot/output/build/kbd-2.0.3/.stamp_target_installed' failed
make: *** [/data/b/buildroot/output/build/kbd-2.0.3/.stamp_target_installed]
Error 2


Works fine if i go back to version 1.15.5

Thanks in advance.

Bests regards,

-- 
You are receiving this mail because:
You are on the CC list for the bug.
